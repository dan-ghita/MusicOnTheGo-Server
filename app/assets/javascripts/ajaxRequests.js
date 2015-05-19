/**
 * Created by dan on 19.05.2015.
 */
$(document).ready(function () {
    
    function likeButtonAction (action) {
        var APIUrl = "http://localhost:3000/api/" + action + "/" + songId;
        console.log(APIUrl);
        $.ajax({
            url: APIUrl,
            type: "GET",
            dataType: "json",
            complete: function (data_response) {
                var content = JSON.parse(data_response.responseText);
                
                if (action == 'like') {
                    $("#like-button").html('Dislike');
                }                
                else {
                    $("#like-button").html('Like');
                }
            }
        });
    }

    $("#like-button").click( function(){
        var buttonValue = $("#like-button").html();
        likeButtonAction(buttonValue.toLowerCase());  
    });



});