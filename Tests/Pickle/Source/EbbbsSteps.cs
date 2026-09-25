using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using RimWorks.Pickle;
using RimWorld;
using Verse;

namespace EbbbsRenew.PickleSteps
{
    /// <summary>
    /// What Pickle's own steps cannot say about this mod. Every text starts with "Ebbbs Renew:", because
    /// Pickle loads the steps of every active suite into one namespace and two suites declaring the same
    /// text make healthy scenarios fail with "Ambiguous step". No text here uses parentheses or slashes,
    /// which Cucumber expressions read as optional text and alternatives.
    ///
    /// Why not Pickle's own def steps. Every one of the nine species is TWO defs with the same defName, a
    /// ThingDef and a PawnKindDef. Pickle's "def X field Y is Z" and "def X raw stat Y is Z" look a name up
    /// across every def database and throw when it names more than one def, so they cannot be used here at
    /// all. These steps name the def type.
    /// </summary>
    [PickleSteps]
    public class EbbbsSteps
    {
        // ---------------------------------------------------------------- starting up

        /// <summary>
        /// Waits until the game has finished starting: back at the menu, with no long event running. Pickle's
        /// own "the main menu is open" gives a step five seconds, and the first scenario of a pass sits
        /// right at that limit: it took 4.4 s in a plain pass, and 5.2 s with the original mod beside this
        /// one, whose extra defs and load errors slow the start, which failed the incompatibility pass on its
        /// first step. Every scenario that starts from the menu says this first, with a deadline that a slow
        /// start cannot reach.
        /// </summary>
        [Given("Ebbbs Renew: the game has finished starting", TimeoutSeconds = 125f)]
        public async Task GameHasFinishedStarting(PickleContext ctx)
        {
            await ctx.WaitUntil(
                () => Current.ProgramState == ProgramState.Entry && !LongEventHandler.AnyEventNowOrWaiting,
                120f);
        }

        // ---------------------------------------------------------------- the log

        /// <summary>
        /// The test companion's own name. It is "Ebbbs Renew - Pickle tests", so any message the game logs
        /// about the companion contains "ebbb" and, when it quotes a dependency, this mod's packageId. Two
        /// such messages are normal for a companion that only holds features: one warning that a dependency
        /// declares no download URL, and one error that the mod "did not load any content". The first run
        /// of this suite failed two scenarios on exactly those. They are about the harness, not about the
        /// mod under test, so they are left out of what these steps read.
        /// </summary>
        private const string Companion = "Ebbbs Renew - Pickle tests";

        private static List<string> ErrorsAndWarnings()
        {
            return Log.Messages
                .Where(m => m.type == LogMessageType.Error || m.type == LogMessageType.Warning)
                .Select(m => m.text ?? string.Empty)
                .Where(text => text.IndexOf(Companion, StringComparison.OrdinalIgnoreCase) < 0)
                .ToList();
        }

        private static string FirstLine(string text)
        {
            int cut = text.IndexOf('\n');
            return cut < 0 ? text : text.Substring(0, cut);
        }

        /// <summary>
        /// Pickle's "no errors were logged" reads what is logged after a scenario is armed, and arming clears
        /// the buffer, so an error the game logged while it LOADED THE DEFS is gone before the first step.
        /// The lines are still in RimWorld's own log, Verse.Log.Messages, so this reads that. Case
        /// insensitive, errors and warnings both. The log is bounded, which is why every pass stages a small set.
        /// </summary>
        [Then("Ebbbs Renew: nothing logged as an error or a warning names {string}")]
        public void NothingNames(PickleContext ctx, string text)
        {
            List<string> hits = ErrorsAndWarnings()
                .Where(line => line.IndexOf(text, StringComparison.OrdinalIgnoreCase) >= 0)
                .ToList();
            ctx.Assert(
                hits.Count == 0,
                "expected nothing logged as an error or a warning to name '" + text + "'; got " + hits.Count + ": "
                + string.Join(" | ", hits.Take(3).Select(FirstLine)));
        }

        /// <summary>
        /// Passes when something logged as an error or a warning contains both texts. It is here for the
        /// declared incompatibility: whatever the game logs when two mods define the same def is the symptom
        /// the About.xml declaration is about.
        /// </summary>
        [Then("Ebbbs Renew: an error or a warning was logged naming {string} and {string}")]
        public void SomethingNamesBoth(PickleContext ctx, string first, string second)
        {
            List<string> all = ErrorsAndWarnings();
            bool found = all.Any(line =>
                line.IndexOf(first, StringComparison.OrdinalIgnoreCase) >= 0
                && line.IndexOf(second, StringComparison.OrdinalIgnoreCase) >= 0);
            ctx.Assert(
                found,
                "expected an error or a warning naming '" + first + "' and '" + second + "'; the log holds "
                + all.Count + " of them: " + string.Join(" | ", all.Take(5).Select(FirstLine)));
        }

        // ---------------------------------------------------------------- loaded defs, by type and name

        private static Def FindDef(PickleContext ctx, string typeName, string defName)
        {
            foreach (Type type in GenDefDatabase.AllDefTypesWithDatabases())
            {
                if (!string.Equals(type.Name, typeName, StringComparison.OrdinalIgnoreCase))
                {
                    continue;
                }

                Def def = GenDefDatabase.GetDefSilentFail(type, defName, false);
                ctx.Require(def != null, "no " + typeName + " named '" + defName + "' is loaded");
                return def;
            }

            throw new InvalidOperationException("no def database for type '" + typeName + "'");
        }

        /// <summary>Walks a dotted path of public fields and properties. Null when any link is null.</summary>
        private static object Walk(object start, string path)
        {
            object current = start;
            foreach (string segment in path.Split('.'))
            {
                if (current == null)
                {
                    return null;
                }

                const BindingFlags flags = BindingFlags.Public | BindingFlags.Instance;
                Type type = current.GetType();
                FieldInfo field = type.GetField(segment, flags);
                if (field != null)
                {
                    current = field.GetValue(current);
                    continue;
                }

                PropertyInfo property = type.GetProperty(segment, flags);
                if (property == null)
                {
                    throw new InvalidOperationException("'" + segment + "' is not a public field or property of " + type.Name);
                }

                current = property.GetValue(current, null);
            }

            return current;
        }

        /// <summary>
        /// Reads a value off a loaded def by a dotted path and compares it, case insensitively, with the text.
        /// The type is a def type such as ThingDef, PawnKindDef or BodyDef: the same name is a ThingDef and a
        /// PawnKindDef for every species here, which Pickle's own step refuses to choose between.
        /// </summary>
        [Then("Ebbbs Renew: the {word} {string} reads {string} as {string}")]
        public void ReadsAs(PickleContext ctx, string typeName, string defName, string path, string expected)
        {
            Def def = FindDef(ctx, typeName, defName);
            string actual = Walk(def, path)?.ToString() ?? "(null)";
            ctx.Assert(
                string.Equals(actual, expected, StringComparison.OrdinalIgnoreCase),
                typeName + " '" + defName + "' reads '" + path + "' as '" + actual + "', expected '" + expected + "'");
        }

        /// <summary>
        /// The statBases entry itself, not the computed stat. The fault this port exists to fix was a
        /// wildness the game never read: a species without the entry falls back to the stat's default, -1,
        /// and looks perfectly normal, so a missing entry fails here instead of comparing a default.
        /// </summary>
        [Then("Ebbbs Renew: the ThingDef {string} has the stat {string} at {float}")]
        public void HasStatAt(PickleContext ctx, string defName, string statName, float expected)
        {
            ThingDef def = (ThingDef)FindDef(ctx, "ThingDef", defName);
            StatDef stat = DefDatabase<StatDef>.GetNamedSilentFail(statName);
            ctx.Require(stat != null, "no StatDef named '" + statName + "' is loaded");
            StatModifier entry = def.statBases == null ? null : def.statBases.FirstOrDefault(m => m.stat == stat);
            ctx.Require(
                entry != null,
                "ThingDef '" + defName + "' has no statBases entry for '" + statName + "'; it falls back to the stat's default of "
                + stat.defaultBaseValue);
            ctx.Assert(
                Math.Abs(entry.value - expected) < 0.0001f,
                "ThingDef '" + defName + "' statBases '" + statName + "' is " + entry.value + ", expected " + expected);
        }

        /// <summary>A melee tool of the species carries this label, as the game holds it after translation.</summary>
        [Then("Ebbbs Renew: the ThingDef {string} has a tool labelled {string}")]
        public void HasToolLabelled(PickleContext ctx, string defName, string label)
        {
            ThingDef def = (ThingDef)FindDef(ctx, "ThingDef", defName);
            List<string> labels = def.tools == null ? new List<string>() : def.tools.Select(t => t.label ?? string.Empty).ToList();
            ctx.Assert(
                labels.Any(l => string.Equals(l, label, StringComparison.OrdinalIgnoreCase)),
                "ThingDef '" + defName + "' has no tool labelled '" + label + "'; its tools are: " + string.Join(", ", labels));
        }

        /// <summary>
        /// A part of the body plan carries this label, as the health tab shows it. The label of a part is its
        /// custom label when it has one and its def's label otherwise.
        /// </summary>
        [Then("Ebbbs Renew: the BodyDef {string} has a part labelled {string}")]
        public void HasPartLabelled(PickleContext ctx, string defName, string label)
        {
            BodyDef body = (BodyDef)FindDef(ctx, "BodyDef", defName);
            List<string> labels = body.AllParts.Select(p => p.Label ?? string.Empty).ToList();
            ctx.Assert(
                labels.Any(l => string.Equals(l, label, StringComparison.OrdinalIgnoreCase)),
                "BodyDef '" + defName + "' has no part labelled '" + label + "'; its parts are: " + string.Join(", ", labels));
        }

        /// <summary>A life stage of the kind reads this value on the given field, label or labelPlural.</summary>
        [Then("Ebbbs Renew: the PawnKindDef {string} has a life stage whose {word} is {string}")]
        public void HasLifeStageWith(PickleContext ctx, string defName, string field, string expected)
        {
            PawnKindDef kind = (PawnKindDef)FindDef(ctx, "PawnKindDef", defName);
            List<string> values = kind.lifeStages == null
                ? new List<string>()
                : kind.lifeStages.Select(s => Walk(s, field)?.ToString() ?? "(null)").ToList();
            ctx.Assert(
                values.Any(v => string.Equals(v, expected, StringComparison.OrdinalIgnoreCase)),
                "PawnKindDef '" + defName + "' has no life stage whose " + field + " is '" + expected + "'; they read: "
                + string.Join(", ", values));
        }

        // ---------------------------------------------------------------- surgery recipes

        private static List<string> RecipesOf(PickleContext ctx, string defName, string recipeName)
        {
            ThingDef def = (ThingDef)FindDef(ctx, "ThingDef", defName);
            ctx.Require(
                DefDatabase<RecipeDef>.GetNamedSilentFail(recipeName) != null,
                "no RecipeDef named '" + recipeName + "' is loaded: is the mod that defines it staged in this pass?");
            return def.AllRecipes.Select(r => r.defName).ToList();
        }

        /// <summary>
        /// The species is a user of the recipe, the way the health tab offers it: through ThingDef.AllRecipes,
        /// which is built from every recipe's recipeUsers once the defs have resolved. This is what the
        /// compatibility patch for A Dog Said 2 has to end up doing, and it only does when the patch ran
        /// before that mod copied its category lists into its real recipes.
        /// </summary>
        [Then("Ebbbs Renew: the ThingDef {string} can be operated on with {string}")]
        public void CanBeOperatedOnWith(PickleContext ctx, string defName, string recipeName)
        {
            List<string> recipes = RecipesOf(ctx, defName, recipeName);
            ctx.Assert(
                recipes.Contains(recipeName),
                "ThingDef '" + defName + "' cannot be operated on with '" + recipeName + "'; it has " + recipes.Count + " recipes");
        }

        /// <summary>The other half: a species below the category of a recipe must not be offered it.</summary>
        [Then("Ebbbs Renew: the ThingDef {string} cannot be operated on with {string}")]
        public void CannotBeOperatedOnWith(PickleContext ctx, string defName, string recipeName)
        {
            List<string> recipes = RecipesOf(ctx, defName, recipeName);
            ctx.Assert(
                !recipes.Contains(recipeName),
                "ThingDef '" + defName + "' can be operated on with '" + recipeName + "', which its category should not offer");
        }

        // ---------------------------------------------------------------- butchering

        /// <summary>
        /// Generates an adult of the kind on the loaded map, kills it and asks the game what butchering it
        /// leaves. The amounts are asked at an efficiency of 100, so that a small animal's fractional meat
        /// or leather cannot round to nothing by chance: what is asserted is that the product is wired to
        /// the species, not how much of it a real butcher would get. The thrumebbb's horn comes from the
        /// body part group of its adult life stage and is not scaled, which is why the pawn is made an adult.
        ///
        /// The pawn is spawned by this step and not by Pickle's spawn step, because Pickle's steps refer to a
        /// pawn by its nickname and an animal has none.
        /// </summary>
        [Then("Ebbbs Renew: butchering an adult {string} leaves {string}")]
        public void ButcheringLeaves(PickleContext ctx, string kindName, string productName)
        {
            PawnKindDef kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(kindName);
            ctx.Require(kind != null, "no PawnKindDef named '" + kindName + "' is loaded");
            ThingDef product = DefDatabase<ThingDef>.GetNamedSilentFail(productName);
            ctx.Require(product != null, "no ThingDef named '" + productName + "' is loaded");
            Map map = Find.CurrentMap;
            ctx.Require(map != null, "no map is loaded: butchering needs the colony fixture");

            Pawn pawn = PawnGenerator.GeneratePawn(kind, null);
            float adultAge = kind.RaceProps.lifeStageAges.Last().minAge;
            pawn.ageTracker.AgeBiologicalTicks = (long)(adultAge * 3600000f) + 1L;
            ctx.Require(
                pawn.ageTracker.CurLifeStageIndex == kind.RaceProps.lifeStageAges.Count - 1,
                "the " + kindName + " is not in its last life stage after being set to age " + adultAge);

            IntVec3 cell = CellFinder.RandomClosewalkCellNear(map.Center, map, 12);
            GenSpawn.Spawn(pawn, cell, map);
            pawn.Kill(null);

            Thing butchered = (Thing)pawn.Corpse ?? pawn;
            Pawn butcher = map.mapPawns.FreeColonists.FirstOrDefault();
            List<Thing> products = butchered.ButcherProducts(butcher, 100f).ToList();
            try
            {
                ctx.Assert(
                    products.Any(t => t.def == product),
                    "butchering an adult '" + kindName + "' left " + (products.Count == 0
                        ? "nothing"
                        : string.Join(", ", products.Select(t => t.stackCount + " " + t.def.defName)))
                    + ", not '" + productName + "'");
            }
            finally
            {
                foreach (Thing t in products)
                {
                    if (!t.Destroyed)
                    {
                        t.Destroy();
                    }
                }

                if (pawn.Corpse != null && !pawn.Corpse.Destroyed)
                {
                    pawn.Corpse.Destroy();
                }
            }
        }
    }
}
