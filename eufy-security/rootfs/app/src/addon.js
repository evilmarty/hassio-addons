const fetch = require('node-fetch')
const Bridge = require('./index')
const options = require('/data/options.json')
const headers = {
  'Authorization': `Bearer ${process.env.SUPERVISOR_TOKEN}`,
}

fetch('http://supervisor/services/mqtt', { headers })
  .then(res => res.json())
  .then(({ result, data }) => {
    if (result !== 'ok') {
      throw new Error(`Invalid supervisor response: ${payload}`)
    }

    const protocol = data.ssl ? 'mqtts' : 'mqtt'
    options.mqttUrl = `${protocol}://${data.host}:${data.port}`
    options.mqttUsername = data.username
    options.mqttPassword = data.password

    new Bridge(options)
  })
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
