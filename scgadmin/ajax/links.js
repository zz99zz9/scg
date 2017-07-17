var CName,BCId,OID,Action;

/*$(".mod").click(function(){
 var fid=$(this).data("fid");
 var action=$(this).data("action");
 var xgtable=$(this).data("xgtable");
 $("#ftable").val(xgtable);
 $("#fid").val(fid);
 $("#fAction").val(action);
 $("#fxgclass").modal();

 });*/
////////////////////////////
$(".lsave").click(function(){
 var id= $("#lid").val();
 var wid= $("#lwid").val();
 var action=$("#lAction").val();
	var tit=$("#ltit").val();
	var stit=$("#lstit").val();
	var stxt=$("#lstxt").val();//.replace(/\n/g,'<br/>')
	var file=$("#lfile").val();
	var oid=$("#loid").val();
	var url=$("#lurl").val();
	console.log(tit);
	console.log(stit);
	console.log(stxt);
	console.log(file);
	console.log(url);
	console.log(id);
	console.log(wid);
	console.log(oid);
	console.log(action);
	links(tit,stit,stxt,file,url,id,wid,oid,action);

})
/////////////////////////////////////
//            默认显示列表          //
////////////////////////////////////
function defalutlist(v,wid){

	links("","","","","","",wid,"",v);


};
/////////////////////////////////////
//              输出类别列表         //
////////////////////////////////////
function links(tit,stit,stxt,file,url,id,wid,oid,Action){

//ajax操作数据库
	$.post("ajax/links.asp",{tit:tit,stit:stit,stxt:stxt,Action:Action,oid:oid,file:file,wid:wid,id:id,url:url},
		function(data,status) {
			if (status == "success") {
					var jsObjstr =JSON.parse(data);
				console.log(data);

				//显示提示信息
				if (Action!="list"){
					$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert strong").html("操作成功!");
					if (Action=="add"){
						$("#alert span").html(" "+tit+" 相关内容添加成功。");
					}else if(Action=="mod"){
						$("#alert span").html(" "+tit+" 相关内容修改成功。");
					}else if(Action=="del"){
						$("#alert span").html(" "+tit+" 相关内容删除成功。");
					}
				}
				//输入列表
				var str = '';
				str+='<script type="text/javascript">';
				str+='$(".mod").click(function(){';
				str+='var id=$(this).data("id");';
				str+='var wid=$(this).data("wid");';
				str+='var tit=$(this).data("tit");';
				str+='var stit=$(this).data("stit");';
				str+='var stxt=$(this).data("stxt");';
				str+='var url=$(this).data("url");';
				str+='var file=$(this).data("file");';
				str+='var oid=$(this).data("oid");'
				str+='var action=$(this).data("action");';
				str+='if (action=="add"){';     ////////添加大类
				str+='$("#lid").val("");';
				str+='$("#lwid").val(wid);';
				str+='$("#loid").val("0");';
				str+='$("#ltit").val("");';
				str+='$("#lstit").val("");';
				str+='$("#lstxt").val("");';
				str+='$("#lfile").val("");';
				str+='$("#lurl").val("");';
				str+='$("#lAction").val(action);';
				str+='$("#ltit").removeAttr("disabled","");'
				str+='$("#ltxt").removeAttr("disabled","");'
				str+='$("#lfile").removeAttr("disabled","");'
				str+='$("#loid").removeAttr("disabled","");'
				str+='$(".lsave").html("保存")';
				str+='}else if(action=="mod"){';  ////////修改大类
				str+='$("#lid").val(id);';
				str+='$("#lwid").val(wid);';
				str+='$("#loid").val(oid);';
				str+='$("#ltit").val(tit);';
				str+='$("#lstit").val(stit);';
				str+='$("#lstxt").val(stxt);';
				str+='$("#lAction").val(action);';
				str+='$("#lfile").val(file);';
				str+='$("#lurl").val(url);';
				str+='$("#ltit").removeAttr("disabled","");'
				str+='$("#lstit").removeAttr("disabled","");'
				str+='$("#lstxt").removeAttr("disabled","");'
				str+='$("#lfile").removeAttr("disabled","");'
				str+='$("#loid").removeAttr("disabled","");'
				str+='$(".lsave").html("保存")';
				str+='}else if(action=="del"){';////////删除大类
				str+='$("#lid").val(id);';
				str+='$("#lwid").val(wid);';
				str+='$("#loid").val(oid);';
				str+='$("#ltit").val(tit);';
				str+='$("#lstit").val(stit);';
				str+='$("#lstxt").val(stxt);';
				str+='$("#lAction").val(action);';
				str+='$("#lfile").val(file);';
				str+='$("#lurl").val(url);';
				str+='$("#ltit").attr("disabled","");'
				str+='$("#lurl").attr("disabled","");'
				str+='$("#lstit").attr("disabled","");'
				str+='$("#lstxt").attr("disabled","");'
				str+='$("#lfile").attr("disabled","");'
				str+='$("#loid").attr("disabled","");'
				str+='$(".lsave").html("确认删除")';
				str+='}';
				str+='$("#xglinks").modal();';
				str+='})';
				str+='</script >';
				str+='<table class="table table-hover" id="sample_1">';
				str+='<tr ><th style="padding-left:50px;"><strong>名称</strong></th><th>排序</th><th ><strong>操作选项</strong></th></tr>';
				for (var i=0;i<jsObjstr.length;i++) {
					str += '<tr><td>'+jsObjstr[i].tit+'</td><td>'+jsObjstr[i].oid+'</td><td><button class="btn btn-success btn-xs mod" data-action="mod" data-wid="'+jsObjstr[i].wid+'" data-id="'+jsObjstr[i].id+'" data-stit="'+jsObjstr[i].stit+'" data-tit="'+jsObjstr[i].tit+'" data-stxt="'+jsObjstr[i].stxt+'" data-file="'+jsObjstr[i].file+'" data-toggle="modal" data-oid="'+jsObjstr[i].oid+'" data-url="'+jsObjstr[i].url+'" >修改</button> <button class="btn btn-danger btn-xs mod" data-action="del" data-wid="'+jsObjstr[i].wid+'" data-id="'+jsObjstr[i].id+'" data-tit="'+jsObjstr[i].tit+'" data-stit="'+jsObjstr[i].stit+'" data-stxt="'+jsObjstr[i].stxt+'" data-file="'+jsObjstr[i].file+'" data-toggle="modal"  data-oid="'+jsObjstr[i].oid+'" data-url="'+jsObjstr[i].url+'" >删除</button></td></tr>';
				}
				str+='</table>';
//


				$("#tablee").html(str);
			}
			});
		};
