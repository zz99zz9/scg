<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          <div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>网站基本信息已经修改成功。</span>
                              </div>
              <!--    <%
			   Dim action
  action=Trim(Request.QueryString("Action"))
  select case action
  case ""
  set oRs=Server.CreateObject("ADODB.Recordset")
  oRs.Open "select * From Table_SiteInfo ",conn,1,3
  %>  -->
<form id="xgform" action="?action=Upda" class="form-horizontal" role="form">
  <div class="form-group">
    <label for="SiteName" class="col-sm-2 control-label text-right xglab">网站名称</label>
    <div class="col-sm-6">
      <input type="text" name="SiteName" class="form-control" id="SiteName" value="<%=oRs("SiteName")%>" placeholder="请输入您公司网站的名称" required>
    </div>
  </div>
    <div class="form-group">
    <label for="SiteTitle" class="col-sm-2 control-label text-right">网站标题</label>
    <div class="col-sm-6">
      <input type="text" name="SiteTitle" class="form-control" id="SiteTitle" value="<%=oRs("SiteTitle")%>" placeholder="请输入您公司网站的标题" required>
    </div>
  </div>
      <div class="form-group">
    <label for="SiteKey" class="col-sm-2 control-label text-right">推广关键词</label>
    <div class="col-sm-6">
      <input type="text" name="SiteKey" class="form-control" id="SiteKey" value="<%=oRs("SiteKey")%>" placeholder="请输入您公司网站的推广关键词">
    </div>
  </div>
  <div class="form-group">
    <label for="SiteCont" class="col-sm-2 control-label text-right">网站推广描述</label>
    <div class="col-sm-6">
     <textarea class="form-control " id="SiteCont" name="SiteCont" ><%=oRs("SiteCont")%></textarea> 
    </div>
  </div>
      <div class="form-group">
    <label for="CoCode" class="col-sm-2 control-label text-right">统计代码</label>
    <div class="col-sm-6">
      <textarea class="form-control " id="CoCode" name="CoCode"><%=oRs("CoCode")%></textarea> 
    </div>
  </div>
    <div class="form-group">
    <label for="SiteURl" class="col-sm-2 control-label text-right">网站地址</label>
    <div class="col-sm-6">
      <input type="text" name="SiteURl" class="form-control" id="SiteURl" value="<%=oRs("SiteURl")%>" placeholder="例：http://www.shxgwl.com">
    </div>
  </div>
      <div class="form-group">
    <label for="SiteCopyRight" class="col-sm-2 control-label text-right">版权信息</label>
    <div class="col-sm-6">
      <input type="text" name="SiteCopyRight" class="form-control" id="SiteCopyRight" value="<%=oRs("SiteCopyRight")%>" placeholder="CopyRight &copyright; 贵公司名 All Right reserved.">
    </div>
  </div>
  <div class="form-group">
    <label for="Sitebeian" class="col-sm-2 control-label text-right">备案信息</label>
    <div class="col-sm-6">
      <input type="text" name="Sitebeian" class="form-control" id="Sitebeian" value="<%=oRs("Sitebeian")%>" placeholder="例：沪ICP备 88888888号">
    </div>
  </div>
    <div class="form-group">
    <label for="CoName" class="col-sm-2 control-label text-right">企业名称</label>
    <div class="col-sm-6">
      <input type="text" name="CoName" class="form-control" id="CoName" placeholder="" value="<%=oRs("CoName")%>">
    </div>
  </div>
      <div class="form-group">
    <label for="CoTel" class="col-sm-2 control-label text-right">企业电话</label>
    <div class="col-sm-6">
      <input type="text" name="CoTel" class="form-control" id="CoTel" placeholder="" value="<%=oRs("CoTel")%>">
    </div>
  </div>
        <div class="form-group">
    <label for="CoFax" class="col-sm-2 control-label text-right">企业传真</label>
    <div class="col-sm-6">
      <input type="text" name="CoFax" class="form-control" id="CoFax" placeholder="" value="<%=oRs("CoFax")%>">
    </div>
  </div>
        <div class="form-group">
    <label for="CoMail" class="col-sm-2 control-label text-right">企业邮箱</label>
    <div class="col-sm-6">
      <input type="text" name="CoMail" class="form-control" id="CoMail" placeholder="" value="<%=oRs("CoMail")%>">
    </div>
  </div>
  <div class="form-group">
    <label for="Coaddr" class="col-sm-2 control-label text-right">企业地址</label>
    <div class="col-sm-6">
      <input type="text" name="Coaddr" class="form-control" id="Coaddr" placeholder="" value="<%=oRs("Coaddr")%>">
    </div>
  </div>
<div class="form-group">
                                      <div class="col-lg-offset-2 col-lg-10">
                                      <input type="hidden" id="id" name="id" value="1">
                                          <button class="btn btn-danger save" type="button">保存设置</button>
                                      </div>
                                  </div>
</form>
<%oRs.close
set oRs=nothing
case "Upda"
id=Trim(Request.Form("id"))
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from Table_SiteInfo where id="&id,conn,1,3
oRs("sitename")=Trim(Request.Form("Sitename"))
oRs("siteTitle")=Trim(Request.Form("SiteTitle"))
oRs("siteKey")=Trim(Request.Form("SiteKey"))
oRs("siteCont")=Trim(Request.Form("SiteCont"))
oRs("ensitename")=Trim(Request.Form("enSitename"))
oRs("ensiteTitle")=Trim(Request.Form("enSiteTitle"))
oRs("ensiteKey")=Trim(Request.Form("enSiteKey"))
oRs("ensiteCont")=Trim(Request.Form("enSiteCont"))
oRs("siteUrl")=Trim(Request.Form("SiteUrl"))
oRs("siteCopyRight")=Trim(Request.Form("SiteCopyRight"))
oRs("ensiteCopyRight")=Trim(Request.Form("enSiteCopyRight"))
oRs("sitebeian")=Trim(Request.Form("Sitebeian"))
oRs("ensitebeian")=Trim(Request.Form("enSitebeian"))
oRs("WebMasterName")=Trim(Request.Form("WebMasterName"))
oRs("WebMasterEmail")=Trim(Request.Form("WebMasterEmail"))
oRs("Comail")=Trim(Request.Form("Comail"))
oRs("CoName")=Trim(Request.Form("CoName"))
oRs("enCoName")=Trim(Request.Form("enCoName"))
oRs("CoTel")=Trim(Request.Form("CoTel"))
oRs("CoFax")=Trim(Request.Form("CoFax"))
oRs("CoAddr")=Trim(Request.Form("CoAddr"))
oRs("enCoAddr")=Trim(Request.Form("enCoAddr"))
oRs("CoCode")=Trim(Request.Form("CoCode"))
oRs.Update
Set oRs=Nothing
'call showPop("信息修改成功！","WebInfo.Asp",1)
case Else
'call showPop("错误的参数信息！","-1",2)
End select
%>
              <!--    -->
          </section>
      </section>
      <!--main content end-->
  </section>

<!--#include file="inc/windows.asp"-->
<!--#include file="inc/xgfooter.asp"-->
  <script type="text/javascript">
//导航菜单
$(".nav1").addClass('active');
$(".nav1-1").addClass('active');
</script>
<script type="text/javascript" src="ajax/base.js"></script>
