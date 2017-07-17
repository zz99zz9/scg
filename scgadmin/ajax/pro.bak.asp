<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%
BigClassName=request("BigClassName")
	  BigClassId=request("BigClassId")
	  SmallClassName=request("SmallClassName")
	  SmallClassId=request("SmallClassId")
	  Product_Id=request("Product_Id")
	  Title=request("Title")
	  DefaultPicUrl=request("DefaultPicUrl")
      content=request("content")
	  Orderid=request("Orderid")
      Passed=request("Passed")
	  Elite=request("Elite")
	  action=request("action")
	  pro_id=request("pro_id")
console.log(BigClassName);
console.log(BigClassId);
console.log(SmallClassName);
console.log(SmallClassId);
console.log(Product_Id);
console.log(Title);
console.log(DefaultPicUrl);
console.log(content);
console.log(Orderid);
console.log(Passed);
console.log(Elite);
console.log(action);
console.log(pro_id);
select case action

Case "add"
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] ",conn,1,3

oRs.Addnew
oRs("BigClassName")=Trim(BigClassName)
oRs("BigClassId")=Trim(BigClassId)
oRs("SmallClassName")=Trim(SmallClassName)
oRs("SmallClassId")=Trim(SmallClassId)
oRs("Product_Id")=Trim(Product_Id)
oRs("Title")=Trim(Title)
oRs("DefaultPicUrl")=Trim(DefaultPicUrl)
oRs("content")=Trim(content)
oRs("Orderid")=Trim(Orderid)
oRs("Passed")=Trim(Passed)
oRs("Elite")=Trim(Elite)
oRs.Update

oRs.close
set oRs=Nothing
response.write ("add")

Case "mod"

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where AiticleId="&Trim(pro_id),conn,1,3


oRs("BigClassName")=Trim(BigClassName)
oRs("BigClassId")=Trim(BigClassId)
oRs("SmallClassName")=Trim(SmallClassName)
oRs("SmallClassId")=Trim(SmallClassId)
oRs("Product_Id")=Trim(Product_Id)
oRs("Title")=Trim(Title)
oRs("DefaultPicUrl")=Trim(DefaultPicUrl)
oRs("content")=Trim(content)
oRs("Orderid")=Trim(Orderid)
oRs("Passed")=Trim(Passed)
oRs("Elite")=Trim(Elite)
oRs.Update

oRs.close
set oRs=Nothing
response.write ("mod")
Case "del"
conn.execute "delete from [Table_Product] where ArticleId="&Trim(pro_id)
response.write ("del")
end select
%>