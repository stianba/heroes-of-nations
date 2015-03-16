'use strict'

express = require 'express'
controller = require './controller'

router = express.Router()

router.get '/', (req, res) ->
  controller.index()
    .then (data) ->
      res.json data

router.get '/:id', (req, res) ->
  controller.show(req.params.id)
    .then (data) ->
      res.json data

module.exports = router