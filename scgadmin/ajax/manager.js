var AdminName;
var AdminPass;
var Action;
var AdminId;
//默认隐藏tip


/////////////////////////////////////
//       添加、修改、删除管理员        //
////////////////////////////////////
$(".adminadd").click(function(){
	AdminName=$("#AdminName").val();
	AdminPass=$("#AdminPass").val();
	Action=$("#Action").val();
	AdminId=$("#AdminId").val();
	if (Action=="del"){$(this).attr("data-dismiss","modal");adminlist(AdminName,AdminPass,Action,AdminId);}
	else{
	if ($("#AdminName").hasClass("no")||$("#AdminName").val()==""||$("#AdminPass").hasClass("no")||$("#AdminPass").val()==""||$("#AdminPass2").hasClass("no")||$("#AdminPass2").val()==""){
		$(this).removeAttr("data-dismiss");
		$("#AdminName").tooltip('show');
		$("#AdminPass").tooltip('show');
		$("#AdminPass2").tooltip('show');
	}else{
		$(this).attr("data-dismiss","modal");
 adminlist(AdminName,AdminPass,Action,AdminId);
	}
	}
})


/////////////////////////////////////
//            默认显示列表            //
////////////////////////////////////
function defalutlist(v){

 adminlist(AdminName,AdminPass,v,AdminId);
};


/////////////////////////////////////
//         管理员编辑&调用           //
////////////////////////////////////
function adminlist(AdminName,AdminPass,Action,AdminId) {


			var xmlhttp=new XMLHttpRequest();                           //申明AJAX方法
			xmlhttp.open("post","ajax/manager.asp",true);        //定义传送方式和内容
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			
			if (Action=="list"){
			xmlhttp.send("Action=list");//提交内容
			}else{
			//	console.log(AdminName + Action + AdminPass + AdminId);
				xmlhttp.send("Action="+Action+"&AdminName="+AdminName+"&AdminPass="+AdminPass+"&AdminId="+AdminId+"");//提交内容}
}
			   xmlhttp.onreadystatechange=function()                          //开始验证
			  {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)            //前面=4，后面=200即是验证后获取到值
				{
					var jsObj = xmlhttp.responseText;
					var jsObjstr =JSON.parse(jsObj);//[{"user":"1","pass":"1"},{"user":"2","pass":"2"},{"user":"3","pass":"3"}];
				//	console.log(jsObjstr[0].AdminId);
					//提示窗
			if (Action!="list"){
					$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert strong").html("操作成功!");
				if (Action=="add"){
					$("#alert span").html("管理员 "+AdminName+" 添加成功。");
				}else if(Action=="mod"){
					$("#alert span").html("管理员 "+AdminName+" 修改成功。");
				}else if(Action=="del"){
					$("#alert span").html("管理员 "+AdminName+" 删除成功。");
				}
					
			};

					//列表
					var str = '';
str+='<script type="text/javascript">'
str+='$(".mod").click(function(){'
str+='var mname=$(this).data("mname");'
str+='var mid=$(this).data("mid");'
str+='var action=$(this).data("action");'
str+='$("#AdminName").tooltip("hide");'
str+='$("#AdminPass").tooltip("hide");'
str+='$("#AdminPass2").tooltip("hide");'
str+='if(action=="mod"){'///////////////修改管理员信息
		
str+='$("#AdminPass").val("");'
str+='$("#AdminPass2").val("");'
str+='$("#AdminName").val(mname);'
str+='$("#AdminName").attr("disabled","");'
str+='$("#AdminId").val(mid);'
str+='$("p").remove();'
str+='$("#Action").val(action);'
str+='$(".form-group:not(.form-group:first)").css("display","block");'
str+='$("#adminadd").modal();'
str+='}else if(action=="add"){'///////////////添加管理员信息

str+='$("#AdminPass").val("");'
str+='$("#AdminPass2").val("");'
str+='$("#AdminName").val("");'
str+='$("p").remove();'
str+='$("#AdminName").removeAttr("disabled");'
str+='$("#AdminId").val("");'
str+='$("#Action").val(action);'
str+='$(".form-group:not(.form-group:first)").css("display","block");'
str+='$("#adminadd").modal();'	
str+='}else if(action=="del"){'///////////////删除管理员信息

str+='$("#AdminName").val(mname);'
str+='$("#AdminName").attr("disabled","");'
str+='$("#AdminId").val(mid);'
str+='$("#Action").val(action);'
str+='$("p").remove();'
str+='$("#xgform .form-group:not(.form-group:first)").css("display","none");'
str+='$("#xgform").before("<p>是否确定要删除以下管理员信息？</p>");'
str+='$("#adminadd").modal();'	
str+='}'///////////////添加修改删除管理员判断完毕

//str+='console.log("mid:"+mname);'
//str+='console.log("action:"+action);'

str+='});'
str+='</script>'
str+='<table class="table table-striped border-top table-hover" id="sample_1">';
str+='<thead>';
str+='<tr>';
//str+='<th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>';

str+='<th class="hidden-phone">ID</th>';
str+='<th>登录名</th>';
str+='<th class="hidden-phone">添加时间</th>';
str+='<th class="hidden-phone">最后登录时间</th>';
str+='<th>操作</th>';
str+='</tr>';
str+='</thead>';
str+='<tbody >';

for (var i=0;i<jsObjstr.length;i++)
					{
str+='<tr class="odd gradeX">';
//str+='<td><input type="checkbox" class="checkboxes" value="'+jsObjstr[i].AdminId+'" /></td>';

str+='<td class="hidden-phone">'+jsObjstr[i].AdminId+'</td>';
str+='<td> '+jsObjstr[i].AdminName+' </td>';
str+='<td class="hidden-phone">'+jsObjstr[i].AdminDateTime+'</td>';
str+='<td class="center hidden-phone">02.03.2013</td>';
str+='<td><button class="btn btn-primary btn-xs mod" data-toggle="modal" data-action="mod" data-mid="'+jsObjstr[i].AdminId+'" data-mname="'+jsObjstr[i].AdminName+'"><i class="icon-pencil"></i> 修改</button> <button class="btn btn-danger btn-xs mod" data-toggle="modal" data-action="del" data-mid="'+jsObjstr[i].AdminId+'" data-mname="'+jsObjstr[i].AdminName+'"><i class="icon-remove "></i> 删除</button> </td>';
str+='</tr>';

	}
	
str+='</tbody>';
str+='</table>';
str+='<script type="text/javascript" src="xgwl/assets/data-tables/jquery.dataTables.js"></script>';
str+='<script type="text/javascript" src="xgwl/assets/data-tables/DT_bootstrap.js"></script>';
str+='<script src="xgwl/js/dynamic-table.js"></script>';

$("#tablee").html(str);
					                          
				}
			  }
};


/////////////////////////////////////
//          验证管理员表单           //
////////////////////////////////////
function getLength(str){
  // \x00-xff代表单字节字符。
  return str.replace(/[^\x00-\xff]/g, "xx").length;
}

    var reg = /[^\w\u4e00-\u9fa5]/g;    // 验证用户名正则 
	var reg1 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/; // 验证邮箱正则    
    var reg2 = /^1\d{10}$/;     //验证手机号正则
	
$("#AdminName").focus(function(){
		$(this).attr("title","由4-16个英文、数字或中文组成");
		$(this).tooltip('show');
});
$("#AdminName").blur(function(){
	if ($(this).val()==""){ 
		$(this).addClass("no");
		$(this).attr("data-original-title","用户名不能为空");
		$(this).tooltip('show');
	}else if(reg.test($(this).val())){
		$(this).addClass("no");
		$(this).attr("data-original-title","用户名不能含有非法字符");
		$(this).tooltip('show');
	}else if(getLength($(this).val())<4){
		$(this).addClass("no");
		$(this).attr("data-original-title","用户名不能少于4个字符");
		$(this).tooltip('show');
	}else if(getLength($(this).val())>16){
		$(this).addClass("no");
		$(this).attr("data-original-title","用户名不能多于16个字符");
		$(this).tooltip('show');
	}else {
		$(this).removeClass("no");
		$(this).tooltip('destroy');}
});
$("#AdminPass").focus(function(){
	$(this).attr("title","由6-20个英文、数字或常用符号组成");
		$(this).tooltip('show');
});
$("#AdminPass").blur(function(){
	if ($(this).val()==""){ 
		$(this).addClass("no");
		$(this).attr("data-original-title","密码不能为空");
		$(this).tooltip('show');
	}else if($(this).val()==$("#AdminName").val()){
		$(this).addClass("no");
		$(this).attr("data-original-title","密码不能和用户名相同");
		$(this).tooltip('show');
	}else if(getLength($(this).val())<6){
		$(this).addClass("no");
		$(this).attr("data-original-title","密码不能少于6位");
		$(this).tooltip('show');
	}else if(getLength($(this).val())>16){
		$(this).addClass("no");
		$(this).attr("data-original-title","用户名不能多于16位");
		$(this).tooltip('show');
	}else{
		$(this).removeClass("no");
		$(this).tooltip('destroy');
	}
	
});
$("#AdminPass2").focus(function(){
	$(this).attr("title","请再次输入密码");
		$(this).tooltip('show');
});
$("#AdminPass2").blur(function(){
	if ($(this).val()==""){ 
		$(this).addClass("no");
		$(this).attr("data-original-title","确认密码不能为空");
		$(this).tooltip('show');
	}else if($(this).val()!=$("#AdminPass").val()){
		$(this).addClass("no");
		$(this).attr("data-original-title","两次密码输入不一样");
		$(this).tooltip('show');
	}else{
		$(this).removeClass("no");
		$(this).tooltip('destroy');
	}
	});