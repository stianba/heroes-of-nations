'use strict'

Deferred = require('promised-io/promise').Deferred
Squad = require './model'

class SquadController
  index: ->
    deferred = new Deferred()

    Squad
      .find (err, squads) ->
        return deferred.resolve err if err
        deferred.resolve squads

    deferred.promise

  create: (body) ->
    deferred = new Deferred()
    squad = new Squad()

    log = []

    # Populate Squad object with json data from request body

    squad.player = body.player
    squad.name = body.name
    squad.heroes = body.heroes

    try
      squad = validateAndCleanData squad
    catch
      deferred.resolve log

    if !log.length
      squad.save (err) ->
        return deferred.resolve err if err
        deferred.resolve squad

    deferred.promise

  validateAndCleanData = (squad) ->
    log = []

    log.push "Need player" unless squad.player
    log.push "Need name" unless squad.name

    throw log if log.length

    squad.heroes = [] unless squad.heroes

    squad

module.exports = SquadController