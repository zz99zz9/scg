var BCName,EBCName,BCId,OID,Action;


/////////////////////////////////////
//       添加、修改、删除大类         //
////////////////////////////////////
$(".save").click(function(){
	BCName=$("#BigClassName").val();
	EBCName=$("#EnBigClassName").val();
	BCId=$("#BigClassId").val();
	Action=$("#BAction").val();
	OID=$("#OrderID").val();
	
	if (Action=="del"){$(this).attr("data-dismiss","modal");XgBigClass(BCName,EBCName,Action,BCId,OID);}
	else{
	if ($("#BigClassName").hasClass("no")||$("#BigClassName").val()==""||$("#OrderID").hasClass("no")||$("#OrderID").val()==""){
		$(this).removeAttr("data-dismiss");
		$("#BigClassName").tooltip('show');
		$("#OrderID").tooltip('show');
	}else{
		$(this).attr("data-dismiss","modal");//隐藏弹窗
 XgBigClass(BCName,EBCName,Action,BCId,OID);//执行修改大类操作
	}
	}
})
/////////////////////////////////////
//       添加、修改、删除小类         //
////////////////////////////////////
$(".ssave").click(function(){
	BCName=$("#SBigClassName").val();
	SCName=$("#SmallClassName").val();
	BCID=$("#SBigClassId").val();
	SCID=$("#SmallClassId").val();
	SAction=$("#SAction").val();
	SOID=$("#SOrderID").val();

	if (SAction=="del"){$(this).attr("data-dismiss","modal");XgSmallClass(BCName,BCID,SCName,SCID,SAction,SOID);}
	else{
	if ($("#SmallClassName").hasClass("no")||$("#SmallClassName").val()==""||$("#SOrderID").hasClass("no")||$("#SOrderID").val()==""){
		$(this).removeAttr("data-dismiss");
		$("#SmallClassName").tooltip('show');
		$("#SOrderID").tooltip('show');
	}else{
		$(this).attr("data-dismiss","modal");//隐藏弹窗
 XgSmallClass(BCName,BCID,SCName,SCID,SAction,SOID);//执行修改小类操作
	}
	}
})
/////////////////////////////////////
//         小类修改传值给JSON         //
/////////////////////////////////////
function XgSmallClass(BCName,BCID,SCName,SCID,SAction,SOID){
		//ajax操作数据库
	 $.post("ajax/bigclass.asp",{
      BCName:BCName,
      SAction:SAction,
	  BCID:BCID,
	  SOID:SOID,
	  SCName:SCName,
	  SCID:SCID},
    function(data,status){

	  if(status=="success"){
		  			if (SAction!="list"){
					$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert strong").html("操作成功!");
				if (SAction=="add"){
					$("#alert span").html("二级分类 "+SCName+" 添加成功。");
				}else if(SAction=="mod"){
					$("#alert span").html("二级分类 "+SCName+" 修改成功。");
				}else if(SAction=="del"){
					$("#alert span").html("二级分类 "+SCName+" 删除成功。");
				}
					
			};
		  defalutlist("list") //操作执行完毕，刷新列表
	  }
	});
	  }

/////////////////////////////////////
//            默认显示列表          //
////////////////////////////////////
function defalutlist(v){

 XgBigClass(BCName,EBCName,v,BCId,OID);
};

/////////////////////////////////////
//              输出列表大类         //
////////////////////////////////////
function XgBigClass(BCName,EBCName,Action,BCId,OID){

	//ajax操作数据库
	 $.post("ajax/bigclass.asp",{
      BCName:BCName,
      Action:Action,
	  BCId:BCId,
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
					$("#alert span").html("一级分类 "+BCName+" 添加成功。");
				}else if(Action=="mod"){
					$("#alert span").html("一级分类 "+BCName+" 修改成功。");
				}else if(Action=="del"){
					$("#alert span").html("一级分类 "+BCName+" 删除成功。");
				}
		  }
	//刷新输出列表

	var str = '';
	//大类相关判断行为
	str+='<script type="text/javascript">';
	str+='$(".mod").click(function(){';
	str+='var bcname=$(this).data("bcname");';
	str+='var bcid=$(this).data("bcid");';
	str+='var oid=$(this).data("oid");';
	str+='var action=$(this).data("action");';

	str+='if (action=="add"){';     ////////添加大类
	str+='$("#BigClassName").val("");';
	str+='$("#BAction").val("add");';
	str+='$("p").remove();'
	str+='$("#xgbigclass .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#BigClassName").removeAttr("disabled");'
	str+='$("#OrderID").val("0");';
	str+='}else if(action=="mod"){';  ////////修改大类
	str+='$("#BigClassName").val(bcname);';
	str+='$("#BAction").val("mod");';
	str+='$("#BigClassId").val(bcid);';
	str+='$("#BigClassName").removeAttr("disabled");'
	str+='$("p").remove();'
	str+='$("#xgbigclass .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#OrderID").val(oid);';
	str+='}else if(action=="del"){';////////删除大类
	str+='$("#BigClassName").val(bcname);';
	str+='$("#BAction").val("del");';
	str+='$("#BigClassId").val(bcid);';
	str+='$("#BigClassName").attr("disabled","");'
	str+='$("#OrderID").val(oid);';
	str+='$("p").remove();'
str+='$("#xgbigclass .form-group:not(.form-group:first)").css("display","none");'
str+='$("#xgbigclass").before("<p>是否确定要删除以下大类及相关产品信息吗？</p>");'
	str+='}';
	
	str+='$("#bigclass").modal();';
	str+='});';
	str+='</script>';
	//小类相关
	str+='<script type="text/javascript">';
	str+='$(".smod").click(function(){';
		str+='var bcname=$(this).data("bcname");';
		str+='var bcid=$(this).data("bcid");';
		str+='var scname=$(this).data("scname");';
		str+='var scid=$(this).data("scid");';
		str+='var sorderid=$(this).data("sorderid");';
		str+='var saction=$(this).data("saction");';
str+='if (saction=="add"){';//添加小类
	str+='$("#SmallClassName").removeAttr("disabled");'
	str+='$("p").remove();'
	str+='$("#xgsmallclass .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#SmallClassName").val("");';
	str+='$("#SmallClassId").val("");';
	str+='$("#SAction").val("add");';
	str+='$("#SOrderID").val("0");';
	str+='$("#SBigClassId").val(bcid);';
	str+='$("#SBigClassName").val(bcname);';
	str+='$("#smallclass").modal();';
str+='}else if (saction=="mod"){';//修改小类
		str+='$("#SmallClassName").removeAttr("disabled");'
	str+='$("p").remove();'
	str+='$("#xgsmallclass .form-group:not(.form-group:first)").css("display","block");'
	str+='$("#SmallClassName").val(scname);';
	str+='$("#SmallClassId").val(scid);';
	str+='$("#SAction").val(saction);';
	str+='$("#SOrderID").val(sorderid);';
	str+='$("#SBigClassId").val(bcid);';
	str+='$("#SBigClassName").val(bcname);';
	str+='$("#smallclass").modal();';
str+='}else if (saction=="del"){';//删除小类
		str+='$("p").remove();'
str+='$("#xgsmallclass .form-group:not(.form-group:first)").css("display","none");'
str+='$("#xgsmallclass").before("<p>是否确定要删除以下小类及相关产品信息吗？</p>");'
	str+='$("#SmallClassName").attr("disabled","");'
	str+='$("#SmallClassName").val(scname);';
	str+='$("#SBigClassId").val(bcid);';
	str+='$("#SmallClassId").val(scid);';
	str+='$("#SAction").val(saction);';
	str+='$("#SBigClassName").val(bcname);';
	str+='$("#smallclass").modal();';
str+='}';


	str+='});';
	str+='</script>';
	//输入列表
	str+='<table class="table table-hover" id="sample_1">';
	str+='<tr ><th style="padding-left:50px;"><strong>栏目名称</strong></td><th ><strong>操作选项</strong></td></tr>';
	for (var i=0;i<jsObjstr.length;i++)
					{
	str+='<tr style="background-color:#F9F9F9;"><td style="padding-left:50px;"><img src="xgwl/img/jia.gif" width="15" height="15">'+jsObjstr[i].BCName+'</td><td><button class="btn btn-success btn-xs smod" data-saction="add" data-bcid="'+jsObjstr[i].BCID+'" data-bcname="'+jsObjstr[i].BCName+'">添加子栏目</button> <button class="btn btn-success btn-xs mod" data-action="mod" data-bcid="'+jsObjstr[i].BCID+'" data-bcname="'+jsObjstr[i].BCName+'" data-toggle="modal" data-oid="'+jsObjstr[i].OId+'">修改</button> <button class="btn btn-danger btn-xs mod" data-action="del" data-bcid="'+jsObjstr[i].BCID+'" data-bcname="'+jsObjstr[i].BCName+'" data-toggle="modal" data-oid="'+jsObjstr[i].OId+'">删除</button></td></tr>';
	
	//输出小类列表
		for (var si=0;si<jsObjstr[i].s.length;si++){
			str+='<tr><td style="padding-left:50px;">&nbsp;&nbsp;<img src="xgwl/img/jian.gif" width="15" height="15">'+jsObjstr[i].s[si].SCName+'</td><td><button class="btn btn-success btn-xs smod" data-saction="mod" data-scid="'+jsObjstr[i].s[si].SCID+'" data-scname="'+jsObjstr[i].s[si].SCName+'" data-sorderid="'+jsObjstr[i].s[si].OId+'" data-bcid="'+jsObjstr[i].BCID+'" data-bcname="'+jsObjstr[i].BCName+'">修改</button> <button class="btn btn-danger btn-xs smod" data-scid="'+jsObjstr[i].s[si].SCID+'" data-scname="'+jsObjstr[i].s[si].SCName+'" data-sorderid="'+jsObjstr[i].s[si].OId+'" data-saction="del" data-bcid="'+jsObjstr[i].BCID+'" data-bcname="'+jsObjstr[i].BCName+'">删除</button></td></tr>';
		}
	
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
/////////////////////////////////////
//            验证小类表单              //
////////////////////////////////////

$("#SmallClassName").focus(function(){
		$(this).attr("title","由英文、数字或中文组成");
		$(this).tooltip('show');
});
$("#SmallClassName").blur(function(){
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
$("#SOrderID").focus(function(){
		$(this).attr("title","排序ID只能是数字");
		$(this).tooltip('show');
});
$("#SOrderID").blur(function(){
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