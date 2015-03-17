'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

HeroSchema = new Schema
  class: { type: String, ref: 'Class' }
  name: String
  nationality: String
  HP: Number
  skills:
    defense: Number
    shooting: Number
    speed: Number
  traits: [ String ]
  abilities: [
    { type: String, ref: 'Ability' }
  ]
  equipment: [
    {
      item: { type: String, ref: 'Equipment' }
      amount: Number
    }
  ]
  ,
  { collection: "heroes" }

module.exports = mongoose.model 'Hero', HeroSchema