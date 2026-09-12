// Requires playwright and sharp. Set NODE_PATH to their installation directory.
const fs=require('fs'), path=require('path'), http=require('http');
const {chromium}=require('playwright'), sharp=require('sharp');
const root=path.resolve(__dirname,'..');
const palette=require('./preview-palette.json');
const server=http.createServer((req,res)=>{
  const file=path.resolve(root,'.'+decodeURIComponent(req.url.split('?')[0]));
  if(!file.startsWith(root+path.sep)){res.writeHead(403).end();return;}
  fs.readFile(file,(err,data)=>{if(err){res.writeHead(404).end();return;}res.setHeader('Content-Type',file.endsWith('.html')?'text/html':file.endsWith('.png')?'image/png':file.endsWith('.json')?'application/json':'text/xml');res.end(data);});
});
const luminance=rgb=>rgb.map(c=>{c/=255;return c<=.04045?c/12.92:((c+.055)/1.055)**2.4;}).reduce((s,v,i)=>s+v*[.2126,.7152,.0722][i],0);
const contrast=(a,b)=>(Math.max(a,b)+.05)/(Math.min(a,b)+.05);
(async()=>{
 await new Promise(r=>server.listen(0,'127.0.0.1',r));
 const browser=await chromium.launch({headless:true,executablePath:process.env.PREVIEW_BROWSER||'C:/Program Files/Google/Chrome/Application/chrome.exe'});
 try {
 const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
 await page.goto(`http://127.0.0.1:${server.address().port}/Art/preview.html`); await page.evaluate(()=>window.ready);
 const cdp=await page.context().newCDPSession(page); await cdp.send('DOM.enable'); await cdp.send('CSS.enable');
 const {root:dom}=await cdp.send('DOM.getDocument');
 const fonts={};
 for(const selector of ['.strong','.suffix','.tag','p','.version']){
 const {nodeId}=await cdp.send('DOM.querySelector',{nodeId:dom.nodeId,selector});
 fonts[selector]=(await cdp.send('CSS.getPlatformFontsForNode',{nodeId})).fonts;
 }
 const boxes=await page.evaluate(()=>Object.fromEntries(['.strong','.suffix','.tag','p','.version'].map(s=>{const r=document.querySelector(s).getBoundingClientRect();return[s,{x:r.x,y:r.y,width:r.width,height:r.height}];})));
 const png=await page.screenshot();
 await sharp(png).png({compressionLevel:9}).toFile(path.join(root,'Mod/About/Preview.png'));
 await sharp(png).resize(268).png().toFile(path.join(__dirname,'preview-268.png'));
 await page.evaluate(()=>document.body.classList.add('background-only'));
 const bg=await page.screenshot(); await fs.promises.writeFile(path.join(__dirname,'preview-background.png'),bg);
 const {data,info}=await sharp(bg).removeAlpha().raw().toBuffer({resolveWithObject:true});
 const ratios={};
 for(const [selector,r] of Object.entries(boxes)){
 const hex=palette[selector==='.version'?'badgeInk':selector==='.tag'||selector==='.suffix'?'inkSecondary':'inkPrimary'];
 const ink=luminance(hex.match(/\w\w/g).map(v=>parseInt(v,16)));
 let min=Infinity;
 // Check every pixel behind each text rectangle, stronger than corner sampling.
 if(selector==='.version') min=contrast(ink,luminance(palette.accent.match(/\w\w/g).map(v=>parseInt(v,16))));
 else for(let y=Math.floor(r.y);y<Math.ceil(r.y+r.height);y++)for(let x=Math.floor(r.x);x<Math.ceil(r.x+r.width);x++){const i=(y*info.width+x)*3;min=Math.min(min,contrast(ink,luminance([...data.subarray(i,i+3)])));}
 ratios[selector]=Number(min.toFixed(3));
 }
 const report={size:[896,504],bytes:fs.statSync(path.join(root,'Mod/About/Preview.png')).size,version:await page.locator('.version').textContent(),fonts,boxes,minimumContrast:ratios,source:'Art/Preview.png',palette:'Art/preview-palette.json'};
 fs.writeFileSync(path.join(__dirname,'preview-qa.json'),JSON.stringify(report,null,2)+'\n');
 console.log(JSON.stringify(report,null,2));
 if(Object.values(ratios).some(r=>r<4.5)||report.bytes>=900000)throw Error('Preview QA failed');
 }finally{await browser.close();}
})().catch(e=>{console.error(e);process.exitCode=1;}).finally(()=>server.close());
