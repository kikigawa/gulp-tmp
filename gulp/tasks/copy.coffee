path        = require "../utils/path.coffee"
gulp        = require 'gulp'
copy        = require 'gulp-copy'
del         = require 'del'


gulp.task 'copy', (cb)->

  gulp.src('./app/images/**/*.{png,jpg,ico,svg}')
    .pipe gulp.dest('./build/assets/images/')

  gulp.src('./app/scripts/plugin/*.js')
    .pipe gulp.dest('./build/assets/scripts/plugin/')

  gulp.src('./app/font/**/*')
    .pipe gulp.dest('./build/assets/font/')
