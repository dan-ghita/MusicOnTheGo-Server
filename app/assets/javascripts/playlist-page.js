/**
 * Created by iustin on 5/24/15.
 */

window.addEventListener('load',function(){

    var addSongButton = document.getElementById('add-song-button');

    if(addSongButton){
        addSongButton.addEventListener('click',function(){

            function focusOnSearchBarInput(){
                var searchBarInput = document.getElementById('search-bar-input');
                if(searchBarInput){
                    searchBarInput.focus();
                }
                else{
                    setTimeout(focusOnSearchBarInput, 10);
                }
            }

            focusOnSearchBarInput();

            document.getElementById('search-bar-input').addEventListener('keypress', function(evt){

                if(evt.keyCode == 13){
                    document.getElementById('search-bar-button').click();
                }
            });
        });
    }
});