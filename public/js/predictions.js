$(function(){
  var button = $('button');
  var direction = button.attr('data-direction');
  var routeNumber = button.attr('data-route-number');
  var title = button.attr('data-title');
  button.click(function(){
    console.log("clicked...");
    var url = "/p/" + direction + "/" + routeNumber + "/" + title;

    $.ajax({
      url: url,
      type: "get",
      complete: function(response) {
        // console.log("Completed AJAX request");
        // console.log(response);
        // console.log(response);
        predictionData = JSON.parse(response.responseText);
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
