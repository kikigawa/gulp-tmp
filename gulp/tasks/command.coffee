path        = require '../utils/path.coffee'
gulp        = require 'gulp'
runSequence = require 'run-sequence'
Config      = require '../utils/config'
a           = path.forApp
b           = path.forBuild

gulp.task 'default', ->
  console.log("DEFAULT")
  runSequence 'clean', 'copy', 'jade','styles','scripts', 'browser-sync'

gulp.task 'watch', ['default'],  ->


  gulp.watch 'app/**/*.{jade,json,yml}', ['jade']
  gulp.watch 'app/**/*.{png,jpg}', ['copy']
  gulp.watch 'app/styles/**/*.sass', ['styles']
  gulp.watch 'app/scripts/**/*.coffee', ['scripts']

