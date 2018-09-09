const path = require('path')
const fs = require('fs')

const iconsDir = path.join(__dirname, 'public', 'assets', 'icon')

const run = () => {
  const files = fs.readdirSync(iconsDir)
  files.forEach(file => {
    const id = extractId(file)
    id && console.log(id)
  })
}

const extractId = fileName => {
  const matches = fileName.match(/\d+/)
  return matches && matches[0]
}
run()