$(function() {
  var $container = $("#thoughts");

  $container.imagesLoaded(function() {
    $container.masonry({
      itemSelector: ".item",
      gutter: 10
    });
  });
});
