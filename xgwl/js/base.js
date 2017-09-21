  // 选项卡 鼠标经过切换
  $(".TAB li").mousemove(function(){
    var tab=$(this).parent(".TAB");
    var con=tab.attr("id");
    var on=tab.find("li").index(this);
    $(this).addClass('on').siblings(tab.find("li")).removeClass('on');
    $(con).eq(on).show().siblings(con).hide();
  });

  // 选项卡 鼠标点击
  $(".TAB_CLICK li").click(function(){
    var tab=$(this).parent(".TAB_CLICK");
    var con=tab.attr("id");
    var on=tab.find("li").index(this);
    $(this).addClass('on').siblings(tab.find("li")).removeClass('on');
    $(con).eq(on).show().siblings(con).hide();
  });
  // 选项卡 鼠标点击
  $(".TAB_CLICKa a").click(function(){
      var tab=$(this).parent(".TAB_CLICKa");
      var con=tab.attr("id");
      var on=tab.find("a").index(this);
      $(this).addClass('on').siblings(tab.find("a")).removeClass('on');
      $(con).eq(on).show().siblings(con).hide();
  });

  // pc端导航切换
  $(".XGnav .XGli").mousemove(function(){
      var tab=$(this).parent(".XGnav");
      var con=tab.attr("id");
      var on=tab.find(".XGli").index(this);
      $(this).addClass('on').siblings(tab.find(".XGli")).removeClass('on');
      if(on!=0&&on!=1){
      $(con).eq(on).fadeIn().siblings(con).fadeOut();
      }else{$(con).fadeOut();}
  });
  $(document).click(function(){
      $(".pc-nav").fadeOut();
  });
  $(".pc-nav").mouseleave(function(){
  //    $('.pc-nav').fadeOut();
   //   setTimeout("$('.pc-nav').fadeOut()",2000);
    //
  });
 //向下跳转锚
    $("a.topLink").click(function() {
        $("html, body").animate({
            scrollTop: $($(this).attr("href")).offset().top + "px"
        }, {
            duration: 1000,
            easing: "swing"
        });
        return false;
    });

//显示弹窗并定时关闭弹窗
function showpop(){
	$('.pop').fadeIn();
	setTimeout("$('.pop').fadeOut()",2000);

	}
	$(".cpli").click(function(){
		showpop();
	});
	$('.pop').click(function(){
		$('.pop').fadeOut();
		});
  $(document).ready(function(){
      console.log("最后更新日期2017.9.29 by 任刚");
      $(".slidebar li").addClass("on");
      setTimeout("$('.slidebar li').removeClass('on')",5000);

  });
  //关闭电脑端默认二级菜单
  if(!navigator.userAgent.match(/(iPhone|iPod|iPad|Android|ios)/i)){
      $(document).off('click.bs.dropdown.data-api');
  };
  //在线咨询
  function feedback(v){
    //  alert("在线咨询弹窗")
      if(v!=null){
          $(".fbpop .tit").html("活动报名");
          $(".fbpop .topline").html("备注：");
          $(".fbpop .hdid").val(v);
          $(".fbpop").fadeIn();
          $(".mask").fadeIn();
      }else{
          $(".fbpop .tit").html("在线提问");
          $(".fbpop .topline").html("问题：");
          $(".fbpop .hdid").val("0");
$(".fbpop").fadeIn();
      $(".mask").fadeIn();
      }
  }
  $(".pclose").click(function(){
      $(".fbpop").fadeOut();
      $(".mask").fadeOut();
  });
  //搜索
  $(".s-btn").click(function(){
     var lb=$('.s-lb option:selected') .val();
     var fj=$('.s-fj option:selected') .val();
     var lx=$('.s-lx option:selected') .val();
     var skey=$('.s-key').val();


   //   console.log ($(".s-lb").find("option:selected").attr("value"));//$(".s-lb").find("option:selected").attr("value");
      window.location.href="search.asp?fj="+fj+"&lx="+lx+"&lb="+lb+"&key="+skey+"";
  });
  $(".navbar-search-mag").click(function(){
    //  var skey=$('.navbar-key').val();?key="+skey+"
      window.location.href="search.asp";
  });
  //房贷计算器
  $(".jsqbtn").click(function(){
     var financeAmount= $("#fyzj").val();
      if(financeAmount==''){
          financeAmount=500000;
      }
      var rate= $("#nll").val()/100;
      if(rate==''){
          rate=0.045;
      }
  //    console.log(rate);
      var term= $("#dkqx").val()*12;
      var v = (1+(rate/12));
      var t = (-(term/12)*12);
      var result=(financeAmount*(rate/12))/(1-Math.pow(v,t));
  //    console.log(result.toFixed(2));
$(".outdkze").html("$ " + fmoney(financeAmount,2));
      $(".outdkqx").html(term/12 +" 年");
      $(".outmyhk").html("$ " + fmoney(result,2));
     // pmt=PMT(nll,dkqx*12,fyzj);
      $(".jsjgz").fadeIn();
  //   document.getElementById('jsjg').scrollIntoView()
  });
  function fmoney(s, n) {
      n = n > 0 && n <= 20 ? n : 2;
      s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
      var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
      t = "";
      for (i = 0; i < l.length; i++) {
          t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
      }
      return t.split("").reverse().join("") + "." + r;
  }
  /*
   * 计算月供
   * @param rate 年利率 年利率除以12就是月利率
   * @param term 贷款期数，单位月
   * @param financeAmount  贷款金额
   * @return
   */
  function PMT(rate,term,financeAmount)
  {
      var v = (1+(rate/12));
      var t = (-(term/12)*12);
      var result=(financeAmount*(rate/12))/(1-Math.pow(v,t));
     console.log(result.toFixed(2));
  }
  //汇率弹窗
function hlpop(){
    $(".hlpop").fadeIn();
    $(".mask").fadeIn();
};
  //计算器弹窗
  function jsqpop(){
      $(".jsqpop").fadeIn();
      $(".mask").fadeIn();
  };

function hlpopclose(){
    $(".hlpop").fadeOut();
    $(".mask").fadeOut();
    $(".map1").fadeOut();
    $(".map2").fadeOut();
    $(".map3").fadeOut();
    $(".fbpopok").fadeOut();
    $(".jsqpop").fadeOut();
  };
  function map(v){
      $(".mask").fadeIn();
      $(".map"+v).fadeIn();
  }
  /*房产页顶部图片切换*/
  $(".fplist li").mouseover(function(){
      var newimg=$(this).find("img").attr("src");
      $(this).parents("ul").find(".li1 img").attr("src", newimg);
  });

  //问答部份
  $(".qa li .q").click(function(){
var aa=$(this).parents("li");
      aa.toggleClass("on");
      aa.find(".a").fadeToggle();
  });
  $(".qa li .qaclose").click(function(){
      var aa=$(this).parents("li");
      aa.toggleClass("on");
      aa.find(".a").fadeToggle();
  });
  //打印页面
  function printme(v)
  {
 //     var older = document.body.innerHTML;
   //  var onurl=location.href;
      document.body.innerHTML=$(v).html();
      window.print();
   //   document.body.innerHTML = older;
     // location.href=onurl;
      location.reload();
  }