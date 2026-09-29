const sharp = require('sharp');

const SRC = process.argv[2];
const OUT = process.argv[3];
const TOL = Number(process.argv[4] || 26);

async function main() {
  const { data, info } = await sharp(SRC).ensureAlpha().raw().toBuffer({ resolveWithObject: true });
  const { width, height, channels } = info;
  const bg = new Uint8Array(width * height);
  const visited = new Uint8Array(width * height);
  const stack = [];

  function idx(x, y) { return y * width + x; }
  function px(x, y, c) { return data[idx(x, y) * channels + c]; }

  for (let x = 0; x < width; x++) { stack.push([x, 0]); stack.push([x, height - 1]); }
  for (let y = 0; y < height; y++) { stack.push([0, y]); stack.push([width - 1, y]); }

  while (stack.length) {
    const [x, y] = stack.pop();
    if (x < 0 || y < 0 || x >= width || y >= height) continue;
    const i = idx(x, y);
    if (visited[i]) continue;
    visited[i] = 1;
    bg[i] = 1;
    const r0 = px(x, y, 0), g0 = px(x, y, 1), b0 = px(x, y, 2);
    const neighbors = [[x+1,y],[x-1,y],[x,y+1],[x,y-1]];
    for (const [nx, ny] of neighbors) {
      if (nx < 0 || ny < 0 || nx >= width || ny >= height) continue;
      const ni = idx(nx, ny);
      if (visited[ni]) continue;
      const r1 = px(nx, ny, 0), g1 = px(nx, ny, 1), b1 = px(nx, ny, 2);
      const d = Math.abs(r0 - r1) + Math.abs(g0 - g1) + Math.abs(b0 - b1);
      if (d <= TOL) stack.push([nx, ny]);
    }
  }

  let cut = 0;
  for (let i = 0; i < width * height; i++) {
    if (bg[i]) { data[i * channels + 3] = 0; cut++; }
  }
  console.log('background pixels cut:', cut, '/', width * height);

  await sharp(data, { raw: { width, height, channels } }).png().toFile(OUT);
}

main().catch(e => { console.error(e); process.exit(1); });
