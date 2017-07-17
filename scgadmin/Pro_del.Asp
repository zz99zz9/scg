
<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start -->

<%
dim rs
dim sql
dim count

set rs=server.createobject("adodb.recordset")
sql = "select * from [Table_ProSmallclass] order by SmallClassID asc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>;<%= trim(rs("SmallClassId"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid.split(";")[0];
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }  
	
	</script>

 
                          <!----> 
              <div class="row ">
                  <div class="col-lg-12">
                      <section class="panel pb50">
                          <header class="panel-heading mb50">
                              产品修改
                          </header>
                          <%
Dim ArticleID
ArticleID=Trim(Request.QueryString("ArticleID"))

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where ArticleID="&ArticleID,conn,1,3
if oRs.Eof then
'无数据
End if
%>
                      <form name="myform" id="myform">    
                            <div class="form-group row">
    <label for="SiteName" class="col-sm-2 control-label text-right xglab">所属分类</label>
    <div class="col-sm-10 row">
    <div class="col-sm-3">
      <%
sql = "select * from [Table_ProBigClass] order by orderid"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "请先添加栏目。"
else
%>
<select name="BigClassName" id="BigClass" class="form-control" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">

<%
dim selclass
	selclass=ors("BigClassName")

	do while not rs.eof
%>
            <option value="<%=trim(rs("BigClassName"))%>;<%=trim(rs("BigClassId"))%>" <%if trim(ors("BigClassId"))=trim(rs("BigClassId")) then%>selected<%end if%>><%=trim(rs("BigClassName"))%></option>
            <%
			rs.movenext
		loop
end if
	rs.close
%>
        </select></div><div class="col-sm-3">
          <select name="SmallClassName" id="SmallClass" class="form-control">
            <option value="" >不指定小类</option>
            <%
sql="select * from [Table_ProSmallclass] where BigClassName='" & selclass & "' order by orderid"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then


do while not rs.eof
%>
            <option value="<%=rs("SmallClassName")%>;<%=rs("SmallClassId")%>" <%if ors("SmallClassId")=rs("SmallClassId") then%>selected<%end if%> ><%=rs("SmallClassName")%></option>
            <%
rs.movenext
loop
end if
rs.close

%>
      </select>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="Product_Id" class="col-sm-2 control-label text-right xglab">产品编号</label>
    <div class="col-sm-7">
      <input type="text" name="Product_Id" class="form-control" id="Product_Id" value="<%=ors("Product_Id")%>" >
    </div>
  </div>
  <div class="form-group row">
    <label for="Title" class="col-sm-2 control-label text-right xglab">产品名称</label>
    <div class="col-sm-7">
      <input type="text" name="Title" class="form-control" id="Title" value="<%=ors("Title")%>" placeholder="请输入产品名称" required>
    </div>
  </div>
      <div class="form-group row">
    <label for="DefaultPicUrl" class="col-sm-2 control-label text-right xglab">产品图片</label>
    <div class="col-sm-7 row">
      <div class="col-sm-7"><input name="DefaultPicUrl" type="text" id="DefaultPicUrl" class="form-control col-sm-6" value="<%=ors("DefaultPicUrl")%>"></div>
        <div class="col-sm-3"><input type="button" name="Submit12" value="上传图片" class="form-control col-sm-2" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></div>
    </div>
  </div>
<div class="form-group row">
    <label for="content" class="col-sm-2 control-label text-right xglab">产品说明</label>
    <div class="col-sm-7 ">                          
<!--列表开始-->
<%
Dim htmlData

htmlData =ors("content")

Function htmlspecialchars(str)
	str = Replace(str, "&", "&amp;")
	str = Replace(str, "<", "&lt;")
	str = Replace(str, ">", "&gt;")
	str = Replace(str, """", "&quot;")
	htmlspecialchars = str
End Function
%>
	  	<link rel="stylesheet" href="kindeditor-4.1.7/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor-4.1.7/plugins/code/prettify.css" />
	<script src="kindeditor-4.1.7/kindeditor.js"></script>
	<script src="kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script src="kindeditor-4.1.7/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : 'kindeditor-4.1.7/plugins/code/prettify.css',
				uploadJson : 'kindeditor-4.1.7/asp/upload_json.asp',
				fileManagerJson : 'kindeditor-4.1.7/asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				},afterBlur: function(){this.sync();}
			});
			prettyPrint();
		});
	</script>


<textarea name="content" id="content" style="width:100%;height:450px;visibility:hidden;" class="form-control"><%=htmlspecialchars(htmlData)%></textarea>

    </div>
  </div>
    <div class="form-group row">
    <label for="Orderid" class="col-sm-2 control-label text-right xglab">排序ID</label>
    <div class="col-sm-6 row">
    <div class="col-sm-2">
      <input type="text" name="Orderid" class="form-control" id="Orderid" value="<%=ors("Orderid")%>" placeholder="数字越大排序越靠前" >
      </div>
    </div>
  </div>
    <div class="form-group row">
    <label for="Passed" class="col-sm-2 control-label text-right xglab">是否审核</label>
    <div class="col-sm-6">
      <input name="Passed" type="checkbox" id="Passed" value="yes" <%if ors("Passed")="True" then%>checked<%end if%>>
    </div>
  </div>
    <div class="form-group row">
    <label for="Elite" class="col-sm-2 control-label text-right xglab">推荐显示</label>
    <div class="col-sm-6">
     	<input name="Elite" type="checkbox" id="Elite" value="yes" <%if ors("Elite")="True" then%>checked<%end if%>>
    </div>
  </div>
<div class="row">
<div class="col-lg-offset-2 col-lg-6">
<button class="btn btn-danger save" type="button" style="margin:15px auto;">保存产品</button>
<input id="action" value="del" type="hidden">
<input id="pro_id" value="<%=ors("ArticleId")%>" type="hidden">
</div>
  </div>
</form>
<!--列表结束-->
                      </section>
                  </div>
              </div>

              <!--  page end  -->
          </section>
      </section>
      <!--main content end-->
  </section>

<!--#include file="inc/xgfooter.asp"-->
<!--#include file="inc/windows.asp"-->
  <script type="text/javascript">
//导航菜单
$(".nav3").addClass('active');
$(".nav3-3").addClass('active');
$(document).ready(function(){
	update();
});
</script>
<script type="text/javascript" src="ajax/pro.js"></script>
