 	 <!--footer-->
     <div class="footer">
        <div class="container">
        <div class="row">
            <div class="footer-l col-md-7">
                <div class='footereq hidden-xs'><img src='xgwl/img/qr3.png'></div>
            <p class="viptel">上海建工海外地产中心VIP电话：</p>
            <a class="pico pico-tel2 " href="tel:400-901-6788"></a>
            <div class="clearfix"></div>
            <div class="fsns">
            <!--推广审核--><a class="pico pico-fsns-wx mr30 b_h" href="#"> <span class="sbr-qr tra"><img src="xgwl/img/qr.gif"></span></a><a class="pico pico-fsns-sina mr30 b_h" href="http://weibo.com/u/5964312962?from=myfollow_all&is_all=1" target="_blank"></a><a class="pico pico-fsns-c mr30 b_h" href="https://www.instagram.com/manhattanviewatmima/" target="_blank"></a><a class="pico b_h pico-fsns-f" href="https://www.facebook.com/manhattanviewatmima/" target="_blank"></a>
            <div class="clearfix"></div>
            </div>
            <div class="flinks hidden-xs">友情链接：<br>
            <%Set prs= Server.CreateObject("ADODB.Recordset")
        psql="select * From [links] where wid=4 order by oid desc,ID desc"
        prs.open psql,conn,1,1
        i=0%>
        <%do while not prs.eof%>

             <a href="<%=prs("url")%>" class="s_link2" target="_blank" rel="nofollow"><%=prs("stit")%></a>
         <%
        	i=i+1
        	     prs.movenext
        	loop
        prs.close
        set prs=nothing
        %>
      
            </div>
           <!---->
</div>
            <div class="footer-r col-md-5 ">
                <ul class="faddress TAB_CLICK" id=".fadd"><li class="li3 hand on">上海建工海外地产中心</li><li class="li2 hand">上海建工美洲公司</li><li class="li1 hand">上海建工集团</li></ul>
 <div class="fadd fadd3">上海市徐汇区小木桥路681号25楼 <a href="javascript:map(1)" class="hidden-xs">[地图]</a><br>
                                       电话：400 901 6788<br>
                                    <a href="visit.asp">进一步了解 &gt;</a>
                                    </div>
                        <div class="fadd fadd2">Times Square Plaza, 1500 Broadway Suite 3300, New York, NY 10036<a href="#"></a><br>
                             电话：+1 212 789 0000<br>
                          <a href="http://www.scgamerica.com/" target="_blank">进一步了解 &gt;</a></div>
                    <div class="fadd fadd1">上海市虹口区东大名路666号  <a href="javascript:map(2)" class="hidden-xs">[地图]</a><br>
                       电话：+86-21-5588 5959<br>
 <a href="http://www.scg.com.cn/" target="_blank">进一步了解 &gt;</a></div>
</div>
            </div>
        </div>
      </div>
      <div class="hotword hidden-xs"><div class="container"><a href="http://www.scgoverseas.com/aboutscg.asp" target="_blank" >上海建工</a><a href="http://www.scgoverseas.com/news.asp?c=18" target="_blank" >洛杉矶留学公寓</a><a href="http://www.scgoverseas.com" target="_blank" >上海建工集团</a><a href="http://www.scgoverseas.com/news.asp?c=18" target="_blank" >UCLA公寓</a><a href="http://www.scgoverseas.com/news.asp?c=17" target="_blank" >海外置业</a><a href="http://www.scgoverseas.com/news.asp?c=18" target="_blank" >USC公寓</a><a href="http://www.scgoverseas.com/news.asp" target="_blank" >美国房产</a><a href="http://www.scgoverseas.com/" target="_blank" >美国房地产</a><a href="http://www.scgoverseas.com/housing.asp" target="_blank" >纽约房产</a><a href="http://www.scgoverseas.com/housing.asp" target="_blank" >洛杉矶房产</a><a href="http://www.scgoverseas.com/housingview.asp?id=3" target="_blank" >PERLA</a><a href="http://www.scgoverseas.com/housingview.asp?id=3" target="_blank" >PERLA公寓</a><a href="http://www.scgoverseas.com/news.asp?c=17" target="_blank" >洛杉矶学区房</a><a href="http://www.scgoverseas.com/housingview.asp?id=3" target="_blank" >洛杉矶perla公寓</a></div></div>
      <div style="background:#000;width:100%;display:none;"><div class="container" style="font-size:10px;color:#666;line-height:160%;padding:0 20px 15px 20px;">忠睿（上海）文化传播有限公司，专业服务于大型高端涉外客户，为客户提供最佳的美国地产投资解决方案。多年来，忠睿（上海）文化传播有限公司始终秉持“和谐为本，追求卓越”的服务宗旨，逐步发展形成了多元化的一站式服务体系。忠睿（上海）文化传播有限公司协助并服务于美国房产项目的宣传推广。</div></div>
      <div class="footer2">
      <ul class="fnav hidden-xs"><a href="aboutscg.asp" class="s_link2">关于公司</a><a href="housing.asp" class="s_link2">项目介绍</a><a href="services.asp" class="s_link2">服务咨询</a><a href="news.asp" class="s_link2">新闻资讯</a><a href="visit.asp" class="s_link2">联系我们</a><a href="#" class="s_link2">加入我们</a><a href="privacy.asp" class="s_link2">隐私政策</a><a href="#" class="s_link2">技术支持<div class="jszc">忠睿（上海）文化传播有限公司，专业服务于大型高端涉外客户，为客户提供最佳的美国地产投资解决方案。多年来，忠睿（上海）文化传播有限公司始终秉持“和谐为本，追求卓越”的服务宗旨，逐步发展形成了多元化的一站式服务体系。忠睿（上海）文化传播有限公司协助并服务于美国房产项目的宣传推广。</div></a><a href="sitemap.asp" class="s_link2">网站地图</a></ul>
      <div class="c clearfix"></div>
      <div class="fcopyright">Copyright © 2014-2018 SCG Overseas. All Rights Reserved. 上海建工海外地产中心版权所有  沪ICP备：16048257号-2</div></div>
      	 <!--悬浮客服-->

      	 <ul class="slidebar hidden-xs">
      	 <!--推广审核--><li class="pico pico-rbar1 hand">
      	 <span class="sbr-qr tra"><i class="r-arr-w"></i><img src="xgwl/img/qr.gif"></span>
</li>
      	 <li class="pico pico-rbar2 hand" onclick="window.location.href='tel:400-901-6788'"> <span class="sbr-400 tra"><i class="r-arr-b"></i>400-901-6788</span></li>
      	 <li onclick="feedback()" class="pico pico-rbar3 b_h"></li>
      	<!--推广审核--> <li class="pico pico-rbar4 b_h" onclick="window.open('http://weibo.com/u/5964312962')"></li>
</ul>
           <!--移动端悬浮客服-->
           
           <ul class="bslidebar hidden-lg hidden-md hidden-sm"><a href="tel:4009016788">400 901 6788</a><a href="javascript:feedback()" class="right">来访预约</a></ul>
      	 <!--在线咨询弹窗-->
      	 <div class="fbpop"><span class="popclose pico b_h pclose"></span>
      	 <form>
      	 <span class="tit">来访预约</span>
      	 <span class="txt">来访预约，在线提问，资深的行业专家第一时间为您解答。<br><br></span>
      	 <span class="hidden-xs">姓名：</span><input class="int vname" placeholder="Your name">
<span class="err"></span>
      	<span class="hidden-xs">电话：</span><input class="int vtel" placeholder="Your phone number">
           <span class="err"></span>
        <span class="hidden-xs">邮箱：</span><input class="int vmail" placeholder="Your e-mail address">
            <span class="err"></span>
         <span class="hidden-xs topline">问题：</span><textarea class="int2 vcontect"  placeholder="Message"></textarea>
          <span class="err"></span>
          <input type="hidden" class="hdid" >
          <div class="popbtn vbtn hand">提 交</div>
         <div class="t400"><a href="tel:400-901-6788"><img src="xgwl/img/400.png"></a></div>
         </form>
      	 </div>
      	 <div class="fbpopok"><span class="popclose pico b_h pclose"></span>
留言成功，我们将尽快和您联系。
<a href="#" class="fbpopokbtn">确认</a>
</div>
      	 <div class="mask"></div>
      	 <!--地图-->
      	 <div class="map2"><i class="popclose pico b_h pclose" onclick="hlpopclose()"></i><iframe src="map2.html" width="100%" height="100%" frameborder="0" scrolling="no">
                                                                     </iframe></div>
         <div class="map1"><i class="popclose pico b_h pclose" onclick="hlpopclose()"></i><iframe src="map3.html" width="100%" height="100%" frameborder="0" scrolling="no">
                                                                                                                                          </iframe></div>
</body>
<!--底部加载-->

<script src="xgwl/js/lib/jquery.js"></script>
<script src="xgwl/js/lib/bootstrap.min.js"></script>
<script src="xgwl/js/lib/wow.min.js"></script>
<script>
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};
</script>
<script src="xgwl/js/base.js"></script>
        <script src="ajax/vfeedback.js"></script>
        <script>
        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https') {
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else {
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
        </script>