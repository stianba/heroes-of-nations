'use strict'

fs = require 'fs'
Deferred = require('promised-io/promise').Deferred

exports.index = ->
  deferred = new Deferred()

  fs.readFile 'data/equipment.json', (err, data) ->
    deferred.resolve JSON.parse data

  deferred.promise

exports.show = (id) ->
  deferred = new Deferred()

  fs.readFile 'data/equipment.json', (err, data) ->
    jsonData = JSON.parse data

    for equipment in jsonData
      return deferred.resolve equipment if equipment._id is id.toLowerCase()

    deferred.resolve (
      status: 404
      message: "No equipment found."
    )

  deferred.promise