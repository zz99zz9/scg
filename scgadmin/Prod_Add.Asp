
<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          <%
Dim ranNum
ranNum = month(Now())&day(Now())&hour(Now())&minute(Now())&second(Now())
%>
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
<%dim classid
classid=request.QueryString("Prod_Type")%>
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
                              信息发布
                          </header>
                      <form name="myform" id="myform">    

<div class="form-group row">
    <label for="SiteName" class="col-sm-2 control-label text-right xglab">地域</label>
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
            <option selected value="<%=trim(rs("BigClassName"))%>;<%=trim(rs("BigClassId"))%>"><%=trim(rs("BigClassName"))%></option>
<%
dim selclass
	selclass=rs("BigClassName")
		rs.movenext
	do while not rs.eof
%>
            <option value="<%=trim(rs("BigClassName"))%>;<%=trim(rs("BigClassId"))%>"><%=trim(rs("BigClassName"))%></option>
            <%
			rs.movenext
		loop
end if
	rs.close
%>
        </select></div><div class="col-sm-3">
          <select name="SmallClassName" id="SmallClass" class="form-control">
            <option value="" selected>不指定城市</option>
            <%
sql="select * from [Table_ProSmallclass] where BigClassName='" & selclass & "' order by orderid desc,smallclassid desc"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then
%>
            <option value="<%=rs("SmallClassName")%>;<%=rs("SmallClassId")%>"><%=rs("SmallClassName")%></option>
            <%
rs.movenext
do while not rs.eof
%>
            <option value="<%=rs("SmallClassName")%>;<%=rs("SmallClassId")%>"><%=rs("SmallClassName")%></option>
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
  <div class="form-group row hidden">
  <label for="clb" class="col-sm-2 control-label text-right xglab">类别</label>
  <div class="col-sm-7">
  <select class="form-control" id="clb"><option>类别</option>
                  <%

  sql="select * from [class_lb] order by oid desc"
  rs.open sql,conn,1,1
  if not(rs.eof and rs.bof) then

  do while not rs.eof
  %>
              <option value="<%=rs("CName")%>;<%=rs("Cid")%>"><%=rs("CName")%></option>
              <%
  rs.movenext
  loop
  end if
  rs.close

  %>
  </select>
</div>
</div>
    <div class="form-group row">
    <label for="prod_name" class="col-sm-2 control-label text-right xglab">标题</label>
    <div class="col-sm-7">
      <input type="text" name="prod_name" class="form-control" id="prod_name" >
    </div>
  </div>
<%if classid=8 then%>
      <div class="form-group row">
    <label for="DefaultPicUrl" class="col-sm-2 control-label text-right xglab">PDF</label>
    <div class="col-sm-7 row">
      <div class="col-sm-8"><input name="DefaultPicUrl" type="text" id="DefaultPicUrl" class="form-control col-sm-6"></div>
        <div class="col-sm-3"><input type="button" name="Submit12" value="上传PDF" class="form-control col-sm-2" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></div>
    </div>
  </div>
  <%else%>
        <div class="form-group row">
    <label for="DefaultPicUrl" class="col-sm-2 control-label text-right xglab">列表图片</label>
    <div class="col-sm-7 row">
      <div class="col-sm-8"><input name="DefaultPicUrl" type="text" id="DefaultPicUrl" class="form-control col-sm-6"></div>
        <div class="col-sm-3"><input type="button" name="Submit12" value="上传图片" class="form-control col-sm-2" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></div>
    </div>
  </div>
  <div class="form-group row">
    <label for="PicAlt" class="col-sm-2 control-label text-right xglab">图片Alt</label>
    <div class="col-sm-7">
    <input name="PicAlt" type="text" id="PicAlt" class="form-control col-sm-6">
    </div>
  </div>
    <div class="form-group row">
        <label for="url" class="col-sm-2 control-label text-right xglab">跳转网址</label>
        <div class="col-sm-7 ">
          <input name="url" type="text" id="url" class="form-control col-sm-6"><!-- placeholder="如需跳转，请输入完整网址。参考：http://www.scgoverseas.com/salesteam.asp"-->
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

htmlData =text

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


  htmlData =text

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
      <input type="text" name="tips" class="form-control" id="tips" placeholder="标签之间请用,号将其隔开" >
      </div>
    </div>
  </div>

  <div class="form-group row">
    <label for="title" class="col-sm-2 control-label text-right xglab">title</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="title" class="form-control" id="title" placeholder="推广标题"  value="">
      </div>
    </div>
  </div>
<div class="form-group row">
    <label for="Keywords" class="col-sm-2 control-label text-right xglab">Keywords</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="Keywords" class="form-control" id="Keywords" placeholder="推广关键词之间请用,号将其隔开" >
      </div>
    </div>
  </div>
<div class="form-group row">
    <label for="Description" class="col-sm-2 control-label text-right xglab">Description</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="Description" class="form-control" id="Description" placeholder="推广描述" >
      </div>
    </div>
  </div>
        <div class="form-group row">
    <label for="uptime" class="col-sm-2 control-label text-right xglab">更新时间</label>
    <div class="col-sm-10 row">
    <div class="col-sm-4 input-group">
      <input type="text" name="uptime" class="form-control" id="uptime" value="<%=now()%>" >
    </div>
    </div>
  </div>
    <div class="form-group row">
    <label for="Oid" class="col-sm-2 control-label text-right xglab">排序ID</label>
    <div class="col-sm-7 row">
    <div class="col-sm-2">
      <input type="text" name="Oid" class="form-control" id="Oid" value="0" placeholder="数字越大排序越靠前" >
      </div>
    </div>
  </div>
  <%if classid=20 or classid=21 or classid=22 or classid=23 then%>
   <div class="form-group row">
    <label for="ioid" class="col-sm-2 control-label text-right xglab">首页排序</label>
    <div class="col-sm-7 row">
    <div class="col-sm-2">
      <input type="text" name="ioid" class="form-control" id="ioid" value="0" placeholder="数字越大排序越靠前" >
      </div>
      <div class=col-sm-4><select class="form-control" id="clb"><option>类别</option>
                <%

sql="select * from [class_lb] order by oid desc"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then

do while not rs.eof
%>
            <option value="<%=rs("Cid")%>"><%=rs("CName")%></option>
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
      <input name="Passed" type="checkbox" id="Passed" value="yes" checked>
    </div>
  </div>
    <div class="form-group row">
    <label for="Elite" class="col-sm-2 control-label text-right xglab">推荐显示</label>
    <div class="col-sm-7">
     	<input name="Elite" type="checkbox" id="Elite" value="yes">
    </div>
  </div>
<div class="row">
<div class="col-lg-offset-2 col-lg-7">
<button class="btn btn-danger save" type="button" style="margin:15px auto;">保存</button>
<input id="action" value="add" type="hidden">
<input id="classid" value="<%=classid%>" type="hidden">
<input id="pid" value="0" type="hidden">
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

<%if classid>15 and classid<>25 then%>

$(".nav5").addClass('active');
$(".nav5-<%=classid%>a").addClass('active');
<%else%>
$(".nav4").addClass('active');
$(".nav4-<%=classid%>a").addClass('active');
<%end if%>
</script>
<script type="text/javascript" src="ajax/prod.js"></script>
