module.exports = (grunt) ->

  grunt.initConfig

    svgmin:
      options:
        plugins: [{
          removeViewBox: false
        }]
      files:
        expand: true
        cwd: 'img'
        src: ['*.svg']
        dest: 'img'
        ext: '.svg'

    imageoptim:
      options:
        imageAlpha: true
        # jpegMini: true
        quitAfter: true
      compress:
        src: [
          'img'
        ]

    stylus:
      compile:
        options:
          paths: ['css']
          use: ['nib']
          import: ['nib']
          compress: false
          urlfunc: 'embedurl'
        files:
          'css/collaboratingl415.css': [
            'css/normalize.styl'
            'css/main.styl'
          ]

    coffee:
      compile:
        files:
          'js/collaboratingl415.coffee.js': [
            'js/*.coffee'
          ]

    concat:
      dev:
        files:
          'js/collaboratingl415.js': [
            'js/$.min.js'
            'js/collaboratingl415.coffee.js'
          ]

    parallel:
      dev:
        options:
          stream: true
        tasks: [
          {
            grunt: true
            args: ['watch']
          }
          {
            cmd: 'jekyll'
            args: [
              'serve'
              '--watch'
            ]
          }
        ]

    watch:
      options:
        livereload: true
      stylus:
        options:
          livereload: false
        files: ['css/*.styl']
        tasks: ['stylus']
      coffee:
        options:
          livereload: false
        files: ['js/*.coffee']
        tasks: ['coffee', 'concat:dev']
      css:
        files: ['_site/css/*.css']
      js:
        files: ['_site/js/*.js']
      html:
        files: ['_site/*.html']

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.registerTask 'build', [
    'svgmin'
    'imageoptim'
    'stylus'
    'coffee'
  ]

  grunt.registerTask 'default', [
    'parallel:dev'
  ]
