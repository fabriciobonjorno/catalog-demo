document.addEventListener("turbolinks:load", () => {

  $('#productTable').DataTable();


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