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
});