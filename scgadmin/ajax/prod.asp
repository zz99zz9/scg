<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%
	  classid=request("classid")
	  BigClassName=request("BigClassName")
	  BigClassId=request("BigClassId")
	  SmallClassName=request("SmallClassName")
	  SmallClassId=request("SmallClassId")
	  prod_name=request("prodname")
	  prod_pic=request("DefaultPicUrl")
      prod_detail=request("content")
      prod_detailen=request("content1")
	  picalt=request("picalt")
	  oid=request("oid")
	  ioid=request("ioid")
	  url=request("url")
	    tips=request("tips")
	  Descriptio=request("Description")
	uptime=trim(request("uptime"))
	title2=request("title")
	  Keywords=request("Keywords")
      Passed=request("Passed")
	  Elite=request("Elite")
	  action=trim(request("action"))
	  pid=request("pid")
	  clb=request("clb")
	  tips=request("tips")
		if classid="" then classid=0
		if pid="" then pid=0
		if Oid="" then Oid=0
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [class_prod] where cid="&classid,conn,1,1
If Not oRs.eof Then
classname=ors("CName")
End if
oRs.close
set oRs=Nothing
		
select case action

Case "add"
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [prod] ",conn,1,3

oRs.Addnew
oRs("BigClass")=Trim(BigClassName)
oRs("BigClassId")=Trim(BigClassId)
oRs("SmallClass")=Trim(SmallClassName)
oRs("SmallClassId")=Trim(SmallClassId)
oRs("Keywords")=trim(Keywords)
oRs("Description")=trim(Descriptio) 
oRs("prod_name")=Trim(prod_name)
oRs("prod_pic")=Trim(prod_pic)
oRs("prod_detail")=Trim(prod_detail)
oRs("prod_detailen")=Trim(prod_detailen)
oRs("oid")=Trim(oid)
oRs("clbid")=Trim(clb)
oRs("ioid")=Trim(ioid)
oRs("url")=Trim(url)
oRs("tips")=Trim(tips)
oRs("prod_date")=Trim(uptime)
oRs("picalt")=Trim(picalt)
oRs("tips")=Trim(tips)
oRs("classid")=Trim(classid)
oRs("classname")=Trim(classname)
oRs("Passed")=Trim(Passed)
oRs("Elite")=Trim(Elite)
oRs("title2")=Trim(title2)
oRs.Update

oRs.close
set oRs=Nothing
response.write ("add")

Case "mod"

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [prod] where prod_id="&pid,conn,1,3
oRs("BigClass")=Trim(BigClassName)

oRs("SmallClass")=Trim(SmallClassName)
oRs("bigclassId")=Trim(BigClassId)
oRs("SmallClassId")=Trim(SmallClassId)
oRs("Keywords")=trim(Keywords)
oRs("Description")=trim(Descriptio) 
oRs("prod_name")=Trim(prod_name)
oRs("prod_pic")=Trim(prod_pic)
oRs("prod_detail")=Trim(prod_detail)
oRs("prod_detailen")=Trim(prod_detailen)
oRs("oid")=Trim(oid)
oRs("clbid")=Trim(clb)
oRs("ioid")=Trim(ioid)
oRs("url")=Trim(url)
oRs("tips")=Trim(tips)
oRs("prod_date")=Trim(uptime)
oRs("picalt")=Trim(picalt)
oRs("classid")=Trim(classid)
oRs("classname")=Trim(classname)
oRs("Passed")=Trim(Passed)
oRs("title2")=Trim(title2)
oRs("Elite")=Trim(Elite)

oRs.Update

oRs.close
set oRs=Nothing
response.write ("mod")
Case "del"
conn.execute "delete from [prod] where prod_Id="&Trim(pid)
response.write ("del")
end select
%>