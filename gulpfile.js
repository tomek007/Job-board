/*
|--------------------------------------------------------------------------
| Elixir Asset Management
|--------------------------------------------------------------------------
|
| Elixir provides a clean, fluent API for defining some basic Gulp tasks
| for your Laravel application. By default, we are compiling the Less
| file for our application, as well as publishing vendor resources.
|
| Documentation and install instructions available here: https://laravel.com/docs/5.2/elixir#installation 
*/

process.env.DISABLE_NOTIFIER = true;

var elixir = require('laravel-elixir');

/* Update path to pre-compiled assets*/
elixir.config.assetsPath = 'src/main/webapp/resources/';

/* Update autoprefix settings */
elixir.config.css.autoprefix.options.browsers.push("last 5 versions");

elixir(function(mix) {

    mix.sass('theme.scss','src/main/webapp/resources/compiled/css/theme.css');

    mix.scripts([
        'vendor/jquery-1.12.0.min.js',
        'vendor'
    ], 'src/main/webapp/resources/compiled/js/vendor.js');

    mix.scripts([
        'custom/main.js'
    ], 'src/main/webapp/resources/compiled/js/main.js');

});