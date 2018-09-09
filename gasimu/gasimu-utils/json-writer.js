const fs = require('fs')

const writeData = (fileName, data) => {
  const serializedData = JSON.stringify(data, null, 4)
  fs.writeFileSync(fileName, serializedData)
}

module.exports = writeData