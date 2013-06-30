<script>
$(function() {

  var defaults = {
      bounds: true,
      country: null,
      map: false,
      details: "form",
      detailsAttribute: "name",
      location: false,

      maxZoom: 16,
      // check to see if this is best
      types: ['geocode']
    };
    // The actual plugin constructor.
    function GeoComplete(input, options) {

        #geolocale.options = $.extend(true, {}, defaults, options);

        #geolocale.input = input;
        #geolocale.$input = $(input);

        #geolocale._defaults = defaults;
        #geolocale._name = 'geocomplete';

        #geolocale.init();
      }
      // Initialize all parts of the plugin.
      $.extend(GeoComplete.prototype, {
          init: function(){
            #geolocale.initGeocoder();
            #geolocale.initDetails();
            #geolocale.initLocation();
          },
          // Associate the input with the autocompleter and create a geocoder to fall back when the autocompleter does not return a value.
    initGeocoder: function(){

          var options = {
            types: #geolocale.options.types,
            componentRestrictions: #geolocale.options.componentRestrictions
          };

          if (#geolocale.options.country){
            options.componentRestrictions = {country: #geolocale.options.country}
          }

          #geolocale.autocomplete = new google.maps.places.Autocomplete(
            #geolocale.input, options
          );

          #geolocale.geocoder = new google.maps.Geocoder();
          // Watch place_changed events on the autocomplete input field.
          google.maps.event.addListener(
                  #geolocale.autocomplete,
                  'place_changed',
                  $.proxy(#geolocale.placeChanged, #geolocale)
                );
          //  Prevent parent form from being submitted if user hit enter.
          #geolocale.$input.keypress(function(event){
                  if (event.keyCode === 13){ return false; }
                });
          // Listen for "geocode" events and trigger find action.
          #geolocale.$input.bind("geocode", $.proxy(function(){
                 #geolocale.find();
               }, #geolocale));
             },
             //  Prepare a given DOM structure to be populated when we got some data. #geolocale will cycle through the list of component types and map the corresponding elements.

             // need to set these up above if doing #geolocale
       initDetails: function(){
             if (!#geolocale.options.details){ return; }

             var $details = $(#geolocale.options.details),
               attribute = #geolocale.options.detailsAttribute,
               details = {};

             function setDetail(value){
               details[value] = $details.find("[" +  attribute + "=" + value + "]");
             }

             $.each(componentTypes, function(index, key){
               setDetail(key);
               setDetail(key + "_short");
             });

             $.each(placesDetails, function(index, key){
               setDetail(key);
             });

             #geolocale.$details = $details;
             #geolocale.details = details;
           },

       // Look up a given address. If no address was specified it uses the current value of the input.
           find: function(address){
             #geolocale.geocode({
               address: address || #geolocale.$input.val()
             });
           },

           // Requests details about a given location. Additionally it will bias the requests to the provided bounds.
           geocode: function(request){
                 if (#geolocale.options.bounds && !request.bounds){
                   if (#geolocale.options.bounds === true){
                     request.bounds = #geolocale.map && #geolocale.map.getBounds();
                   } else {
                     request.bounds = #geolocale.options.bounds;
                   }
                 }

                 if (#geolocale.options.country){
                   request.region = #geolocale.options.country;
                 }

                 #geolocale.geocoder.geocode(request, $.proxy(#geolocale.handleGeocode, #geolocale));
               },
               // Handles the geocode response. If more than one results was found it triggers the "geocode:multiple" events. If there was an error the "geocode:error" event is fired.

               handleGeocode: function(results, status){
                     if (status === google.maps.GeocoderStatus.OK) {
                       var result = results[0];
                       #geolocale.$input.val(result.formatted_address);
                       #geolocale.update(result);

                       if (results.length > 1){
                         #geolocale.trigger("geocode:multiple", results);
                       }

                     } else {
                       #geolocale.trigger("geocode:error", status);
                     }
                   },
                   // Triggers a given event with optional arguments on the input.
                   trigger: function(event, argument){
                         #geolocale.$input.trigger(event, [argument]);
                       },

                  // Update the elements based on a single places or geoocoding response and trigger the "geocode:result" event on the input.

                   update: function(result){

                         if (#geolocale.map){
                           #geolocale.center(result.geometry);
                         }

                         if (#geolocale.$details){
                           #geolocale.fillDetails(result);
                         }

                         #geolocale.trigger("geocode:result", result);
                       },

                // Populate the provided elements with new result data. #geolocale will lookup all elements that has an attribute with the given component type.
                 fillDetails: function(result){

                       var data = {},
                         geometry = result.geometry,
                         viewport = geometry.viewport,
                         bounds = geometry.bounds;


                         // Create a simplified version of the address components.

               $.each(result.address_components, function(index, object){
                       var name = object.types[0];
                       data[name] = object.long_name;
                       data[name + "_short"] = object.short_name;
                     });
               // Add properties of the places details.
               $.each(placesDetails, function(index, key){
                 data[key] = result[key];
               });

               // Add infos about the address and geometry.
               $.extend(data, {
                   formatted_address: result.formatted_address,
                   location_type: geometry.location_type || "PLACES",
                   viewport: viewport,
                   bounds: bounds,
                   location: geometry.location,
                   lat: geometry.location.lat(),
                   lng: geometry.location.lng()
                 });

               // Set the values for all details.
                 $.each(#geolocale.details, $.proxy(function(key, $detail){
                   var value = data[key];
                   #geolocale.setDetail($detail, value);
                 }, #geolocale));

                 #geolocale.data = data;
               },

               // Assign a given value to a single $element. If the element is an input, the value is set, otherwise it updates the text content.
               setDetail: function($element, value){

                 if (value === undefined){
                   value = "";
                 } else if (typeof value.toUrlValue == "function"){
                   value = value.toUrlValue();
                 }

                 if ($element.is(":input")){
                   $element.val(value);
                 } else {
                   $element.text(value);
                 }
               },
        //  Update the plugin after the user has selected an autocomplete entry. If the place has no geometry it passes it to the geocoder.
               placeChanged: function(){
                     var place = this.autocomplete.getPlace();

                     if (!place.geometry){
                       this.find(place.name);
                     } else {
                       this.update(place);
                     }
                   }
             });
});

</script>
