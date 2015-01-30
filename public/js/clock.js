window.timeLeft;

$(function() {
  var prediction0 = $('#prediction_0').attr('data-time');
  var clock = $('.clock').FlipClock(prediction0, {
    clockFace: 'MinuteCounter',
    countdown: true
  });

// checks a config for the interval timing for refreshing the timer
function getInterval(timeLeft) { // interval is represented in seconds
  if (timeLeft < 60000) {
    return 20000; // refreshes every 20s if less than 1 minute
  } else if (timeLeft < 180000) {
    return 30000; // refreshes every 30s if less than 3 minutes
  } else if (timeLeft < 300000) {
    return 60000; // refreshes every 60s if less than 5 minutes
  } else {
    return 120000; // 120s refresh
  }
}

// recursively calls itself with progressively shorter intervals and stops at 20 second increments
function refreshTimer(timeLeft, interval, clock) {
  var clock = clock;
  setTimeout(function() {
    var prediction0 = $('#prediction_0').attr('data-time');
    console.log("refreshing timer with " + timeLeft + " seconds left at " + interval + " second intervals");
    clock.setTime(prediction0);
    refreshTimer(timeLeft, interval, clock)
  }, interval)
  var interval = getInterval(timeLeft);
  console.log("Interval: " + interval);
  getTimeLeft(); // changes the global variable to the refreshed time left from ajax response
  var timeLeft = window.timeLeft;
  console.log("Time Left: " + timeLeft);

}

function getPredictionUrl() {
  var button = $('button');
  var prediction0 = $('#prediction_0');
  var direction = button.attr('data-direction');
  var routeNumber = button.attr('data-route-number');
  var title = button.attr('data-title');
  var url = "/p/" + direction + "/" + routeNumber + "/" + title;
  return url;
}

function getTimeLeft() {
  url = getPredictionUrl();
  console.log("Auto-fetching time from nextbus API...");

  var timeLeft;

  $.ajax({
    url: url,
    type: "get"
  }).done(function(response) {
      predictionData = JSON.parse(response);
      window.timeLeft = parseInt(predictionData[0]);
    });
  return timeLeft;
};

refreshTimer(getTimeLeft(), getInterval(), clock);

})
