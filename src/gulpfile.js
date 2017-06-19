var gulp = require('gulp');
var mocha = require('gulp-mocha');
const tar = require('gulp-tar');
const gzip = require('gulp-gzip');

gulp.task('default', function() {
  return gulp.src(['tests/**/**.spec.js'], { read: false })
    .pipe(mocha({
      reporter: 'spec'
    }));
});

gulp.task('bundle',function(){
    gulp.src([
        '**',
        '!tests/**'
        ],{base:"."})
        .pipe(tar('bundle.tar'))
        .pipe(gzip())
        .pipe(gulp.dest('dist'))
});