$(function() {
  var prediction = $('#prediction_0').attr('data-time');
  var clock = $('.clock').FlipClock(prediction, {
    clockFace: 'MinuteCounter',
    countdown: true
  });
})
