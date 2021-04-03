import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "@fortawesome/fontawesome-free/js/all"
import "../src/application"
//import "./flashMessages"

var jQuery = require("jquery")

// import jQuery from "jquery";
global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()