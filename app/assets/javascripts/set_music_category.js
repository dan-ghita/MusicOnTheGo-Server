$(document).ready(function(){

    window.addEventListener('load', function(){

        var trendingLink = document.getElementById('trending-link'),
            mostViewedLink = document.getElementById('most-viewed-link'),
            freshLink = document.getElementById('fresh-link'),
            trendingSongsContainer = document.getElementById("trending"),
            mostViewedSongsContainer = document.getElementById("most-viewed"),
            freshSongsContainer = document.getElementById("fresh");
        
        if(!trendingLink)
            return;
        trendingLink.setAttribute('underlined', 'true');

        trendingLink.addEventListener('click', function(){

            trendingSongsContainer.style.display = "block";
            mostViewedSongsContainer.style.display = "none";
            freshSongsContainer.style.display = "none";

            trendingLink.setAttribute('underlined', 'true');
            mostViewedLink.setAttribute('underlined', "");
            freshLink.setAttribute('underlined', "");
        });

        mostViewedLink.addEventListener('click', function(){

            trendingSongsContainer.style.display = "none";
            mostViewedSongsContainer.style.display = "block";
            freshSongsContainer.style.display = "none";

            trendingLink.setAttribute('underlined', "");
            mostViewedLink.setAttribute('underlined', 'true');
            freshLink.setAttribute('underlined', "");
        });

        freshLink.addEventListener('click', function(){

            trendingSongsContainer.style.display = "none";
            mostViewedSongsContainer.style.display = "none";
            freshSongsContainer.style.display = "block";

            trendingLink.setAttribute('underlined', "");
            mostViewedLink.setAttribute('underlined', "");
            freshLink.setAttribute('underlined', 'true');
        });

    });

});