busData = {};
busIds = [];
var ref = new Firebase('https://publicdata-transit.firebaseio.com/sf-muni');
// ref.child("routes").on("value", function(snapshot){ console.log(JSON.stringify(snapshot.val()))})
// ref.child("vehicles").on("value", function(snapshot){ console.log(JSON.stringify(snapshot.val()))})

var transitLine = getLine();
buses = {};

function initialize() {
  // configuration for initial map
  var mapOptions = {
    center: getPosition(),
    zoom: 15
  };
  // initialize google map and marker objects
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  marker = new google.maps.Marker({
    icon: "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-4471fa/shapecolor-white/shadow-1/border-color/symbolstyle-color/symbolshadowstyle-no/gradient-no/busstop.png",
    position: getPosition(),
    map: map
  })
}
// take a snapshot of the firebase vehicle
// ------------------------------------------------------------
// match the route and fill in its known busIds

// DOCUMENT ONLOAD
// ############################################################

  firebaseRoutes = ref.child("routes");
  firebaseRoutes.once("value", function(snapshot){
    snapshot.forEach(function(route){
      if (route.key() == transitLine){
        for (busnum in route.val()){
          busIds.push(parseInt(busnum));
        }
      }
    })
  });

  // get busData for each matching bus in busIds
  firebaseVehicles = ref.child("vehicles");
  firebaseVehicles.once("value", function(snapshot){
    snapshot.forEach(function(bus){
      if (busIds.indexOf(parseInt(bus.key())) > -1){
        busData[bus.key()] = bus.val();
      }
    })
  });

  // populate map with initial data of buses and their locations




  // add listeners for every event change from firebase that matches the vehicle

  firebaseVehicles.on("child_changed", function(snapshot){
    // console.log(snapshot.key());
    var busMarker = buses[snapshot.key()] // snapshot.key() returns a string value
    if (!!busMarker){
      busMarker.animatedMoveTo(snapshot.val().lat, snapshot.val().lon);
    }
    // console.log(buses[parseInt(snapshot.key())]);
    // console.log("key:" + s.key() + " value:" + s.val());
  })

// ############################################################


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
  console.log("Invoked!")
  // check if the values of current position vs the destination position are similar
    // write a function that returns true/false based on comparison of two decimal values
  var fromLat = this.getPosition().lat();
  var fromLng = this.getPosition().lng();
  // return if no buses have moved
  if (!checkIfMoved(fromLat, fromLng, toLat, toLng)){
    return;
  }
  frames = [];
  for (percent = 0; percent < 1; percent += 0.005) {
      curLat = fromLat + percent * (toLat - fromLat);
      curLng = fromLng + percent * (toLng - fromLng);
      // add incremental animation frames that sit between from/to points
      frames.push(new google.maps.LatLng(curLat, curLng));
  }

  move = function(marker, frames, index, waitTime) {
    marker.setPosition(frames[index]);
    if (index < frames.length) {
      setTimeout(function() {
        // recursively call move as long as index has not gone through all frames
        move(marker, frames, index + 1, waitTime);
      }, waitTime)
    } else {
      // set permanent
    }
  };
  move(this, frames, 0, 25);
};


function checkIfMoved(fromLat, fromLng, toLat, toLng) {
  return (Math.abs(fromLat - toLat) > 0.000001) || (Math.abs(fromLng - toLng) > 0.000001)
}

// create a new bus
function generateBus(bus, firebaseId) {
  var busLocation = new google.maps.LatLng(bus.lat, bus.lon);
  var marker = new google.maps.Marker({
    icon: "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-f76420/shapecolor-color/shadow-1/border-black/symbolstyle-contrast/symbolshadowstyle-no/gradient-no/bus.png",
    position: busLocation,
    map: map
  });
  buses[firebaseId] = marker;
}

$(document).ready(function(){
  setTimeout(function(){
    for(bus in busData){
      generateBus(busData[bus], bus);
    }
      alert("HOOOOO");
    }, 5000)

  })




// bus icon: "http://google-maps-icons.googlecode.com/files/bus.png"
// bus icon alternative "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-f76420/shapecolor-color/shadow-1/border-black/symbolstyle-contrast/symbolshadowstyle-no/gradient-no/bus.png"

// Create a new marker for testing
// ------------------------------------------------------
// marker = new google.maps.Marker({
//             icon: "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-f76420/shapecolor-color/shadow-1/border-black/symbolstyle-contrast/symbolshadowstyle-no/gradient-no/bus.png",
//             position: new google.maps.LatLng(getPosition()),
//             map: map
//         });


// ref.child("vehicles").once("value", function(s){s.forEach(function(b){console.log(b.val()); console.log(b.key());})})

