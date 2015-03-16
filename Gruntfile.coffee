'use strict'

module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-concurrent'

  grunt.initConfig
    nodemon:
      dev:
        script: 'app.coffee'

    coffeelint:
      files: ['./Gruntfile.coffee', './app.coffee', './app/**/*.coffee']

    watch:
      coffee:
        files: ['./Gruntfile.coffee', './app.coffee', './app/**/*.coffee']
        tasks: ['coffeelint']

    concurrent:
      target:
        tasks: ['nodemon', 'watch']
        options:
          logConcurrentOutput: true

  grunt.registerTask 'default', ['coffeelint', 'concurrent']