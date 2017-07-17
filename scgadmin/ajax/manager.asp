<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<!--#include file="../inc/md5.asp"-->
<%
dim Action
Action=request("Action")
AdminId=request("AdminId")
AdminName=request.Form("AdminName")
AdminPass=request("AdminPass")

select case Action
Case "add"
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top 1 * from [table_Manager] where AdminName='"&Trim(AdminName)&"' order by AdminId desc",conn,1,3
'if Not oRs.Eof then

'Else
oRs.Addnew
oRs("AdminName")=Trim(AdminName)
oRs("AdminPass")=Md5(Trim(AdminPass))
oRs.Update
'End if
oRs.close
set oRs=Nothing

Case "mod"
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top 1 * from [table_Manager] where AdminName='"&Trim(AdminName)&"' and AdminId="&Trim(AdminId)&" order by AdminId desc",conn,1,3
'if Not oRs.Eof then

'Else
'oRs.Addnew
'oRs("AdminName")=Trim(AdminName)
oRs("AdminPass")=Md5(Trim(AdminPass))
oRs.Update
'End if
oRs.close
set oRs=Nothing

Case "del"

conn.execute "delete from [table_Manager] where AdminId="&Trim(AdminId)
end select

%>
[
<%'读取数据库  
set rs=server.createobject("adodb.recordset")
sql="select * from [Table_Manager]  order by adminId desc"
rs.open sql,conn,3,3
do while not rs.eof%> 
<%if i>0 then %>,<%end if%> 
{"AdminId":"<%=Rs("AdminId")%>","AdminName":"<%=Rs("AdminName")%>","AdminDateTime":"<%=ForMatDateTime(Rs("DateTime"),2)%>"}
                     <%
rs.movenext
	i=i+1
    loop
rs.close
set rs=nothing
%>] 



