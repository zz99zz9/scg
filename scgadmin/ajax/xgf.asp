<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->

<%
'类修改
tit=request("tit")
txt=request("txt")
Action=request("Action")
id=request("id")
oid=request("oid")
fid=request("fid")
jg=request("jg")
file=request("file")
table=request("table")
 select case Action
  case "list"

  case "add"
  conn.execute"INSERT INTO ["&table&"] (tit,txt,oid,fid,file,uptime,jg) VALUES ('"&tit&"','"&txt&"','"&oid&"','"&fid&"','"&file&"','"&now()&"','"&jg&"')"

  case "mod"
  conn.execute"update ["&table&"] set tit='"&tit&"',txt='"&txt&"',oid="&oid&",uptime='"&now()&"',file='"&file&"',jg='"&jg&"' where id="&id&""

  case "del"
  '可加判断是否删除
  conn.execute "delete from ["&Table&"] where id="&Trim(id)

  case else

 end select
%>
<%'-------------------------------------------

'             输出大类及小类的Json对象

'--------------------------------------------%>
[<%
set rs=server.createobject("adodb.recordset")'
sql="select * from ["&table&"] where fid="&fid&" order by oid desc"
'response.write sql
rs.open sql,conn,3,3
do while not rs.eof%><%if i>0 then %>,<%end if%>{"id":"<%=Rs("id")%>","fid":"<%=Rs("fid")%>","tit":"<%=trim(Rs("tit"))%>","jg":"<%=Rs("jg")%>","txt":"<%=replace(replace(replace(Rs("txt"),chr(34),"") ,CHR(13),""),chr(10),"")%>","oid":"<%=Rs("oid")%>","file":"<%=Rs("file")%>"}<%
rs.movenext
	i=i+1
    loop
	i=0
rs.close
set rs=nothing
%>]
