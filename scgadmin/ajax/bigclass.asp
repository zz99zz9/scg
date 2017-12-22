<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%
'大类修改
BCName=request("BCName")
Action=request("Action")
BCID=request("BCId")
OID=request("OID")

 select case Action
  case "list"
  
  case "add"
  conn.execute"INSERT INTO [Table_ProBigClass] (BigClassName,OrderId) VALUES ('"&BCName&"','"&OID&"')"
  case "mod"
  conn.execute"update [Table_ProBigClass] set BigClassName='"&BCName&"',OrderId='"&OID&"' where BigClassId="&BCID&""
  conn.execute"update [Table_ProSmallClass] set BigClassName='"&BCName&"' where BigClassId="&BCID&""
  case "del"
  '可加判断是否删除
  conn.execute "delete from [Table_ProBigClass] where BigClassId="&Trim(BCID)  
  conn.execute "delete from [Table_ProSmallClass] where BigClassId="&Trim(BCID)
  conn.execute "delete from [Table_Product] where BigClassId="&Trim(BCID)
  case else
  
 end select
%>
<%'小类修改
SAction=request("SAction")
SOID=request("SOID")
SCName=request("SCName")
SCID=request("SCID")
 select case SAction
  case "list"
  
  case "add"
  conn.execute"INSERT INTO [Table_ProSmallClass] (BigClassName,BigClassId,SmallClassName,OrderId) VALUES ('"&BCName&"','"&BCID&"','"&SCName&"','"&SOID&"')"
  case "mod"
  conn.execute"update [Table_ProSmallClass] set BigClassName='"&BCName&"',BigClassId='"&BCID&"',SmallClassName='"&SCName&"',OrderId='"&SOID&"' where SmallClassId="&SCID&""
  case "del"
  '可加判断是否删除
  conn.execute "delete from [Table_ProSmallClass] where SmallClassId="&Trim(SCID)
  conn.execute "delete from [Table_Product] where SmallClassId="&Trim(SCID)
  case else
  
 end select
%>
<%'-------------------------------------------

'             输出大类及小类的Json对象

'--------------------------------------------%>
[<%  
set rs=server.createobject("adodb.recordset")
sql="select * from [Table_ProBigClass] order by orderid desc"
rs.open sql,conn,3,3
do while not rs.eof%><%if i>0 then %>,<%end if%>{"BCID":"<%=Rs("BigClassID")%>","BCName":"<%=Rs("BigClassName")%>","OId":"<%=Rs("Orderid")%>","s":[<%set srs=server.createobject("adodb.recordset")
ssql="select * from [Table_ProSmallClass] where BigClassID="&Rs("BigClassID")&" order by orderid desc"
srs.open ssql,conn,3,3
do while not srs.eof%><%if si>0 then %>,<%end if%>{"SCID":"<%=srs("SmallClassID")%>","SCName":"<%=srs("SmallClassName")%>","OId":"<%=srs("OrderId")%>"}<%srs.movenext
	si=si+1
    loop
	si=0
    srs.close
set srs=nothing%>]}<%
rs.movenext
	i=i+1
    loop
	i=0
rs.close
set rs=nothing
%>] 