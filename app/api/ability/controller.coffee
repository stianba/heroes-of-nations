'use strict'

fs = require 'fs'
Deferred = require('promised-io/promise').Deferred

exports.index = ->
  deferred = new Deferred()

  fs.readFile 'data/abilities.json', (err, data) ->
    deferred.resolve JSON.parse data

  deferred.promise

exports.show = (id) ->
  deferred = new Deferred()

  fs.readFile 'data/abilities.json', (err, data) ->
    jsonData = JSON.parse data

    for ability in jsonData
      return deferred.resolve ability if ability._id is id.toLowerCase()

    deferred.resolve (
      status: 404
      message: "No ability found."
    )

  deferred.promise