'use strict'

express = require 'express'
AbilitiesController = require './controller'

router = express.Router()
abilitiesController = new AbilitiesController()

router.get '/', (req, res) ->
  abilitiesController.index().then (data) ->
    res.json data

router.get '/:id', (req, res) ->
  abilitiesController.show(req.params.id).then (data) ->
    res.json data

module.exports = router