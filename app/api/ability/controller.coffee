'use strict'

fs = require 'fs'
Deferred = require('promised-io/promise').Deferred

class AbilitiesController
  constructor: ->
    @dataFile = 'data/abilities.json'

  index: ->
    deferred = new Deferred()

    fs.readFile @dataFile, (err, data) ->
      deferred.resolve JSON.parse data

    deferred.promise

  show: (id) ->
    deferred = new Deferred()

    fs.readFile @dataFile, (err, data) ->
      jsonData = JSON.parse data

      for ability in jsonData
        return deferred.resolve ability if ability._id is id.toLowerCase()

      deferred.resolve (
        status: 404
        message: "No ability found."
      )

    deferred.promise

module.exports = AbilitiesController
