'use strict'

express = require 'express'
ClassesController = require './controller'

router = express.Router()
classesController = new ClassesController()

router.get '/', (req, res) ->
  classesController.index()
    .then (data) ->
      res.json data

router.get '/:id', (req, res) ->
  classesController.show(req.params.id)
    .then (data) ->
      res.json data

module.exports = router