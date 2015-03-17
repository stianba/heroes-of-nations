'use strict'

Deferred = require('promised-io/promise').Deferred
Hero = require './model'

class HeroController
  index: ->
    deferred = new Deferred()
    
    Hero
      .find (err, heroes) ->
        return deferred.resolve err if err
        deferred.resolve heroes

    deferred.promise

  create: (body) ->
    deferred = new Deferred()
    hero = new Hero()

    console.log body.moro

    deferred.promise

module.exports = HeroController
