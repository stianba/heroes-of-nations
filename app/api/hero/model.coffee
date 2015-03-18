'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

HeroSchema = new Schema
  name: String
  class: { type: String, ref: 'Class' }
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
      _id: false
    }
  ]
  ,
  { collection: "heroes" }

module.exports = mongoose.model 'Hero', HeroSchema