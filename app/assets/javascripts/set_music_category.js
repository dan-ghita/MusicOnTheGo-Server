(function(){

    var cookies = document.cookie.split(';'),
        selectedPage;

    console.log(cookies);

    for(var i=0; i< cookies.length; ++i){

        console.log(cookies[i]);
        var pair = cookies[i].split('=');
        console.log(pair[0]==='selectedPage');
        if(pair[0]==='selectedPage'){
            alert(pair[1]);
        }
    }

    document.cookie = "selectedPage=1;";

})();