/**
 * Created by iustin on 5/25/15.
 */

window.addEventListener('load', function(){
    var width = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    if(width > 1367){
        document.getElementById('results').style.height = '50em';
    }

    window.addEventListener('resize', function(){
        var width = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
        if(width > 1367){
            document.getElementById('results').style.height = '50em';
        }
        else{
            document.getElementById('results').style.height = '25.98em';
        }
    });
});