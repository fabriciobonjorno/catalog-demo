document.addEventListener("turbolinks:load", () => {

  $('#productTable').DataTable(
    {
      language: {
        url: '/pt_br.json'
      }
    }
  );

  $(document.body).on("change", ".load_manufacturer", function () {
    getManufacturerGroups(this.value, function (manufacturerGroups) {
      $(".load_group").html(renderSelectOptions(manufacturerGroups)).trigger('change');
    });
  });

  $(document.body).on("change", ".load_group", function () {
    getGroupFamilies(this.value, function (groupFamilies) {
      $(".load_family").html(renderSelectOptions(groupFamilies));
    });
  });

  $(document.body).on("change", 'input[name="tiporelatorio"]', function () {

    if ($('#tiporelatorio_true').is(':checked')) {
      $('#relatorio').attr('action', '/dashboard/search.pdf');
    } else {
      $('#relatorio').attr('action', '/dashboard/search.csv');
    }
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
  var htmlOptions = '<option selected="true" disabled="disabled">Selecione</option>'
  options.forEach(function (option) {
    htmlOptions += "<option value='" + option.id + "'>" + option.description + "</option>"
  })
  return htmlOptions
}