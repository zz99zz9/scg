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
	  action=trim(request("action"))
	  pro_id=request("pro_id")
	  if BigClassId="" then BigClassId=0
		if SmallClassId="" then SmallClassId=0
		if pro_id="" then pro_id=0
		if Orderid="" then Orderid=0


%>
{"大类名称":"<%=BigClassName%>","大类Id":"<%=BigClassId%>","小类名称":"<%=SmallClassName%>","小类Id":"<%=SmallClassId%>","产品编号":"<%=Product_Id%>","标题":"<%=Title%>","图片路径":"<%=DefaultPicUrl%>","内容":"<%=content%>","排序id":"<%=Orderid%>","是否审核":"<%=Passed%>","是否推荐":"<%=Elite%>","当前操作":"<%=action%>","系统ID":"<%=pro_id%>"}