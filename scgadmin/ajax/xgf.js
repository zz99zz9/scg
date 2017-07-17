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
$(".fsave").click(function(){
 var fid= $("#fid").val();
 var ffid= $("#ffid").val();
 var action=$("#fAction").val();
	var ftit=$("#ftit").val();
	var ftxt=$("#ftxt").val();//.replace(/\n/g,'<br/>')
	var ffile=$("#ffile").val();
	var foid=$("#foid").val();
	var ftable=$("#ftable").val();
	var fjg=$("#fjg").val();
	xgf(ftit,ftxt,fid,ffid,foid,ffile,action,ftable,fjg);

})
/////////////////////////////////////
//            默认显示列表          //
////////////////////////////////////
function defalutlist(v,tablename,fid){

	xgf("","","",fid,"","",v,tablename,"");


};
/////////////////////////////////////
//              输出类别列表         //
////////////////////////////////////
function xgf(tit,txt,id,fid,oid,file,Action,table,jg){

//ajax操作数据库
	$.post("ajax/xgf.asp",{tit:tit,txt:txt,Action:Action,oid:oid,table:table,file:file,fid:fid,id:id,jg:jg},
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
				str+='var fid=$(this).data("fid");';
				str+='var ffid=$(this).data("ffid");';
				str+='var tit=$(this).data("ftit");';
				str+='var jg=$(this).data("fjg");';
				str+='var txt=$(this).data("ftxt");';
				str+='var file=$(this).data("ffile");';
				str+='var foid=$(this).data("foid");'
				str+='var action=$(this).data("action");';
				str+='var ftable=$(this).data("ftable");';
				str+='if (action=="add"){';     ////////添加大类
				str+='$("#fid").val("");';
				str+='$("#ffid").val(ffid);';
				str+='$("#foid").val("0");';
				str+='$("#ftit").val("");';
				str+='$("#ftxt").val("");';
				str+='$("#fjg").val("");';
				str+='$("#fAction").val(action);';
				str+='$("#ffile").val("");';
				str+='$("#ftable").val(ftable);';
				str+='$("#ftit").removeAttr("disabled","");'
				str+='$("#ftxt").removeAttr("disabled","");'
				str+='$("#ffile").removeAttr("disabled","");'
				str+='$("#foid").removeAttr("disabled","");'
				str+='$(".fsave").html("保存")';
				str+='}else if(action=="mod"){';  ////////修改大类
				str+='$("#fid").val(fid);';
				str+='$("#ffid").val(ffid);';
				str+='$("#foid").val(foid);';
				str+='$("#fjg").val(jg);';
				str+='$("#ftit").val(tit);';
				str+='$("#ftxt").val(txt);';
				str+='$("#fAction").val(action);';
				str+='$("#ffile").val(file);';
				str+='$("#ftable").val(ftable);';
				str+='$("#ftit").removeAttr("disabled","");'
				str+='$("#ftxt").removeAttr("disabled","");'
				str+='$("#ffile").removeAttr("disabled","");'
				str+='$("#foid").removeAttr("disabled","");'
				str+='$(".fsave").html("保存")';
				str+='}else if(action=="del"){';////////删除大类
				str+='$("#fid").val(fid);';
				str+='$("#ffid").val(ffid);';
				str+='$("#foid").val(foid);';
				str+='$("#ftit").val(tit);';
				str+='$("#fjg").val(jg);';
				str+='$("#ftxt").val(txt);';
				str+='$("#fAction").val(action);';
				str+='$("#ffile").val(file);';
				str+='$("#ftable").val(ftable);';
				str+='$("#ftit").attr("disabled","");'
				str+='$("#fjg").attr("disabled","");'
				str+='$("#ftxt").attr("disabled","");'
				str+='$("#ffile").attr("disabled","");'
				str+='$("#foid").attr("disabled","");'
				str+='$(".fsave").html("确认删除")';
				str+='}';
				str+='$("#fxgclass").modal();';
				str+='})';
				str+='</script >';
				str+='<table class="table table-hover" id="sample_1">';
				str+='<tr ><th style="padding-left:50px;"><strong>名称</strong></th><th>排序</th><th ><strong>操作选项</strong></th></tr>';
				for (var i=0;i<jsObjstr.length;i++) {
					str += '<tr><td>'+jsObjstr[i].tit+'</td><td>'+jsObjstr[i].oid+'</td><td><button class="btn btn-success btn-xs mod" data-action="mod" data-ffid="'+jsObjstr[i].fid+'" data-fid="'+jsObjstr[i].id+'" data-ftit="'+jsObjstr[i].tit+'" data-ffile="'+jsObjstr[i].file+'" data-toggle="modal" data-foid="'+jsObjstr[i].oid+'" data-ftxt="'+jsObjstr[i].txt+'" data-fjg="'+jsObjstr[i].jg+'" data-ftable="'+table+'">修改</button> <button class="btn btn-danger btn-xs mod" data-action="del" data-ffid="'+jsObjstr[i].fid+'" data-fid="'+jsObjstr[i].id+'" data-fjg="'+jsObjstr[i].jg+'" data-ftit="'+jsObjstr[i].tit+'" data-ffile="'+jsObjstr[i].file+'" data-toggle="modal" data-foid="'+jsObjstr[i].oid+'" data-ftxt="'+jsObjstr[i].txt+'" data-ftable="'+table+'">删除</button></td></tr>';
				}
				str+='</table>';
//


				$("#tablee").html(str);
			}
			});
		};
