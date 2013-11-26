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
          compress: true
          urlfunc: 'embedurl'
        files:
          'css/main.min.css': [
            'css/main.styl'
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
  ]

  grunt.registerTask 'default', [
    'parallel:dev'
  ]