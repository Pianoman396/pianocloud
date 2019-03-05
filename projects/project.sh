#!/bin/bash

# -------
#  Simple Project Blueprint By OORKAN ( Eric )
# -------

project_name=$1;

echo "======== Creating project...";

# create structure
mkdir ${project_name};
mkdir ${project_name}/css ${project_name}/css/dist ${project_name}/js ${project_name}/js/dist ${project_name}/images ${project_name}/images/dist ${project_name}/fonts ${project_name}/tool ${project_name}/lang ${project_name}/includes ${project_name}/sec;

mkdir ${project_name}/tool/assets ${project_name}/tool/images ${project_name}/tool/fonts;
mkdir ${project_name}/tool/assets/js ${project_name}/tool/assets/sass ${project_name}/tool/assets/sass/src ${project_name}/tool/assets/sass/src/riders ${project_name}/tool/assets/sass/src/riders/default ${project_name}/tool/assets/sass/src/riders/responsive;
mkdir ${project_name}/tool/assets/sass/src/riders/responsive/_1200 ${project_name}/tool/assets/sass/src/riders/responsive/_992 ${project_name}/tool/assets/sass/src/riders/responsive/_722 ${project_name}/tool/assets/sass/src/riders/responsive/_350;

# cp files
cp -r ./horses ./${project_name}/tool/assets/sass/src/;

# create files

touch ./${project_name}/index.php;
touch ./${project_name}/sec/sec.php;
touch ./${project_name}/tool/.eslintrc.json ./${project_name}/tool/.eslintignore ./${project_name}/tool/gulpfile.js;

# insert into files

echo "<?php define('MYPATH','saltsaltsalt2343245356%$^%^$%&');  function pathcheck($path = null){ $path !== null && $path === 'saltsaltsalt2343245356%$^%^$%&' ? true : die(-1);}

define('BUG_FIX', true);

if( BUG_FIX ){
	ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);
}

function url() {
  return sprintf(
    '%s://%s%s',
    isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http',
    $_SERVER['SERVER_NAME'],
    $_SERVER['REQUEST_URI']
  );
}

// define('MY_URL', ); //url()
" > ./${project_name}/sec/sec.php;

echo "<?php require_once( realpath('sec/sec.php') ); pathcheck(MYPATH);
require_once( realpath('includes/head.php') );

" > ./${project_name}/index.php;


echo "// Load modules
const   gulp            = require('gulp'),
        plumber         = require('gulp-plumber'),
        autoprefixer    = require('gulp-autoprefixer'),
        sass            = require('gulp-sass'),
        minifycss       = require('gulp-clean-css'),
        eslint          = require('gulp-eslint'),
        gutil           = require('gulp-util'),
        uglify          = require('gulp-uglify-es').default,
        sourcemaps      = require('gulp-sourcemaps'),
        imagemin        = require('gulp-imagemin'),
        rename          = require('gulp-rename'),
        concat          = require('gulp-concat'),
        notify          = require('gulp-notify'),
        changed         = require('gulp-changed')
        // imageminJpegAutorotate = require('jpeg-autorotate');


        // Working dirs
        dwd             = 'assets',
        rwd             = '../';

const onError = function (err) {
  console.log(err);
};

// Sass task
gulp.task('sass', function () {
  return gulp.src(`${dwd}/sass/**/*.scss`)
    .pipe(sourcemaps.init())
    .pipe(sass().on('error', sass.logError))
    .pipe(autoprefixer('last 6 versions'))
    .pipe(concat('app.css'))
    .pipe(minifycss())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(`${rwd}/css/`));
});

//Js task
gulp.task('js', function () {
  return gulp.src(`${dwd}/js/**/*.js`)
    .pipe(plumber({
      errorHandler: onError
    }))
    .pipe(eslint({fix:true}))
    .pipe(eslint.format())
    .pipe(concat('app.js'))
    .pipe(uglify())
    .pipe(gulp.dest(`${rwd}/js/`));
});

//Minifying images
gulp.task('imagemin', () => {
  return gulp.src(`images/src/**/*`)
  .pipe(changed(`${rwd}/images/dist`))
  .pipe(imagemin())
  .pipe(gulp.dest(`${rwd}/images/dist`))
})

// Watch
gulp.task('watch', function () {
  gulp.watch(`${dwd}/sass/**/*.scss`, gulp.series('sass'));
  gulp.watch(`${dwd}/js/**/*.js`, gulp.series('js'));
  gulp.watch(`images/src/**/*`, gulp.series('imagemin'));
  return;
});

// Run
gulp.task('default', gulp.series(['sass', 'js', 'imagemin', 'watch'])); //'js',


" > ./${project_name}/tool/gulpfile.js;

echo "{
    'parserOptions': {
        'ecmaVersion': 6,
        'sourceType': 'module',
        'ecmaFeatures': {
            'jsx': true
        }
    },
    'rules': {
        'semi': [2, 'always'],
        'no-extra-semi': 2,
        'quotes': [2, 'double', {'allowTemplateLiterals': true}],
        'eqeqeq': [2, 'always'],
        'curly': 2
    }
}

" > ./${project_name}/tool/.eslintrc.json;

echo "**/assets/js/0_lozad-cdn.js
**/assets/js/moment-cdn.js
" > ./${project_name}/tool/.eslintignore;