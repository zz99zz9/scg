
<%
'###########################显示分类名称#################################################
Function sHowJmlpKinds()  
set smalloRs=Server.CreateObject("ADODB.Recordset")
smalloRs.Open "select * from [Table_ProSmallclass] where BigclassId=9 order by smallclassId desc",conn,1,1
Content = Content & "<Table width='98%' border='0' align='center' cellpadding='0' cellspacing='0'>"
for j=1 to smalloRs.Recordcount
if Not smalloRs.Eof then 
  Content = Content & "<Tr class='JmlcUrl'>"
    Content = Content & "<Td  height='25' class='Td5'><a Href='Jmlp.Asp?BigclassId=9&smallclassId="&smalloRs("smallclassId")&"'>"&smalloRs("smallclassName")&"</a></td>"	
  Content = Content & "</tr>"	
  smalloRs.MoveNext
  End if
  Next  
Content = Content & "</Table>"	
sHowJmlpKinds = Content
End Function
'###########################显示分类名称#################################################
Function sHowKindssy(BigclassId)
set BigoRs=Server.CreateObject("ADODB.Recordset")
BigoRs.Open "select * from [Table_ProBigClass]  order by Orderid",conn,1,1

    Content = "<ul>"
i=1
do while not BigoRs.eof  
if int(BigoRs("BigclassId"))=int(BigclassId) then
	showthis=" class='current'"
	else
	showthis=""
	end if
    Content = Content & "<li"&showthis&"><a Href='class.Asp?BigclassId="&BigoRs("BigclassId")&"' class='qsbg'><em></em>"&BigoRs("BigclassName")&"</a></li>"
 	    
BigoRs.MoveNext
i=i+1
Loop  
    Content = Content & "</ul>"
BigoRs.close
set BigoRs=Nothing
sHowKindssy = Content
End Function

sub checkProdcount(BigclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub
sub checkProdcount2(BigclassId,smallclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" and smallclassId="&smallclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub

sub sHowProKinds(BigclassId,countt,ByteCount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top "&countt&" * from [Table_SmallClass] where BigclassId="&BigclassId&" order by id asc",conn,1,1
Content = Content & "<table  border='0' align='center' cellpadding='0' cellspacing='0' width='98%;'>"
i=1
do while Not oRs.Eof and i<countt 
  Content = Content & "<tr>"
    Content = Content & "<td height='25' align='left' valign='middle' class='Td4'><img src='Images/button_004.gif' border='0' align='absmiddle'> "
	Content = Content & "<a Href='Product.Asp?smallclassId="&oRs("Id")&"'>"&GotToPic(oRs("smallclassName"),ByteCount)&"</a>"
	Content = Content & "</td>"		
  Content = Content & "</tr>" 
oRs.MoveNext
i=i+1
loop   
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub
'###########################显示分类名称#################################################
Function sHowKinds()
set BigoRs=Server.CreateObject("ADODB.Recordset")
BigoRs.Open "select * from [Table_ProBigClass] order by Orderid",conn,1,1
Content = Content & "<Table width='99%' border='0' align='center' cellpadding='0' cellspacing='0'>"
i=1
do while not BigoRs.eof  
  Content = Content & "<Tr>"
    
    Content = Content & "<Td  height='25' align='left'><img src='Images/Buttom_Zk.jpg' width='40' height='18' align='absmiddle' name='img10"&i&"000'    id=item$pval[catID]) style='cursor: hand;margin:0 5 2 6;' onmouseup='opencat(cat10"&i&"000,&#13;&#10; img10"&i&"000);' language=javascript /> <a Href='Product.Asp?BigclassId="&BigoRs("BigclassId")&"'><b>"&BigoRs("BigclassName")&"</b></a> </td>"
 	
  Content = Content & "</tr>"
  Content = Content & "<Tr id=cat10"&i&"000 style='display:none;'>"  
    Content = Content & "<Td align='left' valign='middle' style='Padding-left:2px;' >"  
set smalloRs=Server.CreateObject("ADODB.Recordset")
smalloRs.Open "select * from [Table_ProSmallclass] where BigclassId="&BigoRs("BigclassId")&" order by smallclassId desc",conn,1,1
Content = Content & "<Table width='90%' border='0' align='center' cellpadding='0' cellspacing='0'>"
for j=1 to smalloRs.Recordcount
if Not smalloRs.Eof then 
  Content = Content & "<Tr>"
  	for jii=1 to 1
	if Not smalloRs.Eof then 
	Content = Content & "<Td  height='25' width='50%' class='Td5' ><img src='Images/L-.gif' width='12' height='12' valign='absmiddle' style='margin-right:5px;'/><a Href='Product.Asp?BigclassId="&BigoRs("BigclassId")&"&smallclassId="&smalloRs("smallclassId")&"'>"&smalloRs("smallclassName")&"</a></td>"	
	smalloRs.MoveNext
  	End if
    Next  
  Content = Content & "</tr>"	
  End if
  Next  
Content = Content & "</Table>"	
smalloRs.close
set smalloRs=Nothing
	Content = Content & "</td>"
  Content = Content & "</tr>"
BigoRs.MoveNext
i=i+1
Loop  
Content = Content & "</table>"
BigoRs.close
set BigoRs=Nothing
sHowKinds = Content
End Function

sub checkProdcount(BigclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub
sub checkProdcount2(BigclassId,smallclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" and smallclassId="&smallclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub

sub sHowProKinds(BigclassId,countt,ByteCount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top "&countt&" * from [Table_SmallClass] where BigclassId="&BigclassId&" order by id asc",conn,1,1
Content = Content & "<table  border='0' align='center' cellpadding='0' cellspacing='0' width='98%;'>"
i=1
do while Not oRs.Eof and i<countt 
  Content = Content & "<tr>"
    Content = Content & "<td height='25' align='left' valign='middle' class='Td4'><img src='Images/button_004.gif' border='0' align='absmiddle'> "
	Content = Content & "<a Href='Product.Asp?smallclassId="&oRs("Id")&"'>"&GotToPic(oRs("smallclassName"),ByteCount)&"</a>"
	Content = Content & "</td>"		
  Content = Content & "</tr>" 
oRs.MoveNext
i=i+1
loop   
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub
'###########################显示分类名称#################################################
Function sHowKinds2()
set BigoRs=Server.CreateObject("ADODB.Recordset")
BigoRs.Open "select * from [Table_ProBigClass]  order by BigClassID asc",conn,1,1
Content = Content & "<Table width='99%' border='0' align='center' cellpadding='0' cellspacing='0'>"
i=1
do while not BigoRs.eof  
  Content = Content & "<Tr>"
    
    Content = Content & "<Td  height='25' align='left'><img src='Images/Buttom_Zk.jpg' width='40' height='18' align='absmiddle' name='img10"&i&"000'    id=item$pval[catID]) style='cursor: hand;margin:0 5 2 6;' onmouseup='opencat(cat10"&i&"000,&#13;&#10; img10"&i&"000);' language=javascript /> <a Href='Product.Asp?BigclassId="&BigoRs("BigclassId")&"'><b>"&BigoRs("BigclassName")&"</b></a> </td>"
 	
  Content = Content & "</tr>"
  Content = Content & "<Tr id=cat10"&i&"000 >"  
    Content = Content & "<Td align='left' valign='middle' style='Padding-left:2px;' >"  
set smalloRs=Server.CreateObject("ADODB.Recordset")
smalloRs.Open "select * from [Table_ProSmallclass] where BigclassId="&BigoRs("BigclassId")&" order by smallclassId desc",conn,1,1
Content = Content & "<Table width='90%' border='0' align='center' cellpadding='0' cellspacing='0'>"
for j=1 to smalloRs.Recordcount
if Not smalloRs.Eof then 
  Content = Content & "<Tr>"
  	for jii=1 to 1
	if Not smalloRs.Eof then 
	Content = Content & "<Td  height='25' width='50%' class='Td5' ><img src='Images/L-.gif' width='12' height='12' valign='absmiddle' style='margin-right:5px;'/><a Href='Product.Asp?BigclassId="&BigoRs("BigclassId")&"&smallclassId="&smalloRs("smallclassId")&"'>"&smalloRs("smallclassName")&"</a></td>"	
	smalloRs.MoveNext
  	End if
    Next  
  Content = Content & "</tr>"	
  End if
  Next  
Content = Content & "</Table>"	
smalloRs.close
set smalloRs=Nothing
	Content = Content & "</td>"
  Content = Content & "</tr>"
BigoRs.MoveNext
i=i+1
Loop  
Content = Content & "</table>"
BigoRs.close
set BigoRs=Nothing
sHowKinds2 = Content
End Function

sub checkProdcount(BigclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub
sub checkProdcount2(BigclassId,smallclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" and smallclassId="&smallclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub

sub sHowProKinds(BigclassId,countt,ByteCount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top "&countt&" * from [Table_SmallClass] where BigclassId="&BigclassId&" order by id asc",conn,1,1
Content = Content & "<table  border='0' align='center' cellpadding='0' cellspacing='0' width='98%;'>"
i=1
do while Not oRs.Eof and i<countt 
  Content = Content & "<tr>"
    Content = Content & "<td height='25' align='left' valign='middle' class='Td4'><img src='Images/button_004.gif' border='0' align='absmiddle'> "
	Content = Content & "<a Href='Product.Asp?smallclassId="&oRs("Id")&"'>"&GotToPic(oRs("smallclassName"),ByteCount)&"</a>"
	Content = Content & "</td>"		
  Content = Content & "</tr>" 
oRs.MoveNext
i=i+1
loop   
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub
'------------------------显示户型信息---------------------------
sub sHowProPic_1(countt,bytecountt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top "&countt&" articleid,Product_Id,Title,DefaultPicUrl,BigclassId,BigclassName,smallclassName,passed from [Table_Product] where passed=true  order by articleId desc",conn,1,1
Content = Content & "<table  border='0' align='center' cellpadding='0' cellspacing='0'>"
j=0
do while Not oRs.Eof and j<countt 
  Content = Content & "<tr>"
    Content = Content & "<td height='130' width='170' align='center' valign='middle' class='td3' bgcolor='#FFFFFF'>"	
	Content = Content & "<a Href='ViewPro.asp?id="&oRs("articleId")&"' ><img src='"&oRs("DefaultPicUrl")&"' width='160' height='120' border='0' alt='"&oRs("Title")&"'  /></a>"
  Content = Content & "</td>"   
  Content = Content & "</tr>" 
  
  Content = Content & "<tr>"
  Content = Content & "<td height='25' width='170' align='center' valign='middle' class='Menu_01'>" 
  Content = Content & "<a Href='ViewPro.asp?id="&oRs("articleId")&"' target='_blank'>"&GotToPic(oRs("Title"),bytecountt)&"</a><br>"	  
  Content = Content & "</td>"
	Content = Content & "</tr>"	
	Content = Content & "</td>"	
oRs.MoveNext
j=j+1
loop 
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub



'--------------------新闻资讯---------------------
sub sHowcjzjd(ProType,countt,bytecount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top "&countt&" Prod_Id,Prod_Name,Kid_Name,Prod_Date from [Prod] where Kid_Name='"&ProType&"' order by Prod_id desc",conn,1,1
Content =Content & "<Table width='345'  border='0' align='center' cellpadding='0' cellspacing='0'>"
i=0
do while Not oRs.Eof and i<countt 
  Content =Content & "<Tr align='left' valign='middle'>"
  Content =Content & "<td  height='25' width='20' class='Td5'><img src='Images/button_001.gif' border='0'></td>"
  Content =Content & "<td  height='25' align='left' class='Td5'><a Href='ViewCjzjd.Asp?id="&oRs("Prod_Id")&"' Target='_blank' title='"&oRs("Prod_Name")&"'>"&GotToPic(oRs("Prod_Name"),bytecount)&"</a></td>"  
Content =Content & "<td height='25' width='80' class='Td5'>"&ForMatDateTime(oRs("Prod_Date"),2)&"</td>"
  Content =Content & "</tr>"
  i=i+1 
  oRs.Movenext
  Loop
Content =Content & "</table>"
oRs.close
set oRs=Nothing
Response.write Content
End sub


'----------------------------显示公司相关信息-----------------------
Sub sHowInfo(typee)
set oRs=Server.CreateObject("ADODB.Recordset")
sql="select * from [GsJs] where gsjsid="&typee
oRs.Open sql,conn,1,1
If Not oRs.eof Then
Content=Content & oRs("GsjsText")

Else
Content="<span style='color:#FFFFFF;background-color:#E53333;'>需提供内容</span> "
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub

'----------------------------显示公司相关英文信息-----------------------
Sub sHowInfoen(typee)
set oRs=Server.CreateObject("ADODB.Recordset")
sql="select * from [GsJs] where Type_wjen='"&typee&"' order by GsjsId desc"
oRs.Open sql,conn,1,1
If Not oRs.eof Then
Content=Content & oRs("GsjsTexten")

Else
Content=Content & sql & "<span style='color:#FFFFFF;background-color:#E53333;'>nothing</span> "
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub
'-------------------显示上一条下一条活动资讯-----------------------------
sub sHowDxNewsPN(NewsType,Newsid)
Content =Content & "<span class='p'>上一篇："
set PoRs=Server.CreateObject("ADODB.Recordset")
posql="select Top 1 * from [prod] where classid="&NewsType&" and prod_id>"&NewsId&" order by prod_id asc"

PoRs.Open posql,conn,1,1
  if Not PoRs.eof then 
  Content =Content & "<a Href='?id="&PoRs("prod_id")&"' title='"&PoRs("prod_name")&"'>"&left(PoRs("prod_name"),17)&"</a>"
  Else
  Content =Content & "没有了!"
  End if

  PoRs.close
  set PoRs=Nothing
  
Content =Content & "</span><span class='n'>下一篇："


set NoRs=Server.CreateObject("ADODB.Recordset")
NoRs.Open "select Top 1 * from [prod] where classid="&NewsType&" and prod_id<"&NewsId&" order by prod_id desc",conn,1,1
  if Not NoRs.eof then 

  Content =Content & "<a Href='?id="&NoRs("prod_id")&"' title='"&NoRs("prod_name")&"'>"&left(NoRs("prod_name"),17)&"</a>"
  Else
  Content =Content & "没有了!"
  End if
Content =Content & "</span>"
  NoRs.close
  set NoRs=Nothing  

Response.write Content
End sub
'----------------------------显示公司相关信息-----------------------
Sub sHowInfo_1(typee,countt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [GsJs] where Type_wj='"&typee&"' order by GsjsId desc",conn,1,1
If Not oRs.eof Then
'Content=Content & LEft(RemoveHTML(oRs("GsjsText")),countt) & "……"
Else
Content=Content & "<span style='color:#FFFFFF;background-color:#E53333;'>需提供内容</span>"
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub

'-------------------------------过滤html方法二---------------------------------

Function RemoveHTML(strHTML)
Dim objRegExp, Match, Matches
Set objRegExp = New Regexp
objRegExp.IgnoreCase = True
objRegExp.Global = True
'取闭合的<>
objRegExp.Pattern = "<.+?>"

'进行匹配
Set Matches = objRegExp.Execute(strHTML)
' 遍历匹配集合，并替换掉匹配的项目
For Each Match in Matches
strHtml=Replace(strHTML,Match.Value,"")
strHtml=Replace(strHTML,"&nbsp;","")
Next
RemoveHTML=strHTML
Set objRegExp = Nothing
End Function

'------------------------------显示大类名称--------------------------------
Sub ShowBCName(countt)
safeRequest(countt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_ProBigClass] where Bigclassid="&countt&" order by orderid",conn,1,1
If Not oRs.eof Then
Content=Content & oRs("Bigclassname")
Else
Content=Content & "无效类别"
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub
'------------------------------显示td名称--------------------------------
Sub Showtd(countt)
safeRequest(countt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [class_td] where cid="&countt&" order by oid",conn,1,1
If Not oRs.eof Then
Content=Content & oRs("cname")
Else
Content=Content & "无效类别"
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub
'-----------------------房源搜索条件---------------------------
  sub seaurl(bc,sc,fj,lx,lb,order,page)
  '国家，城市，片区，类型，类别，排序，翻页
  response.write("bc="&bc&"&sc="&sc&"&fj="&fj&"&lx="&lx&"&lb="&lb&"&order="&order&"&page="&page)
  end sub
  
'----------------------两数字对比----------------------------
sub ison(v1,v2)
safeRequest(v1)
safeRequest(v2)
if int(v1)=int(v2) then
response.write("class='on'")
end if
end sub
'----------------------两数字对比----------------------------
sub isselected(v1,v2)
safeRequest(v1)
safeRequest(v2)
if int(v1)=int(v2) then
response.write("selected='selected'")
end if
end sub
'-------------------------类别id转名称---------------------------
       'table表名、countt提供的id、idname表id字段名、tit表name字段名
       sub showName(table,countt,idname,tit)
       safeRequest(countt)
       set oRs=Server.CreateObject("ADODB.Recordset")
       osql="select * from ["&table&"] where "&idname&"="&countt
 '      response.write osql+table
       oRs.Open osql,conn,1,1
       If Not oRs.eof Then
       Content=Content & oRs(tit)
       Else
       Content=Content & "无效类别"
       End if
       oRs.close
       set oRs=Nothing
       Response.write Content
       end sub
'-------------------------类别id转名称---------------------------
'table表名、countt提供的id、idname表id字段名、tit表name字段名
function showNamef(table,countt,idname,tit)
safeRequest(countt)
set oRs=Server.CreateObject("ADODB.Recordset")
osql="select * from ["&table&"] where "&idname&"="&countt
'response.write osql+table
oRs.Open osql,conn,1,1
If Not oRs.eof Then
Content=Content & oRs(tit)
Else
Content=""
End if
oRs.close
set oRs=Nothing
showNamef=Content
end function
'--------------------------项目id调取国家、城市、项目名称--------------
sub showpictit(v)
safeRequest(v)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where ArticleId="&v,conn,1,1
If Not oRs.eof Then
gjname=ors("BigClassName")
csname=ors("SmallClassName")
xmname=ors("Title")
enname=ors("enTitle")
Else

End if
oRs.close
set oRs=Nothing
response.write (xmname&" [ "&enname&" ]")
end sub
'------------------显示当前项目图片数-------------------------------------
sub picN(v)
safeRequest(v)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select count(*) as contt from [Table_Pic] where pro_Id="&v,conn,1,1

contt=oRs("contt")
oRs.close
set oRs=Nothing
response.write(contt)

end sub
'------------------开发商ID转图片-------------------------------------
sub kfsid2url(v)
safeRequest(v)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [class_kfs] where CId="&v,conn,1,1
contt=oRs("Cfile")
oRs.close
set oRs=Nothing
response.write(contt)
end sub
%>


