"use strict";

var gulp = require("gulp"),
  watch = require("gulp-watch"),
  prefixer = require("gulp-autoprefixer"),
  uglify = require("gulp-uglify"),
  util = require("gulp-util"),
  sourcemaps = require("gulp-sourcemaps"),
  replace = require("gulp-token-replace"),
  rigger = require("gulp-rigger"),
  sass = require("gulp-sass"),
  cssmin = require("gulp-minify-css"),
  importer = require("sass-module-importer"),
  imagemin = require("gulp-imagemin"),
  pngquant = require("imagemin-pngquant"),
  mozjpeg = require("imagemin-mozjpeg"),
  rimraf = require("rimraf"),
  browserSync = require("browser-sync"),
  wait = require("gulp-wait"),
  reload = browserSync.reload;

var path = {
  build: {
    html: "dist/",
    js: "dist/js/",
    css: "dist/css/",
    img: "dist/img/",
    fonts: "dist/fonts/",
    svg: "dist/img/svg/",
    video: "dist/video/",
  },
  src: {
    html: "src/*.html",
    js: "src/js/*.js",
    scss: "src/scss/*.scss",
    img: "src/img/**/*.*",
    fonts: "src/fonts/**/*.*",
    svg: "src/img/svg/*.svg",
    video: "src/video/**/*.*",
    settings: "./settings.json",
  },
  watch: {
    html: "src/**/*.html",
    js: "src/js/**/*.js",
    scss: "src/scss/**/*.scss",
    img: "src/img/**/*.*",
    fonts: "src/fonts/**/*.*",
    video: "src/video/**/*.*",
    settings: "./settings.json",
  },
  clean: "./dist"
};

var config = {
  server: {
    baseDir: "./dist"
  },
  tunnel: true
};

var settings = require("./settings.json");

var production = !!util.env.production;

gulp.task("html:build", function() {
  gulp
    .src(path.src.html) //Выберем файлы по нужному пути
    .pipe(rigger()) //Прогоним через rigger
    .pipe(replace({ global: settings, preserveUnknownTokens: true }))
    .pipe(gulp.dest(path.build.html)) //Выплюнем их в папку build
    .pipe(reload({ stream: true })); //И перезагрузим наш сервер для обновлений
});

gulp.task("js:build", function() {
  gulp
    .src(path.src.js) //Найдем наш main файл
    .pipe(rigger()) //Прогоним через rigger
    .pipe(replace({ global: settings, preserveUnknownTokens: true }))
    .pipe(sourcemaps.init()) //Инициализируем sourcemap
    .pipe(uglify()) //Сожмем наш js
    .pipe(production ? util.noop() : sourcemaps.write())
    .pipe(gulp.dest(path.build.js)) //Выплюнем готовый файл в build
    .pipe(reload({ stream: true })); //И перезагрузим сервер
});

gulp.task("scss:build", function() {
  gulp
    .src(path.src.scss) //Выберем наш main.scss
    .pipe(sourcemaps.init()) //То же самое что и с js
    .pipe(wait(500))
    .pipe(sass({ importer: importer() }).on("error", sass.logError)) //Скомпилируем
    .pipe(prefixer()) //Добавим вендорные префиксы
    .pipe(cssmin()) //Сожмем
    .pipe(production ? util.noop() : sourcemaps.write())
    .pipe(gulp.dest(path.build.css)) //И в build
    .pipe(reload({ stream: true }));
});

gulp.task("image:build", function() {
  gulp
    .src(path.src.img) //Выберем наши картинки
    .pipe(
      imagemin({
        //Сожмем их
        // progressive: true,
        // svgoPlugins: [{ removeViewBox: false }],
        // use: [pngquant()],
        // interlaced: true
      })
    )
    .pipe(gulp.dest(path.build.img)) //И бросим в build
    .pipe(reload({ stream: true }));
});

gulp.task("fonts:build", function() {
  gulp.src(path.src.fonts).pipe(gulp.dest(path.build.fonts));
});

gulp.task("video:build", function() {
  gulp.src(path.src.video).pipe(gulp.dest(path.build.video));
});

gulp.task("build", [
  "html:build",
  "js:build",
  "scss:build",
  "fonts:build",
  "video:build",
  "image:build"
]);

gulp.task("watch", function() {
  watch([path.watch.html], function(event, cb) {
    gulp.start("html:build");
  });
  watch([path.watch.scss], function(event, cb) {
    gulp.start("scss:build");
  });
  watch([path.watch.js], function(event, cb) {
    gulp.start("js:build");
  });
  watch([path.watch.img], function(event, cb) {
    gulp.start("image:build");
  });
  watch([path.watch.fonts], function(event, cb) {
    gulp.start("fonts:build");
  });
  watch([path.watch.video], function(event, cb) {
    gulp.start("video:build");
  });
  watch([path.watch.settings], function(event, cb) {
    gulp.start("html:build");
    gulp.start("js:build");
  });
});

gulp.task("clean", function(cb) {
  rimraf(path.clean, cb);
});

gulp.task("webserver", function() {
  browserSync(config);
});

gulp.task("default", ["build", "webserver", "watch"]);
