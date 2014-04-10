$(function() {

  // Initialize Geocomplete
  $("#geolocale").geocomplete({
    details: "form",
    detailsAttribute: "name"
  });

  // Trigger geocoding request.
  $("submit").click(function(){
    $("#geolocale").trigger("geocode");
  });

  // Results Page
  var $container = $('#container');
  $("#container");
  $container.isotope({
    itemSelector: '.venue',
    layoutMode : 'masonry',
    sortBy: 'totalCheckins',
    sortAscending : false,
    animationEngine : 'best-available',
    animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false },
    getSortData : {
      distance : function ( $elem ) {
        return parseFloat($elem.find('.distance').text() );
      },
      hereNow : function ( $elem ) {
        return parseInt($elem.find('.hereNow').text(), 10 );
      },
      totalCheckins : function ( $elem ) {
        return parseInt($elem.find('.totalCheckins').text(), 10 );
      }
    }
  });

  $('#sortBy a').click(function(){
    // get href attribute, minus the '#'
    var sortName = $(this).attr('href').slice(1);
    $('#container').isotope({ sortBy : sortName });
    return false;
  });

  // Unused for now
  $('#hereNow').tooltip({
    placement: 'left',
    content: 'Current Checkins'
  });
});