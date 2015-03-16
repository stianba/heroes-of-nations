'use strict'

module.exports = (app) ->
  # Home
  app.get '/', (req, res) ->
    res.send "Welcome to the Heroes of Nations API"

  # Abilities
  app.use '/ability', require './api/ability/routes'

  # Equipment
  app.use '/equipment', require './api/equipment/routes'