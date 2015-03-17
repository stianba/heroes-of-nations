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

    hero.class = body.class
    hero.name = body.name
    hero.nationality = body.nationality
    hero.hp = body.hp
    hero.skills = body.skills
    hero.traits = body.traits
    hero.abilities = body.abilities
    hero.equipment = body.equipment

    hero.save (err) ->
      return deferred.resolve err if err
      deferred.resolve hero

    deferred.promise

module.exports = HeroController
