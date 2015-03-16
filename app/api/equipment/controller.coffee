'use strict'

fs = require 'fs'
Deferred = require('promised-io/promise').Deferred

class EquipmentController
  constructor: ->
    @dataFile = 'data/equipment.json'

  index: ->
    deferred = new Deferred()

    fs.readFile @dataFile, (err, data) ->
      deferred.resolve JSON.parse data

    deferred.promise

  show: (id) ->
    deferred = new Deferred()

    fs.readFile @dataFile, (err, data) ->
      jsonData = JSON.parse data

      for equipment in jsonData
        return deferred.resolve equipment if equipment._id is id.toLowerCase()

      deferred.resolve (
        status: 404
        message: "No equipment found."
      )

    deferred.promise

module.exports = EquipmentController
