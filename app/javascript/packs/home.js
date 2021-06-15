import "./application"
import "../src/home"

$(document).ready(function () {
  var _mwi = 991;//width mobile menu enable
  function toggleDropdown(e) {
    //min width window 991px - hover menu show 
    if (window.innerWidth > _mwi) {
      var _d = $(e.target);
      setTimeout(function () {
        var shouldOpen = e.type !== 'click' && _d.is(':hover');
        _d.parents('.nav-item.dropdown').find('.dropdown-menu').toggleClass('show', shouldOpen);
        _d.parents('.nav-item.dropdown').toggleClass('show', shouldOpen);
        $(e.target).attr('aria-expanded', shouldOpen);
      }, e.type === 'mouseleave' ? 30 : 0);
    }
  }
});

//glider.min.js
"document"in self&&("classList"in document.createElement("_")&&(!document.createElementNS||"classList"in document.createElementNS("http://www.w3.org/2000/svg","g"))||!function(b){if("Element"in b){b=b.Element.prototype;var d=Object,g=String.prototype.trim||function(){return this.replace(/^\s+|\s+$/g,"")},a=Array.prototype.indexOf||function(l){for(var f=0,a=this.length;a>f;f++)if(f in this&&this[f]===l)return f;return-1},c=function(a,f){this.name=a;this.code=DOMException[a];this.message=f},h=function(l,
f){if(""===f)throw new c("SYNTAX_ERR","The token must not be empty.");if(/\s/.test(f))throw new c("INVALID_CHARACTER_ERR","The token must not contain space characters.");return a.call(l,f)},k=function(a){var f=g.call(a.getAttribute("class")||"");f=f?f.split(/\s+/):[];for(var b=0,h=f.length;h>b;b++)this.push(f[b]);this._updateClassName=function(){a.setAttribute("class",this.toString())}},e=k.prototype=[],m=function(){return new k(this)};if(c.prototype=Error.prototype,e.item=function(a){return this[a]||
null},e.contains=function(a){return~h(this,a+"")},e.add=function(){var a=arguments,f=0,b=a.length,c=!1;do{var e=a[f]+"";~h(this,e)||(this.push(e),c=!0)}while(++f<b);c&&this._updateClassName()},e.remove=function(){var a,b=arguments,c=0,e=b.length,k=!1;do{var d=b[c]+"";for(a=h(this,d);~a;)this.splice(a,1),k=!0,a=h(this,d)}while(++c<e);k&&this._updateClassName()},e.toggle=function(a,b){var h=this.contains(a),c=h?!0!==b&&"remove":!1!==b&&"add";return c&&this[c](a),!0===b||!1===b?b:!h},e.replace=function(a,
b){var c=h(a+"");~c&&(this.splice(c,1,b),this._updateClassName())},e.toString=function(){return this.join(" ")},d.defineProperty){e={get:m,enumerable:!0,configurable:!0};try{d.defineProperty(b,"classList",e)}catch(l){void 0!==l.number&&-2146823252!==l.number||(e.enumerable=!1,d.defineProperty(b,"classList",e))}}else d.prototype.__defineGetter__&&b.__defineGetter__("classList",m)}}(self),function(){var b=document.createElement("_");if(b.classList.add("c1","c2"),!b.classList.contains("c2")){var d=function(a){var b=
DOMTokenList.prototype[a];DOMTokenList.prototype[a]=function(a){var c,h=arguments.length;for(c=0;h>c;c++)a=arguments[c],b.call(this,a)}};d("add");d("remove")}if(b.classList.toggle("c3",!1),b.classList.contains("c3")){var g=DOMTokenList.prototype.toggle;DOMTokenList.prototype.toggle=function(a,b){return 1 in arguments&&!this.contains(a)==!b?b:g.call(this,a)}}"replace"in document.createElement("_").classList||(DOMTokenList.prototype.replace=function(a,b){var c=this.toString().split(" "),d=c.indexOf(a+
"");~d&&(c=c.slice(d),this.remove.apply(this,c),this.add(b),this.add.apply(this,c.slice(1)))});b=null}());
(function(){if("undefined"!==typeof window)try{var b=new window.CustomEvent("test",{cancelable:!0});b.preventDefault();if(!0!==b.defaultPrevented)throw Error("Could not prevent default");}catch(d){b=function(b,a){a=a||{bubbles:!1,cancelable:!1,detail:void 0};var c=document.createEvent("CustomEvent");c.initCustomEvent(b,a.bubbles,a.cancelable,a.detail);var d=c.preventDefault;c.preventDefault=function(){d.call(this);try{Object.defineProperty(this,"defaultPrevented",{get:function(){return!0}})}catch(k){this.defaultPrevented=
!0}};return c},b.prototype=window.Event.prototype,window.CustomEvent=b}})();
Object.assign||Object.defineProperty(Object,"assign",{enumerable:!1,configurable:!0,writable:!0,value:function(b){if(void 0===b||null===b)throw new TypeError("Cannot convert first argument to object");for(var d=Object(b),g=1;g<arguments.length;g++){var a=arguments[g];if(void 0!==a&&null!==a){a=Object(a);for(var c=Object.keys(Object(a)),h=0,k=c.length;h<k;h++){var e=c[h],m=Object.getOwnPropertyDescriptor(a,e);void 0!==m&&m.enumerable&&(d[e]=a[e])}}}return d}});
(function(){for(var b=0,d=["ms","moz","webkit","o"],g=0;g<d.length&&!window.requestAnimationFrame;++g)window.requestAnimationFrame=window[d[g]+"RequestAnimationFrame"],window.cancelAnimationFrame=window[d[g]+"CancelAnimationFrame"]||window[d[g]+"CancelRequestAnimationFrame"];window.requestAnimationFrame||(window.requestAnimationFrame=function(a,c){var d=(new Date).getTime(),g=Math.max(0,16-(d-b)),e=window.setTimeout(function(){a(d+g)},g);b=d+g;return e});window.cancelAnimationFrame||(window.cancelAnimationFrame=
function(a){clearTimeout(a)})})();
