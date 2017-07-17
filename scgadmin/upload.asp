<!--#include file="UpLoad_Class.asp"-->
<%
dim upload
set upload = new AnUpLoad
upload.Exe = "*"
upload.MaxSize = 2 * 1024 * 1024 '2M
upload.GetData()
if upload.ErrorID>0 then 
	response.Write upload.Description
else
	dim file,savpath
	savepath = "../jll/UploadFiles"
	for each frm in upload.forms("-1")
	'	response.Write frm & "=" & upload.forms(frm) & "<br />"
	next
	
	set file = upload.Files("file1")
	if file.isfile then
		result = file.saveToFile(savepath,0,true)
		if result then
			'response.Write "文件'" & file.LocalName & "'上传成功，保存位置'" & server.MapPath(savepath & "/" & file.filename) & "',文件大小" & file.size & "字节<br />"
			response.write "<script>window.opener.document."&upload.forms("FormName")&"."&upload.forms("EditName")&".value='"&replace(savepath,"../","") & "/" & file.filename&"'</script>"
			response.write "<script language='javascript'>window.alert('文件上传成功!');window.close();</script>"
		else
			response.Write file.Exception & "<br />"
		end if
	end if
	
	set file = upload.Files_Muti("file1",1)
	if file.isfile then
		result = file.saveToFile(savepath,1,true)
		if result then
	'		response.Write "文件'" & file.LocalName & "'上传成功，保存位置'" & server.MapPath(savepath & "/" & file.filename) & "',文件大小" & file.size & "字节<br />"
			response.write "<script>window.opener.document."&upload.forms("FormName")&"."&upload.forms("EditName")&".value='"&file.filename&"'</script>"
			response.write "<script>window.opener.document."&upload.forms("FormName")&"."&upload.forms("EditName")&".value='"&savepath & "/" & file.filename&"'</script>"
			response.write "<script language='javascript'>window.alert('文件上传成功!');window.close();</script>"
		else
			response.Write file.Exception & "<br />"
		end if
	end if
	
	Response.Write "成功保存的文件个数：" & Upload.QuickSave("file1",savepath) & "个"
	
end if
set upload = nothing
%>