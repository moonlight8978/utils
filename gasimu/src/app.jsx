import React from 'react'

import Api from './services/api'
import Gacha from './services/gacha'

class App extends React.PureComponent {
  state = {
    loading: true,
    units: [],
    metadata: {},
    error: false,
    results: []
  }

  async componentDidMount() {
    try {
      const [units, metadata] = await Promise.all([Api.all(), Api.metadata()])
      this.setState({ units, metadata, loading: false })
    } catch(error) {
      this.setState({ loading: false, error: true })
      console.log(error)
    }
  }

  render() {
    const { results, loading, error } = this.state

    let content
    if (loading) {
      content = <div>Loading...</div>
    } else {
      content = <div>
        <button onClick={() => this.roll(1)}>1回まわす</button>
        <button onClick={() => this.roll(10)}>10回まわす</button>

        {results.length ? results.map((unit, index) => this.renderUnit(unit, index)) : null}
      </div>
    }

    return <React.Fragment>
      {content}
    </React.Fragment>
  }

  roll = times => {
    const { units, metadata } = this.state
    const gachaSimulator = new Gacha(units, metadata, { unit_id: 103701, unit_name: "トモ", rarity: 3 })
    const results = gachaSimulator.roll(times)
    this.setState({ results })
  }

  renderUnit = ({ unit_id, unit_name, rarity }, index) => {
    const imgId = rarity === 3 ? unit_id + 30 : unit_id + 10
    return <img
      src={`assets/icon/icon_unit_${imgId}.png`}
      key={[unit_id, index]}
      alt={unit_name}
      style={{ width: 75, height: 75 }}
    />
  }
}

export default App