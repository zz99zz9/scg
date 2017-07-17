$(".save").click(function(){
  content=$("#content").val();
  gsjsid=$("#gsjsid").val();
type_wj=$("#type_wj").val();
  $.post("ajax/single.asp",{
      content:content,
      gsjsid:gsjsid,
	  type_wj:type_wj},
	  
    function(data,status){
	  if(data=="ok" && status=="success"){
		  $("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert strong").html("操作成功!");
		  }
    });
});
/////////////