<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%dim proid,oid,picid
proid=request("proid")
oid=request("oid")
picid=request("picid")
'修改排序

'删除图片

'刷新列表



%>
<%'-------------------------------------------

'             输出大类及小类的Json对象

'--------------------------------------------%>
[<%  
set rs=server.createobject("adodb.recordset")
sql="select * from [Table_pic] where pro_id="&proid&" order by oid desc,id desc"
rs.open sql,conn,3,3
do while not rs.eof%><%if i>0 then %>,<%end if%>{"picid":"<%=Rs("id")%>","proid":"<%=Rs("pro_id")%>","oid":"<%=Rs("oid")%>","picurl":"<%=Rs("pic_url")%>"}<%
rs.movenext
	i=i+1
    loop
	i=0
rs.close
set rs=nothing
%>] 