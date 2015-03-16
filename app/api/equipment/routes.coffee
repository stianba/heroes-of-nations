'use strict'

express = require 'express'
EquipmentController = require './controller'

router = express.Router()
equipmentController = new EquipmentController()

router.get '/', (req, res) ->
  equipmentController.index()
    .then (data) ->
      res.json data

router.get '/:id', (req, res) ->
  equipmentController.show(req.params.id)
    .then (data) ->
      res.json data

module.exports = router