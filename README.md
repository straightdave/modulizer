# modulizer
a ruby gem that modulize the web pages

## basic idea
while building web applications,
you may need to separate a complex web page into pieces which are more isolated,
independent, easy-to-maintain and, the most important, reusable.
similar to 'partial' components in many backend frameworks (eg. sinatra, rails).
further more, it'll be good if you can package all things together, like the html templates, styles and scripts.

this'll make it easy to develop a web site with complex pages.

## get started
assume you have a module file with the content:
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
  $('h2').on('click', function () {
    alert('haha');
  });
});
</script>
```

then, use the gem to compile:
```
$> modulizer -e my_mod.html -o builds/my_mod.js
```

it will be compiled to a js file:
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

at last, you load the module and use it in your html page:
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
