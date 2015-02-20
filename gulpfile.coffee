gulp        = require 'gulp'
jade        = require 'gulp-jade'
compass     = require 'gulp-compass'
webpack     = require 'gulp-webpack'
del         = require('del')
webserver   = require 'gulp-webserver'
runSequence = require 'run-sequence'

Config      = require "./config.coffee"

gc = new Config()


gulp.task 'connect', ->
  gulp.src 'build/'
    .pipe webserver
      livereload: true
      host: "0.0.0.0"
      # directoryListing: true
      open: true

  root: ['build']
  port: 1337
  livereload: true
  open:
    file: gc.props.index
    browser: 'Google Chrome'


# html
gulp.task 'jade', ->
  # gulp.src('./app/pc/partials/_frame.jade')
  gulp.src('./app/pc/layout/index.jade')
    .pipe jade
      pretty: true
    .pipe gulp.dest('./build/')

# css
gulp.task 'styles', ->
  gulp.src('./app/pc/assets/styles/pc.sass')
    .pipe compass
      css: './build/assets/styles/'
      sass: './app/pc/assets/styles/'
    .pipe gulp.dest('./build/assets/styles/')

# js
gulp.task 'scripts', ->
  gulp.src('./app/pc/assets/scripts/pc.coffee')
    .pipe webpack gc.webpack
    .pipe gulp.dest('./build/assets/scripts/')

#clean
gulp.task 'clean', (cd) ->
  del ['./build/'], cd

#copy
gulp.task 'copy', ->
  gulp.src('./app/pc/assets/scripts/pc.coffee')
    .pipe gulp.dest('./copy/')

#watch
gulp.task 'watch', ->
  gulp.watch './app/pc/layout/**/*.jade', ['jade']
  gulp.watch './app/pc/assets/styles/*.sass', ['styles']
  gulp.watch './app/pc/assets/scripts/pc.coffee', ['scripts']


gulp.task 'build', ['jade', 'styles', 'scripts']

gulp.task 'default', ->
  runSequence 'clean', 'build', 'connect', 'watch'

gulp.task 'nouhin', ->
  gc.grops.nouhin = true

