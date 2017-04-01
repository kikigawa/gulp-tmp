path         = require "../utils/path.coffee"
gulp          = require 'gulp'
browserSync   = require 'browser-sync'
connectSSI = require 'connect-ssi'
Config        = require '../utils/config'
@reload       = browserSync.reload

gulp.task 'browser-sync', (cb) ->

  browserSync
    server:
      baseDir: './build'
    middleware:
      connectSSI(
        baseDir: './build'
        ext: '.html'
      )

  # cb()
