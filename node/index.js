var os = require('os')
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`hostname: ${os.hostname()}`)
  console.log(`Example app listening on local ${port}`)
})