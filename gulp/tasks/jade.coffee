path    = require "path"
gulp        = require "gulp"
plumber     = require "gulp-plumber"
Config      = require "../utils/config.coffee"
gutil       = require "gulp-util"
data        = require "gulp-data"
jade        = require "gulp-jade"
rename      = require "gulp-rename"
bSync       = require "./browserSync"
replace     = require "gulp-replace"


# html
gulp.task "jade", (cb)->

  gulp.src(["./app/layouts/**/*.jade", "!./app/layouts/**/_*.jade"])
    .pipe plumber()
    .pipe data (file) ->
      dp  = "../utils/data.coffee"
      out = require(dp)(file)
    .pipe jade
      pretty: true
    .on "error", gutil.log
    .pipe rename (path) ->
      # console.log(file.basename)
      # if file.basename != "index"
      #   file.basename = file.basename+"/index"
      name = path.basename
      name = name.split(":")
      dir  = name.join("/")
      if path.basename != "top"
        path.dirname += "/"+dir
      path.basename = "index"

    .pipe gulp.dest("./build/")
    .pipe bSync.reload stream: true
