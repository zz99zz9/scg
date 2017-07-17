<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%

	  name=request("name")
	  title=request("title")
      keywords=request("keywords")
      description=request("description")
	  oid=request("oid")
	  action=trim(request("action"))
id=request("id")

select case action

Case "add"
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [tdk] ",conn,1,3

oRs.Addnew
oRs("name")=Trim(name)
oRs("t")=Trim(title)
oRs("k")=trim(keywords)
oRs("d")=trim(description)
oRs("oid")=Trim(oid)
ors("uptime")=now()

oRs.Update

oRs.close
set oRs=Nothing
response.write ("add")

Case "mod"

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [tdk] where id="&id,conn,1,3
oRs("name")=Trim(name)
oRs("t")=Trim(title)
oRs("k")=trim(keywords)
oRs("d")=trim(description)
oRs("oid")=Trim(oid)
ors("uptime")=now()

oRs.Update

oRs.close
set oRs=Nothing
response.write ("mod")
Case "del"
conn.execute "delete from [tdk] where Id="&Trim(id)
response.write ("del")
end select
%>