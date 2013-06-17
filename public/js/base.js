$(function() {
  var $containers = $(".thoughts").first();

  $containers.each(function(index, container) {
    $(container).imagesLoaded(function() {
      $(container).masonry({
        itemSelector: ".item",
        gutter: 10
      });
    });
  });

  $("#filter a").on("show", function(e) {
    var $container = $($(e.target).attr("href")).find(".thoughts");

    $container.imagesLoaded(function() {
      $container.masonry({
        itemSelector: ".item",
        gutter: 10
      });
    });
  });
});
