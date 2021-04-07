import "./application"
import "../src/dashboard"
import "./adminlte.min"
import "./dashboard2"
import "datatables.net"
import "./datatable"
import "select2"

$(document).ready(function(){
  $(".autoload_families #id_group").change(function(){
    if (this.value == "") {
      $(".autoload_families #id_family").html("");
      return
    }
    $.ajax("/dashboard/families.json?group_id=" + this.value )
    .done(function(data){
      var htmlOptions = ""
      for(var i = 0; i<data.length; i++){
        htmlOptions += "<option value='"+ data[i].id +"'>" + data[i].description + "</option>"
      }
      $(".autoload_families #id_family").html(htmlOptions);
    })
    .fail(function(){

    });
  });
});