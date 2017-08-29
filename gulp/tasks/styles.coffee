path        = require "../utils/path.coffee"
gulp        = require 'gulp'
plumber     = require 'gulp-plumber'
gutil       = require "gulp-util"
bSync       = require './browserSync'
minifyCSS   = require 'gulp-minify-css'
cssBase64   = require 'gulp-css-base64'
postcss     = require 'gulp-postcss'
sass        = require 'gulp-sass'

gulp.task "styles", (cb)->
  gulp.src('./app/styles/*.sass')
    .pipe plumber()
    .on "error", gutil.log
    .pipe sass()
    .pipe postcss([
      require("postcss-assets")({
        loadPaths: [ 'assets/images/data/' ]
        basePath: './build'
      })
    ])
    
    
    .pipe gulp.dest('./build/assets/styles/')
    .pipe bSync.reload stream: true
