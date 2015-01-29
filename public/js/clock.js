$(function() {
  var prediction = $('#prediction_0').attr('data-time');
  var clock = $('.clock').FlipClock(prediction, {
    clockFace: 'MinuteCounter',
    countdown: true
  });


  // var prediction_2 = $('#prediction_1').attr('data-time');
  // var clock_2 = $('.clock_2').FlipClock(prediction, {
  //   clockFace: 'MinuteCounter',
  //   countdown: true,

  // })

})
