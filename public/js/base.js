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

  $("#filter select").selectpicker({
    style: 'btn-primary',
    menuStyle: 'dropdown-inverse'
  });

  $("#filter select").change(function(e) {
    var $id = $($(this).val());

    $(".tab-content").children().removeClass("active");
    $id.addClass("active")

    var $container = $id.find(".thoughts");

    $container.imagesLoaded(function() {
      $container.masonry({
        itemSelector: ".item",
        gutter: 10
      });
    });
  });
});
