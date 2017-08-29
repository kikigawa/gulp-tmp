path        = require "../utils/path.coffee"
gulp        = require 'gulp'
webpack     = require 'gulp-webpack'
plumber     = require 'gulp-plumber'
Config      = require "../utils/config.coffee"
coffee      = require 'gulp-coffee'
rename      = require 'gulp-rename'
bSync       = require './browserSync'

gc = new Config()


gulp.task 'scripts', (cb)->
  gulp.src('./app/scripts/*.coffee')
    .pipe webpack gc.webpack
    .pipe gulp.dest('./build/assets/scripts/')
    .pipe bSync.reload stream: true
