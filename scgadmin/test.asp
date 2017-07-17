<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<div id="pic" style="height:20px;width:20px;background:#333;"></div>
<form name="form1" id="form1" method="post" action="testupload.asp" enctype="multipart/form-data" >
  <table width="400" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
    <tr class="hback">
      <td  class="xingmu"height="25" align="center"><strong>图片上传</strong>
        <input type="hidden" name="EditName" value="<%=EditName%>">
        <input type="hidden" name="FormName" value="<%=formName%>">
        <input type="hidden" name="act" value="uploadfile"></td>
    </tr>
    <tr  class="hback">
      <td height="80" align="center">选择文件:
      <input type="file" name="file1" style="width:300" id="file1" class="tx1" value=""> </td>
    </tr>
    <tr  class="hback">
      <td height="25" align="center"><input type="submit" name="Submit" value="开始上传" > </td>
    </tr>
  </table>
  <div id="esave" style="position:absolute; top:18px; left:40px; z-index:10; visibility:hidden"> 
    <TABLE WIDTH=340 BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR><td width=20%></td>
	<TD bgcolor=#104A7B width="60%"> 
	<TABLE WIDTH=100% height=120 BORDER=0 CELLSPACING=1 CELLPADDING=0>
	<TR> 
	          <td bgcolor=#eeeeee align=center><font color=red>正在上传文件，请稍候...</font></td>
	</tr>
	</table>
	</td><td width=20%></td>
	</tr>
    </table>
  </div>
</form>
<script type="text/javascript" src="xgwl/js/jquery.js"></script>

 <img id="pic" class="pic" style="height:50px;width:100px;"/>
 <script>
$(function() {
  $("#pic").click(function () {
    $("#file1").click();               //隐藏了input:file样式后，点击头像就可以本地上传
     $("#file1").on("change",function(){
		 var u=$("#file1").val();
       var objUrl = getObjectURL(this.files[0]) ;  //获取图片的路径，该路径不是图片在本地的路径
	   console.log(objUrl);
	   console.log(u);
       if (objUrl) {
         $(".pic").attr("src", objUrl) ;      //将图片路径存入src中，显示出图片
       }
	   //ajax处理上传过程
$.ajax({
    url: 'testupload.asp',
    type: 'POST',
    cache: false,
    data: new FormData($('#form1')[0]),
    processData: false,
    contentType: false
}).done(function(res) {
	console.log("done");
}).fail(function(res) {
	console.log("fail");
	});

	   //ajax处理完成
    });
  });
});
 
//建立一個可存取到該file的url
function getObjectURL(file) {
  var url = null ;
  if (window.createObjectURL!=undefined) { // basic
    url = window.createObjectURL(file) ;
  } else if (window.URL!=undefined) { // mozilla(firefox)
    url = window.URL.createObjectURL(file) ;
  } else if (window.webkitURL!=undefined) { // webkit or chrome
    url = window.webkitURL.createObjectURL(file) ;
  }
  return url ;
}

 </script>
<div class="ff" id="ff"></div>

</body>
</html>
