'use strict'

fs = require 'fs'
Deferred = require('promised-io/promise').Deferred

class ClassesController
  constructor: ->
    @dataFile = 'data/classes.json'

  index: ->
    deferred = new Deferred()

    fs.readFile @dataFile, (err, data) ->
      deferred.resolve JSON.parse data

    deferred.promise

  show: (id) ->
    deferred = new Deferred()

    fs.readFile @dataFile, (err, data) ->
      jsonData = JSON.parse data

      for charClass in jsonData
        return deferred.resolve charClass if charClass._id is id.toLowerCase()

      deferred.resolve (
        status: 404
        message: "No class found."
      )

    deferred.promise

module.exports = ClassesController
