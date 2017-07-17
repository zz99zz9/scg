<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc/xgconn.asp"-->
<%dim proid,oid,picid
proid=request("proid")
oid=request("oid")
picid=request("picid")
if proid<>"" then proid=int(proid)
if oid<>"" then oid=int(oid)
if picid<>"" then picid=int(picid)

if oid="" then
conn.execute "delete from [Table_pic] where Id="&Trim(picid)
'Set fso = CreateObject("Scripting.FileSystemObject")
'If (fso.FileExists(imgpath)) Then '//判断该文件是否存在
'fso.DeleteFile(imgpath) '//如果存在就删罗
'end if

else
conn.execute"update [Table_pic] set oid="&oid&" where id="&Trim(picid)&""
end if
response.Redirect("pic_list.asp?pro_id="&proid)
%>