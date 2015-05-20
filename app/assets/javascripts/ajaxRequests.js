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

    function submitComment(){
        var APIUrl = "http://localhost:3000/api/new_comment/" + songId;
        
        console.log(APIUrl);
        var message = $("#message").val();
        
        $.ajax({
            url: APIUrl,
            type: "GET",
            data: {message: message},
            dataType: "json",
            complete: function (data_response) {
                var content = JSON.parse(data_response.responseText);
                var newComment = "<div class = \"comment\"><span class=\"title\">" + content.username + "</span><span class=\"small-text\"> on </span><span class=\"date\">" + content.created_at + "</span>" + "<p>" + message + "</p></div>";
                $("#comment-area").prepend(newComment);
                $("#message").val("");
            }
        });
    }
    
    function addToPlaylist (playlistId) {
        var APIUrl = "http://localhost:3000/api/add_to_playlist/" + songId;
        
        console.log(APIUrl);
        
        $.ajax({
            url: APIUrl,
            type: "GET",
            data: {playlist_id: playlistId},
            dataType: "json",
            complete: function (data_response) {
                var content = JSON.parse(data_response.responseText);
                alert("done");
            }
        });
    }
    
    function getPlaylists () {
        
        var APIUrl = "http://localhost:3000/api/get_user_playlists";
        
        $.ajax({
            url: APIUrl,
            type: "GET",
            dataType: "json",
            complete: function (data_response) {
                
                var content = JSON.parse(data_response.responseText);
                
                var popUp = document.getElementById("add-to-playlist-pop-up");
                popUp.style.display = "block";
                            
                var closePng = new Image();
                closePng.src = "http://www.boofle.co.uk/images/close_button.png";
                closePng.style.height = '40px';
                closePng.style.width = '40px';

                closePng.style.position = 'absolute';
                closePng.style.top = '0px';
                closePng.style.left = '0px';
                closePng.style.marginTop = '-20px';
                closePng.style.marginLeft = '-20px';
                closePng.onclick = function () {
                    popUp.style.display = 'none';
                }
                
                popUp.appendChild(closePng);
                
                $('#user-playlists').html('');
                
                for(var i = 0; i < content.playlists.length; ++i){
                    
                    $('#user-playlists').append('<h2>' + content.playlists[i].title + '</h2>');
                    
                    var addButton = document.createElement('button');
                    addButton.appendChild(document.createTextNode('add'));
                    addButton.id = content.playlists[i].id;
                    addButton.onclick = function () {
                        addToPlaylist(this.id);
                    }
                    
                    $('#user-playlists').append(addButton);
                    
                }
              
            }
            
        });        
    }
    
    
    $("#like-button").click( function(){
        var buttonValue = $("#like-button").html();
        likeButtonAction(buttonValue.toLowerCase());  
    });
    
    $("#submit-button").click( function(){
        if ($("#message").val() != "")
            submitComment();
    });

    $("#add-to-playlist-button").click( function(){
        getPlaylists();
    });
    
    



});