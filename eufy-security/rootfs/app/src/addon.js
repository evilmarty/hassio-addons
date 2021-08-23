const fetch = require('node-fetch')
const Bridge = require('./index')
const options = require('/data/options.json')

const res = await fetch('http://supervisor/services/mqtt', {
  headers: {
    'Authorization': `Bearer ${process.env.SUPERVISOR_TOKEN}`,
  },
})
const payload = await res.json()

if (payload.result !== 'ok') {
  console.error('Invalid response from supervisor', payload)
}

options.mqttUsername = payload.data.username
options.mqttPassword = payload.data.password
options.mqttHost = payload.data.host
options.mqttPort = payload.data.port

new Bridge(options)
