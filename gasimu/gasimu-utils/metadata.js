const writeData = require('./json-writer')

const RATE = {
  oneStar: 80.0,
  twoStars: 18.0,
  threeStars: 2.0,
  total: 100.0
}

const run = () => {
  writeData('metadata.json', RATE)
}

run()