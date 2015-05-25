/**
 * Created by iustin on 5/25/15.
 */

window.addEventListener('load', function(){

    if(playlist){

        if(autoplay){
            document.getElementsByTagName('audio')[0].play();
        }

        var songFinished = false,
            playlistLength = playlist.length,
            previousSongWrapper = document.getElementById('previous-song-wrapper'),
            nextSongWrapper = document.getElementById('next-song-wrapper');

        if(currentIndex !== 0){

            previousSongWrapper.style.display = 'block';
            var previousSong = previousSongWrapper.firstElementChild;
            previousSong.setAttribute('href', playlist[currentIndex-1]);

            previousSong.addEventListener('click', function(evt){

                evt.preventDefault();
                var newWindow = window.open(playlist[currentIndex-1]);
                newWindow.playlist = playlist;
                newWindow.currentIndex = currentIndex-1;
                newWindow.autoplay = false;
                close();
            });
        }

        if(currentIndex !== playlistLength-1){

            nextSongWrapper.style.display = 'block';
            var nextSong = nextSongWrapper.firstElementChild;
            nextSong.setAttribute('href', playlist[currentIndex+1]);

            nextSong.addEventListener('click', function(evt){

                evt.preventDefault();
                var newWindow = window.open(playlist[currentIndex+1]);
                newWindow.playlist = playlist;
                newWindow.currentIndex = currentIndex+1;
                newWindow.autoplay = songFinished;
                close();
            });

            document.getElementsByTagName('audio')[0].addEventListener('ended',function(){
                songFinished = true;
                nextSong.click();
            });
        }
    }
})();