# modulizer
A ruby gem that helps modulize the web pages

[![Build Status](https://travis-ci.org/straightdave/modulizer.svg?branch=master)](https://travis-ci.org/straightdave/modulizer)

## basic idea
Similar to the concept of 'partials' in many backend frameworks (eg. sinatra, rails), while developing web applications, you may like to separate a complex web page into different components which, thus, could be more isolated, independent, easy-to-maintain and, the most important, reusable.

Here we call such components **modules**.
A module is just a single file which consists of mainly 3 parts of information:
  - styling
  - template
  - scripting

We put all related thing together in one single file for a module to make it more maintainable and isolated. You can develop many modules and then use **modulizer** to build them.
After building, the information would be compiled into one js file. Currently we need jQuery to make this work. So you need to load jQuery to the pages.

## setup
**Modulizer** is a ruby gem. You can install it via:
```bash
$> gem install modulizer
```
>Assume you have had ruby and gem installed. Newer the better.

## get started

Say you have a module file with the content:
```html
<!-- my_mod.html -->
<style scoped>
h2 {
  color: red;
}
</style>

<template>
<h2>Hello, world!</h2>
</template>

<script>
$(function(){
  $('div#my_mod h2').on('click', function () {
    alert('haha');
  });
});
</script>
```
>The module files use '.html' as extend filename just for syntax highlighting of editors. You can use any kind of names.

The *style* element can have attribute 'scoped' to indicate the stylings are only working inside the modules. Behind the curtain it adds ```div#mod_name``` as prefix to the css selectors to limit styling effect.

Then use modulizer to build:
```bash
$> modulizer -e my_mod.html -o builds/my_mod.js
```

The module file would be compiled to a js file:
```javascript
/* auto-generated js for my-mod */
(function (window, $) {
  var style =
  '<style>\
  div#my_mod h2 {\
    color: red;\
  }\
  </style>';

  var template =
  '<h2>Hello, world</h2>';

  var script =
  '<script>\
  (function(window, $) {\
    $(function(){\
      $(\'div#my_mod h2\').on(\'click\', function () {\
        alert(\'haha\');\
      });\
    });\
  })(window,jQuery);\
  </script>';

  $(function() {
    $("div#my_mod").html(style + template + script);
  });
})(window, jQuery);
```

Now you can load the module and use it in your html page:
```html
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>The Title</title>
<body>

<div id="my-mod"></div>

<script src="js/jquery-3.1.0.min.js"></script>
<script src="modules/builds/my_mod.js"></script>
</body>
</html>
```
>You can compress the js files of modules

Voila!
