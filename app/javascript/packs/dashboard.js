import "./application"
import "../src/dashboard"
import "./adminlte.min"
import "datatables.net"
import "./datatable"
import "select2"
import "./families"
import "./products"
// app/javascript/packs/application.js
import './addfields'
import './removefields'

document.addEventListener("turbolinks:load", () => {

  $(document.body).on("change", "#browse", function () {
    var files = this.files;
    var errors = "";

    if (!files) {
      errors += "File upload not supported by your browser.";
    }
    if (files && files[0]) {
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if ((/\.(png|jpeg|jpg)$/i).test(file.name)) {
          var reader = new FileReader();
          reader.onload = function (e) {

            $('.img_prev')
              .attr('src', e.target.result)
              .width(300);
          };

          reader.readAsDataURL(file);
        } else {
          errors += file.name + "\nExtensão do arquivo inválida. São válidos apenas png, jpg e jpeg\n";
        }
      }
    }

    if (errors) {
      alert(errors);
    }
  });

  $(document.body).on("change", ".photo-upload", function (e) {
    e.target.nextElementSibling.innerHTML = e.target.files[0].name;
  });

})