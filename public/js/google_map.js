var ref = new Firebase('https://publicdata-transit.firebaseio.com/sf-muni');
var transitLine = getLine();

function initialize() {
  // configuration for initial map
  var mapOptions = {
    center: getPosition(),
    zoom: 15
  };
  // initialize google map and marker objects
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  marker = new google.maps.Marker({
    icon: "http://google-maps-icons.googlecode.com/files/bus.png",
    position: getPosition(),
    map: map
  })
}

// obtain line # from DOM
function getLine() {
  return parseInt($('#route_tag')[0].innerHTML);
}

// obtain latlng coords from DOM for bus stop
function getPosition() {
  var lat = parseFloat($('#lat')[0].innerHTML);
  var lng = parseFloat($('#lon')[0].innerHTML);
  return { lat: lat, lng: lng }
}

google.maps.event.addDomListener(window, 'load', initialize);


// setPosition method usage:
// --------------------------------------------------
//marker.setPosition({lat: 37.78399, lng: -122.40})

// a listener that executes callback busUpdated() when a firebase bus changes
// --------------------------------------------------
// lineIndex.on("child_added", function (snapshot) {
//     var id = snapshot.key();
//     ref.child("vehicles").child(id).on("value", busUpdated);
// });

google.maps.Marker.prototype.animatedMoveTo = function(toLat, toLng) {
  // check if the values of current position vs the destination position are similar
    // write a function that returns true/false based on comparison of two decimal values
  var fromLat = this.getPosition().lat();
  var fromLng = this.getPosition().lng();
  // return if no buses have moved
  if (checkIfMoved(fromLat, fromLng, toLat, toLng)){
    return;
  }
  frames = [];
  for (percent = 0; percent < 1; percent += 0.005) {
      curLat = fromLat + percent * (toLat - fromLat);
      curLng = fromLng + percent * (toLng - fromLng);
      // add incremental animation frames that sit between from/to points
      frames.push(new google.maps.LatLng(curLat, curLng));
  }



}


function checkIfMoved(fromLat, fromLng, toLat, toLng) {
  return (Math.abs(fromLat - toLat) > 0.000001) || (Math.abs(fromLng - toLng) > 0.000001)
}

google.maps.Marker.prototype.move = function(frames, index, waitTime) {
  this.setPosition(frames[index]);
  if (index < frames.length) {
    setTimeout(function() {
      // recursively call move as long as index has not gone through all frames
      this.move(frames, index + 1, )
    })
  }
}



//
