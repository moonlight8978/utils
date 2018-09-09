import _ from 'lodash'

import WeightedRandomUnits from './gacha/weighted-random-units'
import RNG from './gacha/rng'

class Gacha {
  constructor(groupedUnits, metadata, rateUpUnit = null) {
    this.groupedUnits = groupedUnits
    this.rateUpUnit = rateUpUnit
    this.metadata = metadata
  }

  roll(times = 1) {
    const gachaPool = this.flattenUnits()
    const rates = this.calculateUnitRates()
    
    const weightedRandomUnits = new WeightedRandomUnits(gachaPool, rates)
    const results = Array.contains(times).elements().map(() => {
      const randomNumber = RNG.random()
      return weightedRandomUnits.unitFor(randomNumber)
    })
    return results
  }

  flattenUnits() {
    let gachaPool = []
    const { oneStar, twoStars, threeStars, exclusive } = this.groupedUnits
    gachaPool.push(oneStar, twoStars, threeStars, exclusive)
    return _.flatten(gachaPool)
  }

  calculateUnitRates() {
    const { oneStar, twoStars, threeStars, exclusive } = this.groupedUnits
    let [oneStarQuantity, twoStarsQuantity, threeStarsQuantity] = [
      oneStar, twoStars, threeStars
    ].map(units => units.length)
    exclusive.forEach(unit => {
      switch (unit.rarity) {
        case 1:
          oneStarQuantity += 1
          break
        case 2:
          twoStarsQuantity += 1
          break
        case 3:
          threeStarsQuantity += 1
          break
        default:
          break
      }
    })
    return {
      oneStar: this.metadata.oneStar / oneStarQuantity,
      twoStars: this.metadata.twoStars / twoStarsQuantity,
      threeStars: this.metadata.threeStars / threeStarsQuantity
    }
  }
}

export default Gacha