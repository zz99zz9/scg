$(".vbtn").click(function(){
  var  vname=$(this).parent("form").find($(".vname"));
    var  vtel=$(this).parent("form").find($(".vtel"));
    var  vmail=$(this).parent("form").find($(".vmail"));
    var  vcontect=$(this).parent("form").find($(".vcontect"));
    var  vhdid=$(this).parent("form").find($(".hdid"));
    checkwrint1(vname);
    checkwrint2(vtel);
    checkwrint3(vmail);
    if (vname.hasClass("no")||vtel.hasClass("no")||vmail.hasClass("no")){
     //   console.log("over");
    }else {
//写入数据库
        $.post("ajax/vfeedback.asp", {

                vname: vname.val(),
                vtel: vtel.val(),
                vmail: vmail.val(),
                vhdid: vhdid.val(),
                vcontect: vcontect.val(),

            },
            function (data, status) {

                if (data == "ok" && status == "success") {

                    $(".vname").val("");
                    $(".vtel").val("");
                    $(".vmail").val("");
                    $(".vcontect").val("");
                    $(".fbpop").fadeOut();
                    $(".fbpopok").fadeIn();
                   $(".mask").fadeIn();
                    //    $("#alert").fadeIn();
                    //   $("#alert").addClass("alert-success");
                    //   $("#alert strong").html("操作成功!");
                }
            });
        //写入数据库结束
    }
});
$(".fbpopokbtn").click(function(){
    $(".mask").fadeOut();
    $(".fbpopok").fadeOut();
});
$(".vbtn").mouseover(function(){
//鼠标经过按钮事件
});


/////////////////////////////////////
//          验证管理员表单           //
////////////////////////////////////
//输入时验证表单
function getLength(str){
    // \x00-xff代表单字节字符。
    return str.replace(/[^\x00-\xff]/g, "xx").length;
}
var reg1 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/; // 验证邮箱正则
var reg2 = /^1\d{10}$/;     //验证手机号正则
//wrint1 名称

$(".vname").blur(function(){
    checkwrint1(this);
});
$(".vtel").blur(function(){
    checkwrint2(this);
});
$(".vtel").focus(function(){
  //  $(this).next(".err").html("参考格式：+86 21 60737686");//名称不能为空
});
$(".vmail").blur(function(){
    checkwrint3(this);
});


//弹窗提交时验证表单

//   $.cookie('downcheck','-_-||',{expires: 1});

//验证表单
function checkwrint1(v){

    var reg = /[^\w\u4e00-\u9fa5]/g;    // 验证用户名正则
    if ($(v).val()==""||$(v).val()=="您的姓名"){

        $(v).addClass("no");
        $(v).next(".err").html("× 名称不能为空");//名称不能为空
    }else if(reg.test($(v).val())){
        $(v).addClass("no");
        $(v).next(".err").html("× 请正确输入姓名");//名称不能含有非法字符

    }else if(getLength($(v).val())<2){
        $(v).addClass("no");
        $(v).next(".err").html("× 请正确输入姓名");//名称不能少于4个字符

    }else if(getLength($(v).val())>16){
        $(v).addClass("no");
        $(v).next(".err").html("× 请正确输入姓名");//名称不能多于16个字符

    }else {
        $(v).removeClass("no");
        $(v).next(".err").html("");
    }
}

function checkwrint2(v){
    if ($(v).val()==""||$(v).val()=="手机号码"){
        $(v).addClass("no");
        $(v).next(".err").html("× 电话不能为空");//手机号码不能为空

    }else if(getLength($(v).val())<2){
        $(v).addClass("no");
        $(v).next(".err").html("× 请正确输入您的座机或手机号码");//名称不能少于4个字符

    }else if(getLength($(v).val())>16){
        $(v).addClass("no");
        $(v).next(".err").html("× 请正确输入您的座机或手机号码");//名称不能多于16个字符
//    }else if(!reg2.test($(v).val())){
//        $(v).addClass("no");
//        $(v).next(".err").html("× 请检查手机号码是否正确");//请检查手机号码是否正确
//
    }else{
        $(v).removeClass("no");
        $(v).next(".err").html("");
    }
}
function checkwrint3(v){
    if ($(v).val()==""||$(v).val()=="邮箱地址"){
        $(v).addClass("no");
        $(v).next(".err").html("× 邮箱地址不能为空");//邮箱地址不能为空
    }else if(!reg1.test($(v).val())){
        $(v).addClass("no");
        $(v).next(".err").html("× 邮箱地址格式不正确");
    }else{
        $(v).removeClass("no");
        $(v).next(".err").html("");
    }
}
