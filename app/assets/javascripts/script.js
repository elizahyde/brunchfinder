$(document).ready(function(){

  var photos = $('#photogrid li');


  $.each(photos, function(k,v) {
      var photo = $(v);
      var img = photo.find('img');

      // photo.on('click', function() {
      //   var img = photo.find('img');
      //   cool_box(img.clone());
    });
  });