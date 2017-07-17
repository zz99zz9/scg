
<!--#include file="inc/xgheader.asp"-->
<%tablename="class_prod"%>
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start -->

                            <!--成功失败提示-->
<div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>产品类别修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              类别设置 <button class="btn btn-success mod" data-toggle="modal" data-action="add" data-xgtable="<%=tablename%>">新建类别</button>
                          </header>
                          
<!--列表开始-->

<div id="tablee"></div>
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
$(".nav4").addClass('active');
$(".nav4-5").addClass('active');

$(document).ready(function(e) {
	var tablename="<%=tablename%>";
   defalutlist("list",tablename);
});

</script>
<script type="text/javascript" src="ajax/xgclass.js"></script>
