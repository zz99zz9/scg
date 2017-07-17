<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->

<%
'类修改
tit=request("tit")
stit=request("stit")
stxt=request("stxt")
Action=request("Action")
id=request("id")
oid=request("oid")
wid=request("wid")
url=request("url")
file=request("file")

 select case Action
  case "list"

  case "add"
  conn.execute"INSERT INTO [links] (tit,stit,stxt,oid,wid,file,uptime,url) VALUES ('"&tit&"','"&stit&"','"&stxt&"','"&oid&"','"&wid&"','"&file&"','"&now()&"','"&url&"')"

  case "mod"
  conn.execute"update [links] set tit='"&tit&"',stit='"&stit&"',stxt='"&stxt&"',oid="&oid&",uptime='"&now()&"',file='"&file&"',url='"&url&"' where id="&id&""

  case "del"
  '可加判断是否删除
  conn.execute "delete from [links] where id="&Trim(id)

  case else

 end select
%>
<%'-------------------------------------------

'             输出大类及小类的Json对象

'--------------------------------------------%>
[<%
set rs=server.createobject("adodb.recordset")'
sql="select * from [links] where wid="&wid&" order by oid desc"
'response.write sql
rs.open sql,conn,3,3
do while not rs.eof%><%if i>0 then %>,<%end if%>{"id":"<%=Rs("id")%>","wid":"<%=Rs("wid")%>","tit":"<%=Rs("tit")%>","stit":"<%=Rs("stit")%>","stxt":"<%=Rs("stxt")%>","url":"<%=Rs("url")%>","file":"<%=Rs("file")%>","oid":"<%=Rs("oid")%>"}<%
rs.movenext
	i=i+1
    loop
	i=0
rs.close
set rs=nothing
%>]
