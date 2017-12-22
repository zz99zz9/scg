$(".save").click(function(){

update();
});
/////////////
function update(){
classid=$("#classid").val();

    prodname=$("#prod_name").val();
	uptime=$("#uptime").val();
    DefaultPicUrl=$("#DefaultPicUrl").val();
    content=$("#content").val();
	content1=$("#content1").val();
	ioid=$("#ioid").val();
	if(ioid==""){ioid=0};
	
	Oid=$("#Oid").val();
	BigClassName=$("#BigClass").val().split(";")[0];
  BigClassId=$("#BigClass").val().split(";")[1];
  SmallClassName=$("#SmallClass").val().split(";")[0];
  SmallClassId=$("#SmallClass").val().split(";")[1];
	url=$("#url").val();
	title=$("#title").val();
	Keywords=$("#Keywords").val();
	Description=$("#Description").val();
	Passed=$("#Passed").is(':checked')
	Elite=$("#Elite").is(':checked')
	action=$("#action").val();//操作指令
	pid=$("#pid").val();//产品系统编号
	clb=$("#clb").val();
	if(clb=="类别"){clb=11};
//	if(clb==""||clb=="Null"){clb=0};
	//后加值
tips=$("#tips").val();//产品系统编号
picalt=$("#PicAlt").val();

console.log(action);

  $.post("ajax/prod.asp",{
	  BigClassName:BigClassName,
	  BigClassId:BigClassId,
	  SmallClassName:SmallClassName,
	  SmallClassId:SmallClassId,
	  classid:classid,
	  prodname:prodname,
	  DefaultPicUrl:DefaultPicUrl,
      content:content,
	  content1:content1,
	  Oid:Oid,
	  clb:clb,
	  ioid:ioid,
	  uptime:uptime,
	  url:url,
	  picalt:picalt,
	  Description:Description,
	  Keywords:Keywords,
      Passed:Passed,
	  Elite:Elite,
	  action:action,
	  pid:pid,
	  tips:tips,
	  title:title
	  },
	  
    function(data,status){
	  if(status=="success"){
	//	  console.log(data);
		   if(data=="add"){

		  location.href='Prod_List.Asp?sta=add&Prod_Type='+classid+''
		  }else if(data=="mod"){

			  location.href='Prod_List.Asp?sta=mod&Prod_Type='+classid+''
			  }else if(data=="del"){

			  location.href='Prod_List.Asp?sta=del&Prod_Type='+classid+''
		  }
		/* */

		  }
    });
}