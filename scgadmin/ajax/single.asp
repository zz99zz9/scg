<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%content=request("content")
gsjsid=request("gsjsid")
type_wj=request("type_wj")
conn.execute"update gsjs set gsjstext='"&content&"',type_wj='"&type_wj&"' where gsjsid="&gsjsid&""%>ok