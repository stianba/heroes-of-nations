'use strict'

# To require coffee script files
require 'coffee-script/register'

# Require modules
express = require 'express'
http = require 'http'

# Setup server
app = express()

# Require routes
require('./app/routes')(app)

# Expose server app
module.exports = app

# Create and start server
server = http.createServer app
port = 8080
server.listen port, ->
  console.log "Server running on port #{port}"