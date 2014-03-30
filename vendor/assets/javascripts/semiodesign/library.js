/*jslint browser: true*/
/*encoding: utf-8*/
(function (window, undefined) {
    "use strict";

    var SemioDesign;

    SemioDesign = (function() {
        function SemioDesign() {}
        /*
         * Array compatibility for IE
         * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter?redirectlocale=en-US&redirectslug=JavaScript%2FReference%2FGlobal_Objects%2FArray%2Ffilter
         */
        SemioDesign.prototype.activeCompatibility = function() {
            if (!Array.prototype.filter) {
                Array.prototype.filter = function(fun /*, thisp*/) {
                    'use strict';

                    if (!this) {
                        throw new TypeError();
                    }

                    var objects = Object(this);
                    var len = objects.length >>> 0;
                    if (typeof fun !== 'function') {
                        throw new TypeError();
                    }

                    var res = [];
                    var thisp = arguments[1];
                    for (var i in objects) {
                        if (objects.hasOwnProperty(i)) {
                            if (fun.call(thisp, objects[i], i, objects)) {
                                res.push(objects[i]);
                            }
                        }
                    }
                    return res;
                }
            }
        }       
        return SemioDesign;
    })();
    /*
     * Expose SemioDesign as module
     */
    if (typeof module === "object" && module && typeof module.exports === "object") {
        module.exports = SemioDesign;

    /*
     * Expose SemioDesign to the global object as usual
     */
    } else {
        window.SemioDesign = window.SD = SemioDesign;

        if (typeof define === "function" && define.amd) {
            define("semiodesign", [], function () { return SemioDesign; });
        }
    }

})(window);
/*
 * SmartResize
 */
(function($,sr){

  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null;
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100);
      };
  }
  // smartresize 
  jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');
