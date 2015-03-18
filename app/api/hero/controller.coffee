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

  show: (id) ->
    deferred = new Deferred()

    Hero
      .findById id, (err, hero) ->
        return deferred.resolve err if err
        return deferred.resolve "No hero found" unless hero
        deferred.resolve hero

    deferred.promise

  create: (body) ->
    hero = new Hero()
    deferred = new Deferred()

    log = []

    # Populate Hero object with json data from request body
    hero.name = body.name
    hero.class = body.class
    hero.nationality = body.nationality
    hero.hp = body.hp
    hero.skills = body.skills
    hero.traits = body.r
    hero.abilities = body.abilities
    hero.equipment = body.equipment

    try
      hero = validateAndCleanData hero
    catch log
      deferred.resolve log

    if !log.length
      hero.save (err) ->
        return deferred.resolve err if err
        deferred.resolve hero

    deferred.promise

  destroy: (id) ->
    deferred = new Deferred()

    console.log id

    Hero.findById id, (err, hero) ->
      return deferred.resolve err if err
      return deferred.resolve "No hero found" unless hero

      hero.remove (err) ->
        return deferred.resolve err if err
        deferred.resolve "Hero removed"

    deferred.promise

  validateAndCleanData = (hero) ->
    log = []

    log.push "Need name" unless hero.name
    log.push "Need class" unless hero.class
    log.push "Need nationality" unless hero.nationality
    log.push "Need HP" unless hero.hp

    throw log if log.length

    hero.skills.defense = 1 unless hero.skills.defense
    hero.skills.shooting = 1 unless hero.skills.shooting
    hero.skills.speed = 1 unless hero.skills.speed

    hero.traits = [] unless hero.traits
    hero.abilities = [] unless hero.abilities
    hero.equipment = [] unless hero.equipment

    hero

module.exports = HeroController
