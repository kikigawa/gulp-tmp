path        = require "../utils/path.coffee"
gulp        = require 'gulp'
del         = require 'del'

gulp.task 'delete', (cb)->
  del ['build/assets/images/sprites-dir'], cb