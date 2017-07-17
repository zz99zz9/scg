var CName,BCId,OID,Action;


/////////////////////////////////////
//       添加、修改、删除类别         //
////////////////////////////////////
$(".save").click(function(){
	CName=$("CName").val();
	CID=$("#CID").val();
	Action=$("#Action").val();
	OID=$("#OID").val();
	Table="class_lx"
	if (Action=="del"){$(this).attr("data-dismiss","modal");XgClass(CName,Action,CID,OID,Table);}
	else{
	if ($("#CName").hasClass("no")||$("#CName").val()==""||$("#OID").hasClass("no")||$("#OID").val()==""){
		$(this).removeAttr("data-dismiss");
		$("#CName").tooltip('show');
		$("#OID").tooltip('show');
	}else{
		$(this).attr("data-dismiss","modal");//隐藏弹窗
 XgClass(CName,Action,CID,OID,Table);//执行修改操作

	} 
	}
})



/////////////////////////////////////
//            默认显示列表          //
////////////////////////////////////
function defalutlist(v){
console.log("112233")
 XgClass(CName,v,CID,OID);

};

/////////////////////////////////////
//              输出类别列表         //
////////////////////////////////////
function XgClass(CName,Action,CID,OID,Table){
	//处理数据
 $.post("ajax/xgclass.asp",{
      CName:CName,
      Action:Action,
	  CID:CID,
	  OID:OID},
    function(data,status){

	  if(status=="success"){
	//	var jsObjstr =JSON.parse(data);
		 console.log(data); 
		  //显示提示信息

		  }
	});
	//ajax操作数据库
	 $.post("ajax/xgclass.asp",{
      CName:CName,
      Action:Action,
	  CID:CID,
	  OID:OID},
    function(data,status){

	  if(status=="success"){
		var jsObjstr =JSON.parse(data);
		  
		  //显示提示信息
		  if (Action!="list"){
					$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert strong").html("操作成功!");
				if (Action=="add"){
					$("#alert span").html(" "+BCName+" 分类添加成功。");
				}else if(Action=="mod"){
					$("#alert span").html(" "+BCName+" 分类修改成功。");
				}else if(Action=="del"){
					$("#alert span").html(" "+BCName+" 分类删除成功。");
				}
		  }
	//刷新输出列表

	var str = '';
	//大类相关判断行为
	str+='<script type="text/javascript">';
	str+='$(".mod").click(function(){';
	str+='var cname=$(this).data("cname");';
	str+='var cid=$(this).data("cid");';
	str+='var oid=$(this).data("oid");';
	str+='var action=$(this).data("action");';

	str+='if (action=="add"){';     ////////添加大类
	str+='$("#CName").val("");';
	str+='$("#Action").val("add");';
	str+='$("p").remove();'
	str+='$("#xgclass .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#CName").removeAttr("disabled");'
	str+='$("#OID").val("0");';
	str+='}else if(action=="mod"){';  ////////修改大类
	str+='$("#CName").val(bcname);';
	str+='$("#Action").val("mod");';
	str+='$("#CID").val(bcid);';
	str+='$("#CName").removeAttr("disabled");'
	str+='$("p").remove();'
	str+='$("#xgclass .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#OID").val(oid);';
	str+='}else if(action=="del"){';////////删除大类
	str+='$("#CName").val(bcname);';
	str+='$("#Action").val("del");';
	str+='$("#CID").val(bcid);';
	str+='$("#CName").attr("disabled","");'
	str+='$("#OID").val(oid);';
	str+='$("p").remove();'
str+='$("#xgclass .form-group:not(.form-group:first)").css("display","none");'
str+='$("#xgclass").before("<p>是否确定要删除以下大类及相关产品信息吗？</p>");'
	str+='}';
	
	str+='$("#xgclass").modal();';
	str+='});';
	str+='</script>';

	//输入列表
	str+='<table class="table table-hover" id="sample_1">';
	str+='<tr ><th style="padding-left:50px;"><strong>栏目名称</strong></td><th ><strong>操作选项</strong></td></tr>';
	for (var i=0;i<jsObjstr.length;i++)
					{
	str+='<tr style="background-color:#F9F9F9;"><td style="padding-left:50px;"><img src="xgwl/img/jia.gif" width="15" height="15">'+jsObjstr[i].CName+'</td><td><button class="btn btn-success btn-xs smod" data-saction="add" data-bcid="'+jsObjstr[i].CID+'" data-bcname="'+jsObjstr[i].CName+'">添加子栏目</button> <button class="btn btn-success btn-xs mod" data-action="mod" data-bcid="'+jsObjstr[i].CID+'" data-bcname="'+jsObjstr[i].CName+'" data-toggle="modal" data-oid="'+jsObjstr[i].OID+'">修改</button> <button class="btn btn-danger btn-xs mod" data-action="del" data-bcid="'+jsObjstr[i].CID+'" data-bcname="'+jsObjstr[i].CName+'" data-toggle="modal" data-oid="'+jsObjstr[i].OID+'">删除</button></td></tr>';


	
					}

	str+='</table>';
	$("#tablee").html(str);
	}
    });
	}


/////////////////////////////////////
//            验证大类表单              //
////////////////////////////////////

$("#BigClassName").focus(function(){
		$(this).attr("title","由英文、数字或中文组成");
		$(this).tooltip('show');
});
$("#BigClassName").blur(function(){
	var reg = /[^\w\u4e00-\u9fa5]/g;    // 验证用户名正则

	if ($(this).val()==""){ 
		$(this).addClass("no");
		$(this).attr("data-original-title","类别名称不能为空");
		$(this).tooltip('show');
	}else if(reg.test($(this).val())){
		$(this).addClass("no");
		$(this).attr("data-original-title","类别名称不能含有非法字符");
		$(this).tooltip('show');
	}else {
		$(this).removeClass("no");
		$(this).tooltip('destroy');}
});
$("#OrderID").focus(function(){
		$(this).attr("title","排序ID只能是数字");
		$(this).tooltip('show');
});
$("#OrderID").blur(function(){
		var reg= /^[-+]?\d*$/;    //验证是否为数字
	if ($(this).val()==""){ 
		$(this).addClass("no");
		$(this).attr("data-original-title","排序ID不能为空");
		$(this).tooltip('show');
	}else if(!reg.test($(this).val())){
		$(this).addClass("no");
		$(this).attr("data-original-title","排序ID只能是数字");
		$(this).tooltip('show');
	}else {
		$(this).removeClass("no");
		$(this).tooltip('destroy');}
});
