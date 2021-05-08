document.addEventListener("turbolinks:load", () => {

  $('#productTable').DataTable(
    {
      language: {
        url: '/packs/pt_br.json'
      }
    }
  );


  $(document.body).on("change", "#product_manufacturer_id", function () {
    getManufacturerGroups(this.value, function (manufacturerGroups) {
      $("#product_group_id").html(renderSelectOptions(manufacturerGroups)).trigger('change');
    });
  });
  $(document.body).on("change", "#manufacturer_id", function () {
    getManufacturerGroups(this.value, function (manufacturerGroups) {
      $("#group_id").html(renderSelectOptions(manufacturerGroups)).trigger('change');
    });

  });

  $(document.body).on("change", "#product_group_id", function () {
    getGroupFamilies(this.value, function (groupFamilies) {
      $("#product_family_id").html(renderSelectOptions(groupFamilies));
    });
  });
  $(document.body).on("change", "#group_id", function () {
    getGroupFamilies(this.value, function (groupFamilies) {
      $("#family_id").html(renderSelectOptions(groupFamilies));
    });
  });

  $(document.body).on("change", 'input[name="tiporelatorio"]', function () {

    if ($('#tiporelatorio_true').is(':checked')) {
      $('#relatorio').attr('action', '/dashboard/search.pdf');
    } else {
      $('#relatorio').attr('action', '/dashboard/search.csv');
    }
  });

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



function getManufacturerGroups(manufacturerId, callback) {
  if (manufacturerId == '') { callback([]); return; }
  $.ajax(`/dashboard/groups.json?manufacturer_id=${manufacturerId}`)
    .done(callback)
    .fail(function () { alert("error"); });
}

function getGroupFamilies(groupId, callback) {
  if (groupId == '') { callback([]); return; }
  $.ajax(`/dashboard/families.json?group_id=${groupId}`)
    .done(callback)
    .fail(function () { alert("error"); });
}

function renderSelectOptions(options) {
  var htmlOptions = ""
  options.forEach(function (option) {
    htmlOptions += "<option value='" + option.id + "'>" + option.description + "</option>"
  })
  return htmlOptions
}