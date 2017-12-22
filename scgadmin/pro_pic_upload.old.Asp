<!--#include FILE="inc/xgconn.asp"-->
<html>
<head>
<title>图片上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<!--#include FILE="upload_sdxmf.inc"-->

<%
'formName=request("formName")
proid=request("proid")


set upload=new upload_sdxmf
set file=upload.file("file1")
if file.fileSize>0 then
filenameend=file.filename
filenameend=split(filenameend,".")
n=UBound(filenameend)
filename=filename&filenameend(n)

const filepath="../xgwl/UploadFiles/"		'上传路径
const filepathname = "xgwl/UploadFiles/"

dtNow=Now()
randomize
ranNum=int(90000*rnd)+10000
filename1=year(dtNow) & right("0" & month(dtNow),2) & right("0" & day(dtNow),2) & right("0" & hour(dtNow),2) & right("0" & minute(dtNow),2) & right("0" & second(dtNow),2) & ranNum &"."&fileExt
filename=filepath&filename1&filenameend(n)
filelstname=filepathname&filename1&filenameend(n)
		
if file.fileSize>51200000000 then
response.write "<script language='javascript'>"
response.write "alert('您上传的文件太大，上传不成功，单个文件最大不能超过500K！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if

if LCase(filenameend(n))<>"gif" and LCase(filenameend(n))<>"jpg" and LCase(filenameend(n))<>"png" then
response.write "<script language='javascript'>"
response.write "alert('不允许上传您选择的文件格式，请检查后重新上传！');"
response.write "location.href='javascript:history.go(-1)';"
response.write "</script>"
response.end
end if

file.saveAs Server.mappath(filename)
'==============================
 '函 数 名：CreateFolder
 '作    用：创建文件夹
 '参    数：文件夹相对路径FolderPath
 '==============================
 Function CreateFolder(FolderPath)
'  On Error Resume Next
  Set Fso=Server.CreateObject("Scri"&"pting.File"&"Sys"&"temObject")
  Set F=Fso.CreateFolder(Server.MapPath(FolderPath))
  CreateFolder=F.Path
  Set F=Nothing
  Set Fso=Nothing
'  Select Case Err
'   Case 424 Response.Write("方卡错误提示：创建"&FolderPath&"文件夹时，路径未找到或者该目录没有写入权限！")
'  End Select
 End Function
'response.write (conn)
conn.execute"INSERT INTO [Table_Pic] (pro_id,pic_url) VALUES ('"&proid&"','"&filelstname&"')"
%>
<script language="javascript">
window.alert("图片上传成功!！");
//location.href='pic_list.asp?pro_id=< % =pro_id%>';
</script>
<%
response.redirect("pic_list.asp?pro_id="&proid)
else
%>
<script language="javascript">
window.alert("请先选择你要上传的文件");
window.close();
</script>
<%
end if
set file=nothing
set upload=nothing
%>
</body> 
</html>
