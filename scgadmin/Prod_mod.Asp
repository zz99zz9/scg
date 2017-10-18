
<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          <%
dim rs
dim sql
dim count

set rs=server.createobject("adodb.recordset")
sql = "select * from [Table_ProSmallclass] order by orderid desc,SmallClassID desc"
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
              <!-- page start -->

                            <!--成功失败提示-->
<div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>栏目内容修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row ">
                  <div class="col-lg-12">
                      <section class="panel pb50">
                          <header class="panel-heading mb50">
                              信息修改
                          </header>
                      <form name="myform" id="myform">    
                      <%
Dim PID
PID=Trim(Request.QueryString("ID"))
classid=Trim(Request.QueryString("Prod_Type"))
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [prod] where prod_id="&PID,conn,1,3
if oRs.Eof then
'无数据
End if
%>
<!--国家分类开始-->
   <div class="form-group row">
    <label for="SiteName" class="col-sm-2 control-label text-right xglab">地域分类</label>
    <div class="col-sm-10 row">
    <div class="col-sm-3">
      <%
sql = "select * from [Table_ProBigClass] order by orderid desc,bigclassid desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "请先添加栏目。"
else
%>
<select name="BigClassName" id="BigClass" class="form-control" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">

<%
dim selclass
	selclass=ors("BigClass")

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
sql="select * from [Table_ProSmallclass] where BigClassName='" & selclass & "' order by orderid desc"
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
  <!--国家分类结束-->
    <div class="form-group row">
    <label for="prod_name" class="col-sm-2 control-label text-right xglab">标题</label>
    <div class="col-sm-7">
      <input type="text" name="prod_name" class="form-control" id="prod_name" value="<%=oRs("prod_name")%>">
    </div>
  </div>
<%if classid=8 then%>
      <div class="form-group row">
    <label for="DefaultPicUrl" class="col-sm-2 control-label text-right xglab">PDF</label>
    <div class="col-sm-7 row">
      <div class="col-sm-8"><input name="DefaultPicUrl" type="text" id="DefaultPicUrl" class="form-control col-sm-6" value="<%=oRs("prod_pic")%>"></div>
        <div class="col-sm-3"><input type="button" name="Submit12" value="上传PDF" class="form-control col-sm-2" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></div>
    </div>
  </div>
  <%else%>
        <div class="form-group row">
    <label for="DefaultPicUrl" class="col-sm-2 control-label text-right xglab">列表图片</label>
    <div class="col-sm-7 row">
      <div class="col-sm-8"><input name="DefaultPicUrl" type="text" id="DefaultPicUrl" class="form-control col-sm-6" value="<%=oRs("prod_pic")%>"></div>
        <div class="col-sm-3"><input type="button" name="Submit12" value="上传图片" class="form-control col-sm-2" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></div>
    </div>
  </div>
          <div class="form-group row">
    <label for="PicAlt" class="col-sm-2 control-label text-right xglab">图片Alt</label>
    <div class="col-sm-7 ">
      <input name="PicAlt" type="text" id="PicAlt" class="form-control col-sm-6" value="<%=oRs("picalt")%>">
    </div>
  </div>
  <div class="form-group row">
      <label for="url" class="col-sm-2 control-label text-right xglab">跳转网址</label>
      <div class="col-sm-7 ">
        <input name="url" type="text" id="url" class="form-control col-sm-6" value="<%=oRs("url")%>"><!-- placeholder="如需跳转，请输入完整网址。参考：http://www.scgoverseas.com/salesteam.asp"-->
      </div>
    </div>
  <%end if%>
<%if classid<>8 then%>
<div class="form-group row">
    <label for="content" class="col-sm-2 control-label text-right xglab">内容</label>
    <div class="col-sm-7 ">                          
<!--列表开始-->
<%
Dim htmlData

htmlData =oRs("prod_detail")

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
			filterMode: false,//是否开启过滤模式
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
      <label for="content1" class="col-sm-2 control-label text-right xglab">摘要</label>
      <div class="col-sm-7 ">
  <!--列表开始-->
  <%

  htmlData =oRs("prod_detailen")

  %>
  	  	<link rel="stylesheet" href="kindeditor-4.1.7/themes/default/default.css" />
  	<link rel="stylesheet" href="kindeditor-4.1.7/plugins/code/prettify.css" />
  	<script src="kindeditor-4.1.7/kindeditor.js"></script>
  	<script src="kindeditor-4.1.7/lang/zh_CN.js"></script>
  	<script src="kindeditor-4.1.7/plugins/code/prettify.js"></script>
  	<script>
  		KindEditor.ready(function(K) {
  			var editor1 = K.create('textarea[name="content1"]', {
  			filterMode: false,//是否开启过滤模式
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


  <textarea name="content1" id="content1" style="width:100%;height:450px;visibility:hidden;" class="form-control"><%=htmlspecialchars(htmlData)%></textarea>

      </div>
    </div>
<%end if%>
<div class="form-group row">
    <label for="tips" class="col-sm-2 control-label text-right xglab">云标签</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="tips" class="form-control" id="tips" placeholder="请输入关键词" value="<%=oRs("tips")%>">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="title" class="col-sm-2 control-label text-right xglab">title</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="title" class="form-control" id="title" placeholder="推广标题"  value="<%=oRs("title2")%>">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="Keywords" class="col-sm-2 control-label text-right xglab">Keywords</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="Keywords" class="form-control" id="Keywords" placeholder="推广关键词之间请用,号将其隔开"  value="<%=oRs("Keywords")%>">
      </div>
    </div>
  </div>
<div class="form-group row">
    <label for="Description" class="col-sm-2 control-label text-right xglab">Description</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="Description" class="form-control" id="Description" placeholder="推广描述"  value="<%=oRs("Description")%>">
      </div>
    </div>
  </div>
        <div class="form-group row">
    <label for="uptime" class="col-sm-2 control-label text-right xglab">更新时间</label>
    <div class="col-sm-10 row">
    <div class="col-sm-4 input-group">
      <input type="text" name="uptime" class="form-control" id="uptime" value="<%=ors("prod_date")%>" >
    </div>
    </div>
  </div>
    <div class="form-group row">
    <label for="Oid" class="col-sm-2 control-label text-right xglab">排序ID</label>
    <div class="col-sm-7 row">
    <div class="col-sm-2">
      <input type="text" name="Oid" class="form-control" id="Oid" value="<%=oRs("oid")%>" placeholder="数字越大排序越靠前" >
      </div>
    </div>
  </div>
  <%if classid=20 or classid=21 or classid=22 or classid=23 then%>
   <div class="form-group row">
    <label for="ioid" class="col-sm-2 control-label text-right xglab">首页排序</label>
    <div class="col-sm-7 row">
    <div class="col-sm-2">
      <input type="text" name="ioid" class="form-control" id="ioid" value="<%=oRs("ioid")%>" placeholder="数字越大排序越靠前" >
      </div><div class=col-sm-4><select class="form-control" id="clb"><option>类别</option>
                <%

sql="select * from [class_lb] order by oid desc"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then

do while not rs.eof
%>
            <option value="<%=rs("Cid")%>" <%if int(rs("cid"))=int(ors("clbid")) then%>selected<%end if%>><%=rs("CName")%></option>
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
  <%else%>
  <input type="hidden" name="ioid" id="ioid" value="0">
  <input type="hidden" name="clb" id="clb" value="0">
  <%end if%>
   <div class="form-group row">
    <label for="Passed" class="col-sm-2 control-label text-right xglab">是否审核</label>
    <div class="col-sm-7">
      <input name="Passed" type="checkbox" id="Passed" value="yes" <%if ors("Passed")="True" then%>checked<%end if%>>
    </div>
  </div>
    <div class="form-group row">
    <label for="Elite" class="col-sm-2 control-label text-right xglab">推荐显示</label>
    <div class="col-sm-7">
     	<input name="Elite" type="checkbox" id="Elite" value="yes" <%if ors("Elite")="True" then%>checked<%end if%>>
    </div>
  </div>
<div class="row">
<div class="col-lg-offset-2 col-lg-7">
<button class="btn btn-danger save" type="button" style="margin:15px auto;">保存</button>
<input id="action" value="mod" type="hidden">
<input id="classid" value="<%=oRs("classid")%>" type="text">
<input id="pid" value="<%=oRs("prod_id")%>" type="hidden">
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

<%if classid>19 and classid<>25 then%>

$(".nav7").addClass('active');
$(".nav7-<%=classid%>").addClass('active');
<%elseif classid>15 and classid<>25 then%>

$(".nav5").addClass('active');
$(".nav5-<%=classid%>").addClass('active');
<%else%>
$(".nav4").addClass('active');
$(".nav4-<%=classid%>").addClass('active');
<%end if%>

</script>
<script type="text/javascript" src="ajax/prod.js"></script>
