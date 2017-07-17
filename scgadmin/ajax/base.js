$(".save").click(function(){
console.log ($("#SiteKey").val());
  $.post("ajax/base.asp",{
	  siteid:$("#id").val(),
sitename:$("#SiteName").val(),
siteTitle:$("#SiteTitle").val(),
siteKey:$("#SiteKey").val(),
siteCont:$("#SiteCont").val(),
siteUrl:$("#SiteURl").val(),
siteCopyRight:$("#SiteCopyRight").val(),
sitebeian:$("#Sitebeian").val(),
WebMasterName:$("#WebMasterName").val(),
WebMasterEmail:$("#WebMasterEmail").val(),
Comail:$("#CoMail").val(),
CoName:$("#CoName").val(),
CoTel:$("#CoTel").val(),
CoFax:$("#CoFax").val(),
CoAddr:$("#Coaddr").val(),
CoCode:$("#CoCode").val()
},
    function(data,status){
		
	  if(data=="ok" && status=="success"){
		  $("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert strong").html("操作成功!");
		  }
    });
});
/////////////