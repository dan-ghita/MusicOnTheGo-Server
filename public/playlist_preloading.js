/**
 * Created by iustin on 5/25/15.
 */

window.addEventListener('load', function(){

    var playlistAnchors = document.querySelectorAll('.song-title > a'),
        playlist = [];

    for(var i=0; i< playlistAnchors.length; ++i){
        playlist[i] = playlistAnchors[i].getAttribute('href');
        playlistAnchors[i].className += (' song_no_' + i);
    }

    for(var i=0; i< playlistAnchors.length; ++i){
        playlistAnchors[i].addEventListener('click', function(evt){
            evt.preventDefault();
            var playerWindow = window.open(evt.target.getAttribute('href'));
            playerWindow.playlist = playlist;
            playerWindow.autoplay = true;
            playerWindow.currentIndex = parseInt(evt.target.className.charAt(
                evt.target.className.indexOf('song_no_') + 8)); // length('song_no_') = 8
            window.close();
        });
    }
});