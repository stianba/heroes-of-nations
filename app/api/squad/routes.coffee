'use strict'

express = require 'express'
SquadController = require './controller'

router = express.Router()
squadController = new SquadController()

router.get '/', (req, res) ->
  squadController
    .index()
    .then (data) ->
      res.send data

router.post '/', (req, res) ->
  squadController
    .create(req.body)
    .then (data) ->
      res.json data

module.exports = router