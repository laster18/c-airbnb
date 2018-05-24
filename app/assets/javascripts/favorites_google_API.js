$(function(){
  function initMap()
  {
    var myLatLng = {lat: 35.658581, lng: 139.745433};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 9,
        center: myLatLng
    });
    // var marker = new google.maps.Marker({
    //     position: myLatLng,
    //     map: map
    // });
    var geocoder = new google.maps.Geocoder();

    geocodeAddress(geocoder, map);
  }

  function geocodeAddress(geocoder, resultsMap)
  {
    gon.addresses.forEach(function( address ) {
      var image = {
        url: '/assets/house.png',
        scaledSize: new google.maps.Size(26,42)
      };
      var infoWindow;
      var address = address;
      geocoder.geocode({'address': address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
              resultsMap.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                  map: resultsMap,
                  position: results[0].geometry.location,
                  icon: image
              });
          } else {
              alert('Geocode was not successful for the following reason: ' + status);
          }
      });
    });
  }
  initMap();
})

