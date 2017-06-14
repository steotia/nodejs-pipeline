var gulp = require('gulp');
var mocha = require('gulp-mocha');
const zip = require('gulp-zip');

gulp.task('default', function() {
  return gulp.src(['tests/**/**.spec.js'], { read: false })
    .pipe(mocha({
      reporter: 'spec'
    }));
});

gulp.task('bundle',['default'],function(){
    gulp.src('**')
        .pipe(zip('bundle.zip'))
        .pipe(gulp.dest('dist'))
});