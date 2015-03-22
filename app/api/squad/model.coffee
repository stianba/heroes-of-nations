'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

SquadSchema = new Schema
  player: String
  name: String
  heroes: [
    { type: String, ref: 'Hero' }
  ]
  ,
  { collection: 'squads' }

module.exports = mongoose.model 'Squad', SquadSchema