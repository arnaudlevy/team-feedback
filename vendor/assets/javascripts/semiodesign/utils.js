

(function (window, undefined) {
    "use strict";

    var $  = jQuery.noConflict();

    $.fn.fullpage = function (position_top) { 
        //sachant qu'elle est forcement en haut de la page => hauteur du header en moins
        var header_height = position_top;
        var window_height = $(window).height();
        var available_height = window_height - header_height;
        //var figure_available_height = window_height ;

        $(this).css({
            "height": available_height + "px"
        });
    }

    //centre un élément dans un autre en full screen (dépasse négativement du parent)
    //typiquement, une image / video dans un containeur pour faire full screen
    $.fn.setFullScreen = function (container) {

        var element_height = $(this).height();
        var element_width = $(this).width();

        var container_height = $(container).height();
        var container_width = $(container).width();

        var over = element_width / element_height; 
        var under = element_height / element_width; 
                  
        if (container_width / container_height >= over) { 
            $(this).css({ 
                'width': container_width + 'px', 
                'height': (under * container_width) + 'px', 
                'left': '0px', 
                'top': Math.abs((under * container_width) - container_height) / -2 + 'px' 
            }); 
        }  
        else { 
            $(this).css({ 
                'width': (over * container_height) + 'px', 
                'height': container_height + 'px', 
                'top': '0px', 
                'left': Math.abs((over * container_height) - container_width) / -2 + 'px' 
            }); 
        } 
    }

    //passe une vidéo en full screen (dépasse négativement du parent)
    $.fn.set_video_fullscreen = function (video, poster) {
            var element_width = video.videoWidth;
            var element_height = video.videoHeight;

            var over = element_width / element_height; 
            var under = element_height / element_width; 
            var container_width =  $(window).width();
            var container_height = $(window).height();
                      
            if (container_width / container_height >= over) { 
                var newWidth = container_width;
                var newHeight = under * container_width;
                var newLeft = 0;
                var newTop = Math.abs((under * container_width) - container_height) / -2;
           } else { 
                var newWidth = over * container_height;
                var newHeight = container_height;
                var newLeft = Math.abs((over * container_height) - container_width) / -2;
                var newTop = 0; 
            } 

            $(video).css({ 
                    'width':  newWidth + 'px', 
                    'height': newHeight + 'px', 
                    'left': newLeft + 'px', 
                    'top': newTop + 'px' 
            }); 
            if (poster != undefined) {
                $(poster).css({ 
                        'width':  newWidth + 'px', 
                        'height': newHeight + 'px', 
                        'left': newLeft + 'px', 
                        'top': newTop + 'px' 
                });                 
            }
        }



    // Center a masonry grid
    $.fn.centerGrid = function (parent_width, bricks) {
        var brick_width, bricks_per_line, count_bricks;

        brick_width     = bricks.outerWidth(true);
        bricks_per_line = parseInt(parent_width / brick_width);

        if (bricks.length < bricks_per_line)
            bricks_per_line = bricks.length;

        $(this).width(bricks_per_line * brick_width);
    }


    //element centré verticalement
    //wraper : element dans lequel il est centré (pas forcément le parent)
    $.fn.verticallyCentred = function (wraper) {
        $(this).css({
            "top": (($(wraper).height() - $(this).height()) / 2)+ "px"
        });
    }

    $.fn.vCenter = function () {       
        $(this).each(function(){
            if ($(this).outerHeight(true) < $(window).height()) {
                $(this).verticallyCentred(window);
            }
        });        
    }
     


    //scroll to #ID
    //element is a link : we use the href to get the target
    // /!\ with easing : need the easing jquery plugin
    $.fn.scrollToID = function () {
       $(this).bind("click", function (event) {
            event.preventDefault();
            $('html, body').stop().animate({
                scrollTop: $($(this).attr("href")).position().top
            }, 800, 'easeOutQuint');
        });
    }


    $.fn.getInternetExplorerVersion = function () {
        // Returns the version of Internet Explorer or a -1
        // (indicating the use of another browser).
        var rv = -1; // Return value assumes failure.
        if (navigator.appName == 'Microsoft Internet Explorer'){
            var ua = navigator.userAgent;
            var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
            if (re.exec(ua) != null) {
                rv = parseFloat( RegExp.$1 );
            }
        }
        return rv;
    }

    function semio_console(string) {
        if (console)
            console.log (string);
    }
    window.semio_console = semio_console;

})(window, jQuery);