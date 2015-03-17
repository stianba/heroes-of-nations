'use strict'

# To require coffee script files
require 'coffee-script/register'

# Require modules
express = require 'express'
http = require 'http'
mongoose = require 'mongoose'
bodyParser = require 'body-parser'

# Connect to mongodb server
mongoose.connect 'mongodb://localhost:27017/heroes-of-nations'

# Setup server
app = express()

app.use bodyParser.json()

# Require routes
require('./app/routes')(app)

# Expose server app
module.exports = app

# Create and start server
server = http.createServer app
port = 8080
server.listen port, ->
  console.log "Server running on port #{port}"