//////////////////////////////////////
//             修改排序              //
/////////////////////////////////////
function picmod(proid,oid,picid){
	
	$.post("ajax/pic_list.asp",{proid:proid,oid:oid,picid:picid},
	  function(data,status){
	  if(status=="success"){
		var jsObjstr =JSON.parse(data);

	  }
	  });
}
/////////////////////////////////////
//            默认显示列表          //
////////////////////////////////////
function defaultlist(proid){

 piclist(proid,"","");


};

/////////////////////////////////////
//          显示列表                //
////////////////////////////////////
function piclist(proid,oid,picid){
//	console.log("ff");
	$.post("ajax/pic_list.asp",{proid:proid,oid:oid,picid:picid},
	  function(data,status){
	  if(status=="success"){
		var jsObjstr =JSON.parse(data);
		

		  //显示提示信息

			var str = '';

	//输入列表
	for (var i=0;i<jsObjstr.length;i++)
					{
	str+='<div class="col-sm-6 col-md-3 col-lg-2 piclist">';
	str+='<span class="editer"><div class="editerbor rbor"><input value="'+jsObjstr[i].oid+'" type="text" id="" class="form-control int"><input value="'+jsObjstr[i].picid+'" type="hidden" class="picid"><span class="txt">排序权重</span><a class="txt2 btn btn-xs btn-success hide">保 存</a></div><div class="editerbor"><a class="icon-remove b_h" href="pic_mod.asp?picid='+jsObjstr[i].picid+'&proid='+jsObjstr[i].proid+'" onClick="return ConfirmDel();"></a><span class="txt">删除图片</span></div></span>';
	str+='<a href="#" class="thumbnail">';
 	str+='<img src="../'+jsObjstr[i].picurl+'">';
    str+='</a>';
   	str+='</div>';
}
//输入添加图片链接
str+='<div class="col-sm-6 col-md-3 col-lg-2 piclist">';
str+='<form name="form1" id="form1" method="post" action="pro_pic_upload.asp?proid='+proid+'" enctype="multipart/form-data" >';
str+='<input type="file" name="file1" id="file1" class="hide">';
str+='<input type="text" name="proid" id="proid" value="'+proid+'" class="hide">';
str+='</form>';
str+='<p class="addpic" ><i class="icon-picture" ></i><span>添加图片</span></p>';
str+='<i class="thumbnail"><img src="../xgwl/img/122.gif"></i>';
str+='</div>';

str+='<script type="text/javascript">';
//上传图片提交表单
str+='  $(".addpic").click(function () {';
str+='    $("#file1").click(); ';
str+='     $("#file1").on("change",function(){';

str+='		 document.getElementById("form1").submit(); ';
str+='	 });';
str+='  });';
//修改排序时出现保存按钮
str+='$(".piclist .editer .editerbor .int").focus(function(){';
str+='	$(this).parents(".editerbor").find(".txt:first").addClass("hide");';
str+='	$(this).parents(".editerbor").find(".txt2").removeClass("hide");';
str+='	});';
//点击按钮提交数据
str+='$(".txt2").click(function(){';
str+='var cid=$(this).parents(".editerbor").find(".picid").val();';
str+='var cv=$(this).parents(".editerbor").find(".int").val();';
str+='location.href="pic_mod.asp?picid="+cid+"&oid="+cv+"&proid='+proid+'"';
//str+='console.log("+cid+");';
//str+='piclist("+proid+","+cv+","+cid+")';
str+='});';
str+='</script>';
//	


$("#tablee").html(str);  
	  }
});
	}