var CName,BCId,OID,Action;

/*$(".mod").click(function(){
	$("#xgclass").modal();
});*/
/////////////////////////////////////
//       添加、修改、删除类别         //
////////////////////////////////////
$(".save").click(function(){
	CName=$("#XGCName").val();
	CID=$("#XGCID").val();
	CFile=$("#XGCFile").val();
	Action=$("#XGAction").val();
	OID=$("#XGOID").val();
	Table=$("#XGTable").val();
		if (Action=="del"){$(this).attr("data-dismiss","modal");XgClass(CName,Action,CID,OID,Table,CFile);}
	else{
	if ($("#XGCName").hasClass("no")||$("#XGCName").val()==""||$("#XGOID").hasClass("no")||$("#XGOID").val()==""){
		$(this).removeAttr("data-dismiss");
		$("#XGCName").tooltip('show');
		$("#XGOID").tooltip('show');
	}else{
		$(this).attr("data-dismiss","modal");//隐藏弹窗
 XgClass(CName,Action,CID,OID,Table,CFile);//执行修改操作
/*		  console.log(CID);
		  console.log(CName);
		  console.log(Action);
		  console.log(OID);
		  console.log(Table);*/

	} 
	}

})



/////////////////////////////////////
//            默认显示列表          //
////////////////////////////////////
function defalutlist(v,tablename){

 XgClass("",v,"","",tablename,"");


};

/////////////////////////////////////
//              输出类别列表         //
////////////////////////////////////
function XgClass(CName,Action,CID,OID,Table,CFile){
console.log(Table+'2');
//ajax操作数据库
	 $.post("ajax/xgclass.asp",{CID:CID,CName:CName,Action:Action,OID:OID,Table:Table,CFile:CFile},
	  function(data,status){
	  if(status=="success"){
		var jsObjstr =JSON.parse(data);

		  //显示提示信息
		  if (Action!="list"){
					$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert strong").html("操作成功!");
				if (Action=="add"){
					$("#alert span").html(" "+CName+" 分类添加成功。");
				}else if(Action=="mod"){
					$("#alert span").html(" "+CName+" 分类修改成功。");
				}else if(Action=="del"){
					$("#alert span").html(" "+CName+" 分类删除成功。");
				}
		  }
		  console.log (Table);
			var str = '';
	//大类相关判断行为
	str+='<script type="text/javascript">';
	str+='$(".mod").click(function(){';
	str+='var cname=$(this).data("cname");';
	str+='var cfile=$(this).data("cfile");';
	str+='var cid=$(this).data("cid");';
	str+='var oid=$(this).data("oid");';
	str+='var action=$(this).data("action");';
//	str+='var table=$(this).data("table");';

	str+='if (action=="add"){';     ////////添加大类
	str+='$("#XGCName").val("");';
	str+='$("#XGAction").val("add");';
	str+='$("#XGTable").val("'+Table+'");';
	str+='$("#XGCFile").val("");';
	str+='$("p").remove();'
	str+='$("#xg-class .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#XGCName").removeAttr("disabled");'
	str+='$("#XGOID").val("0");';
	str+='}else if(action=="mod"){';  ////////修改大类
	str+='$("#XGCName").val(cname);';
	str+='$("#XGTable").val("'+Table+'");';
	str+='$("#XGAction").val("mod");';
	str+='$("#XGCFile").val(cfile);';
	str+='$("#XGCID").val(cid);';
	str+='$("#XGCName").removeAttr("disabled");'
	str+='$("p").remove();'
	str+='$("#xg-class .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#XGOID").val(oid);';
	str+='}else if(action=="del"){';////////删除大类
	str+='$("#XGCName").val(cname);';
	str+='$("#XGAction").val("del");';
	str+='$("#XGTable").val("'+Table+'");';
	str+='$("#XGCID").val(cid);';
	str+='$("#XGCName").attr("disabled","");'
	str+='$("#XGOID").val(oid);';
	str+='$("p").remove();'
str+='$("#xg-class .form-group:not(.form-group:first)").css("display","none");'
str+='$("#xg-class").before("<p>是否确定要删除以下类别及相关产品信息吗？</p>");'
	str+='}';
	
	str+='$("#xgclass").modal();';
	str+='});';
	str+='</script>';
		  //输入列表

	//输入列表
	str+='<table class="table table-hover" id="sample_1">';
	str+='<tr ><th style="padding-left:50px;"><strong>栏目名称</strong></th><th>排序</th><th ><strong>操作选项</strong></th></tr>';
	for (var i=0;i<jsObjstr.length;i++)
					{
	str+='<tr style="background-color:#F9F9F9;"><td style="padding-left:50px;"><img src="xgwl/img/jia.gif" width="15" height="15">'+jsObjstr[i].CName+'</td><td>'+jsObjstr[i].OID+'</td><td><button class="btn btn-success btn-xs mod" data-action="mod" data-cid="'+jsObjstr[i].CID+'" data-cname="'+jsObjstr[i].CName+'" data-cfile="'+jsObjstr[i].CFile+'" data-toggle="modal" data-oid="'+jsObjstr[i].OID+'" data-xgtable="'+Table+'">修改</button> <button class="btn btn-danger btn-xs mod" data-action="del" data-cid="'+jsObjstr[i].CID+'" data-cname="'+jsObjstr[i].CName+'" data-toggle="modal" data-oid="'+jsObjstr[i].OID+'" data-xgtable="'+Table+'">删除</button></td></tr>';
}
	str+='</table>';
//	


$("#tablee").html(str);  
	  }
});
	//处理数据



	}


/////////////////////////////////////
//            验证大类表单              //
////////////////////////////////////


