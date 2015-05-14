


$( document ).ready(function() {

    function setSideBarWidth() {
        var width = document.getElementById("search-field").offsetWidth + document.getElementById("search-button").offsetWidth;
        document.getElementById("side-bar").style.width = "calc(0.6em + " + width + "px)";
    }

    $("#menu-button").click(function showSideBar() {
        setSideBarWidth();

        var width = document.getElementById("side-bar").offsetWidth;
        document.getElementById("container").style.transform = "translateX(" + width + "px)";

        var pageHeight = document.getElementById("content").offsetHeight;
        document.getElementById("side-bar").style.height = "calc(" + pageHeight + "px + 7em)";
    });
// function hideMenu() {
// 	document.getElementById("container").style.transform = "translateX(0)";
// };

    $(".drop-down").hover(  function showSubmenu() {
            $(".submenu").slideDown("fast");;
        },
        function hideSubmenu() {
            $(".submenu").slideUp("fast");;
        });

});
