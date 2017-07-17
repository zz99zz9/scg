$(".save").click(function(){
console.log("#_#");
update();
});
/////////////
function update(){
    tid=$("#id").val();
    name=$("#name").val();
	uptime=$("#uptime").val();
	keywords=$("#keywords").val();
	title=$("#title").val();
	Oid=$("#Oid").val();
	description=$("#description").val();
	action=$("#action").val();//操作指令

  $.post("ajax/tdk.asp",{
	  id:tid,
	  name:name,
	  uptime:uptime,
		  keywords:keywords,
		  title:title,
		  Oid:Oid,
		  description:description,
	  action:action,
	  },
    function(data,status){
	  if(status=="success"){

	//	  console.log(data);
		   if(data=="add"){
			   console.log("#_#||");
		  location.href='tdk_List.Asp?sta=add'
		  }else if(data=="mod"){

			  location.href='tdk_List.Asp?sta=mod'
			  }else if(data=="del"){

			  location.href='tdk_List.Asp?sta=del'
		  }
		/* */

		  }
    });
}