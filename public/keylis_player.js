window.addEventListener('load',function(){

	document.querySelector('#message textarea').addEventListener('keypress', function(evt){

        if(evt.keyCode == 13){
            document.getElementById('submit-button').click();
        }        
    });
});