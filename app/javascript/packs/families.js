document.addEventListener("turbolinks:load", () => {
  $(document.body).on("change","#family_manufacturer_id",function(){
    $.ajax( "/dashboard/groups.json?manufacturer_id=" + this.value )
    .done(function(data) {
      var htmlOptions = ""
      data.forEach(function(group){
        htmlOptions += "<option value='" + group.id + "'>" + group.description  + "</option>"
      })
      $(".autoload_groups #family_group_id").html(htmlOptions);
    })
    .fail(function() {
      alert( "error" );
    });
  });
})