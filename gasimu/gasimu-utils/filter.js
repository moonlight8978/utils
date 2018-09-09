const _ = require('lodash')

const writeData = require('./json-writer')
const units = require('./data.json')

const filter = units => units.filter(unit => unit.rarity !== 0)

const group = units => {
  units = units.slice()
  const exclusive = _.remove(units, unit => unit.unit_name.match(/（サマー）/))
  const oneStar = _.remove(units, unit => unit.rarity === 1)
  const twoStars = _.remove(units, unit => unit.rarity === 2)

  return {
    exclusive,
    oneStar,
    twoStars,
    threeStars: units
  }
}

const run = () => {
  const ingameUnits = filter(units)
  const groupedUnits = group(ingameUnits)
  writeData('grouped_data.json', groupedUnits)
}

run()