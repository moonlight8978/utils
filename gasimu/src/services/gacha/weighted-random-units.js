class WeightedRandomUnits {
  constructor(units, rates) {
    this.accumulatedWeight = 0
    this.rates = rates
    this.units = []
    units.forEach(unit => this.addUnit(unit))
  }

  addUnit(object) {
    const unitRate = (() => {
      switch (object.rarity) {
        case 1:
          return this.rates.oneStar
        case 2:
          return this.rates.twoStars
        default:
          return this.rates.threeStars
      }
    })()
    this.accumulatedWeight += unitRate
    const unit = new Unit(object, this.accumulatedWeight)
    this.units.push(unit)
  }

  unitFor(randomNumber) {
    const bingo = this.units.find(unit => unit.weight >= randomNumber)
    return bingo.object
  }
}

class Unit {
  constructor(object, weight) {
    this.object = object
    this.weight = weight
  }
}

export default WeightedRandomUnits