<!-- 技术支持 -->
                              <div class="modal fade" id="contectxgwl" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:200px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
如果需要为网站增加更多语言，请联系系统开发人员！<br><br>
任刚 13764011245<br><br>

QQ 4659489

                                          </div>
                                          <div class="modal-footer" style="height:45px;padding:5px;text-align:center;">
                                              
                                              <a data-dismiss="modal" class="btn btn-danger" > 确认</a>
                                          </div>
                                      </div>
                                  </div>
                              </div>
<!-------->
<!-- 添加、修改管理员 -->
                              <div class="modal fade" id="adminadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:220px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<form id="xgform" action="" class="form-horizontal" role="form">
        <div class="form-group">
    <label for="AdminName" class="col-sm-3 control-label text-right">登录名称</label>
    <div class="col-sm-8">
<input type="text" name="AdminName" class="form-control" id="AdminName" data-toggle="tooltip" title="由4-16个英文、数字或中文组成">
<input type="hidden" name="AdminId" class="form-control" id="AdminId"  >
 <input type="hidden" name="Action" class="form-control" id="Action" value="add">
    </div>
  </div>
  <div class="form-group">
    <label for="AdminPass" class="col-sm-3 control-label text-right">登录密码</label>
    <div class="col-sm-8">
      <input type="password" name="AdminPass" class="form-control" id="AdminPass" placeholder="" data-toggle="tooltip" title="由6-20个英文、数字或常用符号组成">
    </div>
  </div>
    <div class="form-group">
    <label for="AdminPass2" class="col-sm-3 control-label text-right">确认密码</label>
    <div class="col-sm-8">
      <input type="password" name="AdminPass2" class="form-control" id="AdminPass2" placeholder="" data-toggle="tooltip" title="请再次输入密码">
    </div>
  </div>

</form>
                                          </div>
                                          <div class="modal-footer " style="height:45px;padding:5px;text-align:center;">
                                           <button data-dismiss="modal" class="btn btn-danger adminadd" > 确认</button>
                                           <button data-dismiss="modal" class="btn btn-default" > 取消</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              
<!-- 添加、修改、删除大类 -->
                              <div class="modal fade" id="bigclass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:220px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<form id="xgbigclass" action="" class="form-horizontal" role="form">
        <div class="form-group">
    <label for="BigClassName" class="col-sm-3 control-label text-right">大类名称</label>
    <div class="col-sm-8">
<input type="text" name="BigClassName" class="form-control" id="BigClassName" data-toggle="tooltip" title="由英文、数字或中文组成">
<input type="hidden" name="BigClassId" class="form-control" id="BigClassId"  >
 <input type="hidden" name="BAction" class="form-control" id="BAction" value="add">
    </div>
  </div>

    <div class="form-group">
    <label for="OrderID" class="col-sm-3 control-label text-right">排序级别</label>
    <div class="col-sm-8">
      <input type="text" name="OrderID" value="0" class="form-control" id="OrderID" placeholder="" data-toggle="tooltip" title="数字越大排序越靠前">
    </div>
  </div>

</form>
                                          </div>
                                          <div class="modal-footer " style="height:45px;padding:5px;text-align:center;">
                                           <button data-dismiss="modal" class="btn btn-danger save" > 确认</button>
                                           <button data-dismiss="modal" class="btn btn-default" > 取消</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
<!-- 添加、修改、删除小类 -->
                              <div class="modal fade" id="smallclass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:220px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<form id="xgsmallclass" action="" class="form-horizontal" role="form">
        <div class="form-group">
    <label for="BigClassName" class="col-sm-3 control-label text-right">小类名称</label>
    <div class="col-sm-8">
    <input type="text" name="SmallClassName" class="form-control" id="SmallClassName" data-toggle="tooltip" title="由英文、数字或中文组成">
<input type="hidden" name="SBigClassId" class="form-control" id="SBigClassId"  >
<input type="hidden" name="SmallClassId" class="form-control" id="SmallClassId"  >
 <input type="hidden" name="SAction" class="form-control" id="SAction" value="add">
    </div>
  </div>

    <div class="form-group">
    <label for="SOrderID" class="col-sm-3 control-label text-right">排序级别</label>
    <div class="col-sm-8">
      <input type="text" name="SOrderID" value="0" class="form-control" id="SOrderID" placeholder="" data-toggle="tooltip" title="数字越大排序越靠前">
    </div>
  </div>
      <div class="form-group">
    <label for="SBigClassName" class="col-sm-3 control-label text-right">所属大类</label>
    <div class="col-sm-8">
      <input type="text" name="SBigClassName" class="form-control" id="SBigClassName" disabled>
    </div>
  </div>

</form>
                                          </div>
                                          <div class="modal-footer " style="height:45px;padding:5px;text-align:center;">
                                           <button data-dismiss="modal" class="btn btn-danger ssave" > 确认</button>
                                           <button data-dismiss="modal" class="btn btn-default" > 取消</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
<!-- 添加、修改、删除类别 -->
                              <div class="modal fade" id="xgclass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:220px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<form id="xg-class" action="" class="form-horizontal" role="form" name="xgclass">
        <div class="form-group">
    <label for="XGCName" class="col-sm-3 control-label text-right">类别名称</label>
    <div class="col-sm-8">
<input type="text" name="XGCName" class="form-control" id="XGCName" data-toggle="tooltip" title="由英文、数字或中文组成">
<input type="hidden" name="XGCID" class="form-control" id="XGCID"  >
 <input type="hidden" name="XGAction" class="form-control" id="XGAction" value="add">
 <input type="hidden" name="XGTable" class="form-control" id="XGTable" />
    </div>
  </div>

    <div class="form-group">
    <label for="XGOID" class="col-sm-3 control-label text-right">排序级别</label>
    <div class="col-sm-8">
      <input type="text" name="XGOID" value="0" class="form-control" id="XGOID" placeholder="" data-toggle="tooltip" title="数字越大排序越靠前">
    </div>
  </div>
        <div class="form-group">
    <label for="XGCFile" class="col-sm-3 control-label text-right">附件</label>
    <div class="col-sm-8 input-group">
<input type="text" name="XGCFile" class="form-control" id="XGCFile" data-toggle="tooltip" title="请点击右侧上传按钮">
<span class="input-group-addon b_h" onClick="window.open('Yr_UpFile.Asp?formname=xgclass&editname=XGCFile&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">上传附件</span>
    </div>
  </div>
</form>
                                          </div>
                                          <div class="modal-footer " style="height:45px;padding:5px;text-align:center;">
                                           <button data-dismiss="modal" class="btn btn-danger save" > 确认</button>
                                           <button data-dismiss="modal" class="btn btn-default" > 取消</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
<!-- 添加、修改、删除房户型图、特色、服务 -->
                              <div class="modal fade" id="fxgclass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:160px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<form id="xg-class" action="" class="form-horizontal" role="form" name="xgf">
        <div class="form-group">
    <label for="XGCName" class="col-sm-3 control-label text-right">名称</label>
    <div class="col-sm-8">
<input type="text" name="ftit" class="form-control" id="ftit" data-toggle="tooltip" title="由英文、数字或中文组成">
<input type="hidden" name="fid" class="form-control" id="fid"  >
<input type="hidden" name="ffid" class="form-control" id="ffid"  >
 <input type="hidden" name="fAction" class="form-control" id="fAction" value="add">
 <input type="hidden" name="ftable" class="form-control" id="ftable" />
    </div>
  </div>
        <div class="form-group">
    <label for="ftxt" class="col-sm-3 control-label text-right">介绍</label>
    <div class="col-sm-8">

<textarea  name="ftxt" class="form-control" id="ftxt" data-toggle="tooltip" title="由英文、数字或中文组成"></textarea>
    </div>
  </div>
        <div class="form-group">
    <label for="fjg" class="col-sm-3 control-label text-right">价格</label>
    <div class="col-sm-8">

<input type="text" name="fjg" class="form-control" id="fjg" data-toggle="tooltip" title="由英文、数字或中文组成">
    </div>
  </div>
        <div class="form-group">
    <label for="ffile" class="col-sm-3 control-label text-right">附件</label>
    <div class="col-sm-8 input-group">
<input type="text" name="ffile" class="form-control" id="ffile" data-toggle="tooltip" title="请点击右侧上传按钮">
<span class="input-group-addon b_h" onClick="window.open('Yr_UpFile.Asp?formname=xgf&editname=ffile&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">上传附件</span>
    </div>
  </div>
      <div class="form-group">
      <label for="foid" class="col-sm-3 control-label text-right">排序级别</label>
      <div class="col-sm-8">
        <input type="text" name="foid" value="0" class="form-control" id="foid" placeholder="" data-toggle="tooltip" title="数字越大排序越靠前">
      </div>
    </div>
</form>
                                          </div>
                                          <div class="modal-footer " style="height:45px;padding:5px;text-align:center;">
                                           <button data-dismiss="modal" class="btn btn-danger fsave" > 确认</button>
                                           <button data-dismiss="modal" class="btn btn-default" > 取消</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
<!-- 上传图片 -->
                              <div class="modal fade" id="pro_pic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:200px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<input type="file" id="pro_pic_file" class="form-control"/>
<script>
    $(function(){
       $("#pro_pic_file").change(function(e){
             var file = e.target.files||e.dataTransfer.files;
             if(file){
                 var reader = new FileReader();
                 reader.onload=function(){
                        $("<img src='"+this.result+"'/>").appendTo(".modal-body");

                 }

                reader.readAsDataURL(file);
            }
      });
   })

 </script>

                                          </div>
                                          <div class="modal-footer" style="height:45px;padding:5px;text-align:center;">
                                              
                                              <a data-dismiss="modal" class="btn btn-danger" > 确认</a>
                                          </div>
                                      </div>
                                  </div>
                              </div>
<!-- 添加、修改、删除房户型图、特色、服务 -->
                              <div class="modal fade" id="xglinks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:120px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<form id="xglinks" action="" class="form-horizontal" role="form" name="xglinks">
        <div class="form-group">
    <label for="ltit" class="col-sm-3 control-label text-right">名称</label>
    <div class="col-sm-8">


<input type="text" name="ltit" class="form-control" id="ltit" data-toggle="tooltip" title="由英文、数字或中文组成">
<input type="hidden" name="lwid" class="form-control" id="lwid"  >
<input type="hidden" name="lid" class="form-control" id="lid"  >
 <input type="hidden" name="lAction" class="form-control" id="lAction" value="add">

    </div>
  </div>
        <div class="form-group">
    <label for="lstit" class="col-sm-3 control-label text-right">显示名</label>
    <div class="col-sm-8">

<input type="text" name="lstit" class="form-control" id="lstit" data-toggle="tooltip" title="由英文、数字或中文组成">
    </div>
  </div>
        <div class="form-group">
    <label for="lstxt" class="col-sm-3 control-label text-right">显示内容</label>
    <div class="col-sm-8">
<textarea  name="lstxt" class="form-control" id="lstxt" ></textarea>

    </div>
  </div>
          <div class="form-group">
      <label for="lurl" class="col-sm-3 control-label text-right">链接网址</label>
      <div class="col-sm-8">
<input type="text" name="lurl" class="form-control" id="lurl" data-toggle="tooltip" title="由英文、数字或中文组成">

      </div>
    </div>
        <div class="form-group">
    <label for="lfile" class="col-sm-3 control-label text-right">附件</label>
    <div class="col-sm-8 input-group">
<input type="text" name="lfile" class="form-control" id="lfile" data-toggle="tooltip" title="请点击右侧上传按钮">
<span class="input-group-addon b_h" onClick="window.open('Yr_UpFile.Asp?formname=xglinks&editname=lfile&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">上传附件</span>
    </div>
  </div>
      <div class="form-group">
      <label for="loid" class="col-sm-3 control-label text-right">排序级别</label>
      <div class="col-sm-8">
        <input type="text" name="loid" value="0" class="form-control" id="loid" placeholder="" data-toggle="tooltip" title="数字越大排序越靠前">
      </div>
    </div>
</form>
                                          </div>
                                          <div class="modal-footer " style="height:45px;padding:5px;text-align:center;">
                                           <button data-dismiss="modal" class="btn btn-danger lsave" > 确认</button>
                                           <button data-dismiss="modal" class="btn btn-default" > 取消</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
<!-- 上传图片 -->
                              <div class="modal fade" id="pro_pic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" style='z-index:2901; margin-top:200px; '>
                                      <div class="modal-content">
                                          <div class="modal-header" style="background:#FF6C60;">
                                              <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                              <span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！
                                          </div>
                                          <div class="modal-body" style="font-size:18px;">
<input type="file" id="pro_pic_file" class="form-control"/>
<script>
    $(function(){
       $("#pro_pic_file").change(function(e){
             var file = e.target.files||e.dataTransfer.files;
             if(file){
                 var reader = new FileReader();
                 reader.onload=function(){
                        $("<img src='"+this.result+"'/>").appendTo(".modal-body");

                 }

                reader.readAsDataURL(file);
            }
      });
   })

 </script>

                                          </div>
                                          <div class="modal-footer" style="height:45px;padding:5px;text-align:center;">

                                              <a data-dismiss="modal" class="btn btn-danger" > 确认</a>
                                          </div>
                                      </div>
                                  </div>
                              </div>