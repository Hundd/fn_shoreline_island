// Static SVG rasterization for review; no browser or script execution.
const path = require('path');
const sharp = require('C:/Users/Andrii_Polchaninov/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/sharp');
sharp(path.join(__dirname, '../generated/preview.svg'))
  .png()
  .toFile(path.join(__dirname, 'preview-review.png'))
  .then(info => console.log(JSON.stringify(info)))
  .catch(error => { console.error(error.message); process.exitCode = 1; });
