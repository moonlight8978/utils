import React from 'react'
import ReactDOM from 'react-dom'

import monkeyPatching from './services/monkey-patching'
import App from './app'

monkeyPatching()
ReactDOM.render(<App />, document.getElementById('root'))
