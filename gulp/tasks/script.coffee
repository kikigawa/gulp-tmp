path        = require "../utils/path.coffee"
gulp        = require 'gulp'
webpack     = require 'gulp-webpack'
browserify = require 'gulp-browserify'
plumber     = require 'gulp-plumber'
Config      = require "../utils/config.coffee"
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
bSync       = require './browserSync'

gc = new Config()




# gulp.task 'scripts', (cb)->
#   gulp.src('./app/scripts/*.coffee', read: false).pipe(browserify(
#     transform: [ 'coffeeify' ]
#     extensions: [ '.coffee' ])).pipe(rename('main.js')).pipe gulp.dest('./build/scripts')


gulp.task 'scripts', (cb)->
  gulp.src('./app/scripts/*.coffee')
    .pipe webpack gc.webpack
    .pipe gulp.dest('./build/assets/scripts/')
    .pipe bSync.reload stream: true
