path        = require "../utils/path.coffee"
gulp        = require 'gulp'
compass     = require 'gulp-compass'
plumber     = require 'gulp-plumber'
gutil       = require "gulp-util"
Config      = require '../utils/config.coffee'
bSync       = require './browserSync'
minifyCSS   = require 'gulp-minify-css'
# gulpif      = require 'gulp-if'

gulp.task 'styles', (cb)->
  opts =
    css: 'build/assets/styles'
    sass: 'app/styles'
    image: 'build/assets/images'

  gulp.src('./app/styles/*.sass')
    .pipe plumber()
    .pipe compass opts
    .on "error", gutil.log
    .pipe minifyCSS()
    .pipe gulp.dest('./build/assets/styles/')
    .pipe bSync.reload stream: true
