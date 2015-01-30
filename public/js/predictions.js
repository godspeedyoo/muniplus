$(function(){
  var button = $('button');
  var direction = button.attr('data-direction');
  var routeNumber = button.attr('data-route-number');
  var title = button.attr('data-title');

  var prediction0 = $('#prediction_0');
  var prediction1 = $('#prediction_1');
  var prediction2 = $('#prediction_2');
  var prediction3 = $('#prediction_3');

  button.click(function(){
    console.log("clicked...");
    var url = "/p/" + direction + "/" + routeNumber + "/" + title;

    $.ajax({
      url: url,
      type: "get",
      complete: function(response) {
        predictionData = JSON.parse(response.responseText);

        prediction0.attr('data-time', predictionData[0]);
        prediction0.html(predictionData[0]);
        prediction1.attr('data-time', predictionData[1]);
        prediction1.html(predictionData[1]);
        prediction2.attr('data-time', predictionData[2]);
        prediction3.html(predictionData[3]);
        prediction3.attr('data-time', predictionData[3]);
        prediction3.html(predictionData[3]);
      }
    });
    // console.log(direction + " " + routeNumber + " " + title)
    // $.ajax({
    //   url:
    // })
  });
});
