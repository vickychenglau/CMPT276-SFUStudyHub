$(document).ready(function(){
  $(":checkbox").attr("checked", true);
  $(":checkbox").change(function(){
    var checkbox_val = $(this).val();
    if ($(this).prop("checked")){
      $("."+checkbox_val).show()
    }else{
      $("."+checkbox_val).hide()
    }
  });

});
