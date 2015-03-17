'use strict'

express = require 'express'
HeroController = require './controller'

router = express.Router()
heroController = new HeroController()

router.get '/', (req, res) ->
  heroController.index()
    .then (data) ->
      res.json data

router.post '/', (req, res) ->
  heroController.create(req.body)
    .then (data) ->
      res.json data

module.exports = router