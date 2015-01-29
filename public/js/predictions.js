$(function(){
  var button = $('button');
  var direction = button.attr('data-direction');
  var routeNumber = button.attr('data-route-number');
  var title = button.attr('data-title');
  button.click(function(){
    console.log("clicked...");
    var url = "/" + direction + "/" + routeNumber + "/" + title;

    $.ajax({
      url: url,
      type: "POST",
      complete: function(response) {
        // console.log("Completed AJAX request");
        predictionData = JSON.parse(response);
        console.log(predictionData);
        // console.log(jQuery.parseJSON(response));
        // alert(response.getAllResponseHeaders());
      }
    });
    // console.log(direction + " " + routeNumber + " " + title)
    // $.ajax({
    //   url:
    // })
  });
});
