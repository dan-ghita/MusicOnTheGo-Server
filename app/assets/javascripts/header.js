$(document).ready(function() {

    function setSideBarBounds() {
        var width = document.getElementById("search-field").offsetWidth + document.getElementById("search-button").offsetWidth;
        document.getElementById("side-bar").style.width = "calc(0.6em + " + width + "px)";

        var pageHeight = document.getElementById("content").offsetHeight;
        document.getElementById("side-bar").style.height = "calc(" + pageHeight + "px + 7em)";
    }

    function resetSideBarBounds() {
        document.getElementById("side-bar").style.width = "calc(100% - 10em)";
        document.getElementById("side-bar").style.height = "initial";
        document.getElementById("container").style.transform = "none";
        $("#menu-button").one("click", showSideBar);
    }

    function resizeToSideBarMQ(sideBarMQ) {
        if (sideBarMQ.matches) {
            setSideBarBounds();
        } else {
            resetSideBarBounds();
        }
    }

    function showSideBar() {
        var menuWidth = document.getElementById("side-bar").offsetWidth;
        document.getElementById("container").style.transform = "translateX(" + menuWidth + "px)";

        $(this).one("click", hideSideBar);
    }

    function hideSideBar() {
        document.getElementById("container").style.transform = "none";

        $(this).one("click", showSideBar);
    }

    function showSubmenu() {
        $(this).children(".submenu").slideDown("fast");

        this.getElementsByClassName("drop-down-sign")[0].style.transform = "rotate(90deg)";
    }

    function hideSubmenu() {
        $(this).children(".submenu").slideUp("fast");

        this.getElementsByClassName("drop-down-sign")[0].style.transform = "none";
    }

    $("#menu-button").one("click", showSideBar);

    $(".drop-down").hover(showSubmenu, hideSubmenu);

    var sideBarMQ = window.matchMedia("(max-device-width: 1236px), (max-width: 1236px)");
    resizeToSideBarMQ(sideBarMQ);
    sideBarMQ.addListener(resizeToSideBarMQ);

});

