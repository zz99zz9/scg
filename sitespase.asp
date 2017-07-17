<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!--  page start  -->
              <div class="row"><div class="col-md-6">
<% 	
 	Sub ShowSpaceInfo(drvpath)
 		dim fso,d,size,showsize
 		set fso=server.createobject("scripting.filesystemobject") 		
 		drvpath=server.mappath(drvpath) 		 		
 		set d=fso.getfolder(drvpath) 		
 		size=d.size
 		showsize=size & "&nbsp;Byte" 
 		if size>1024 then
 		   size=(size\1024)
 		   showsize=size & "&nbsp;KB"
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=size & "&nbsp;MB"		
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=size & "&nbsp;GB"	   
 		end if   
 		response.write "<font face=verdana>" & showsize & "</font>"
 	End Sub	
 	
 	Sub Showspecialspaceinfo(method)
 		dim fso,d,fc,f1,size,showsize,drvpath 		
 		set fso=server.createobject("scripting.filesystemobject")
 		drvpath=server.mappath("pic")
 		drvpath=left(drvpath,(instrrev(drvpath,"\")-1))
 		set d=fso.getfolder(drvpath) 		
 		
 		if method="All" then 		
 			size=d.size
 		elseif method="Program" then
 			set fc=d.Files
 			for each f1 in fc
 				size=size+f1.size
 			next	
 		end if	
 		
 		showsize=size & "&nbsp;Byte" 
 		if size>1024 then
 		   size=(size\1024)
 		   showsize=size & "&nbsp;KB"
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=size & "&nbsp;MB"		
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=size & "&nbsp;GB"	   
 		end if   
 		response.write "<font face=verdana>" & showsize & "</font>"
 	end sub 	 	 	
 	
 	Function Drawbar(drvpath)
 		dim fso,drvpathroot,d,size,totalsize,barsize
 		set fso=server.createobject("scripting.filesystemobject")
 		drvpathroot=server.mappath("pic")
 		drvpathroot=left(drvpathroot,(instrrev(drvpathroot,"\")-1))
 		set d=fso.getfolder(drvpathroot)
 		totalsize=d.size
 		
 		drvpath=server.mappath(drvpath) 		
 		set d=fso.getfolder(drvpath)
 		size=d.size
 		
 		barsize=cint((size/totalsize)*400)
 		Drawbar=barsize
 	End Function 	
 	
 	Function Drawspecialbar()
 		dim fso,drvpathroot,d,fc,f1,size,totalsize,barsize
 		set fso=server.createobject("scripting.filesystemobject")
 		drvpathroot=server.mappath("pic")
 		drvpathroot=left(drvpathroot,(instrrev(drvpathroot,"\")-1))
 		set d=fso.getfolder(drvpathroot)
 		totalsize=d.size
 		
 		set fc=d.files
 		for each f1 in fc
 			size=size+f1.size
 		next	
 		
 		barsize=cint((size/totalsize)*400)
 		Drawspecialbar=barsize
 	End Function 	
 %> 
  <%
 			fsorank=1
 			if fsorank=1 then
 			%> <br> <%Function GetPP
 				dim s
 				s=Request.ServerVariables("path_translated")
 				GetPP=left(s,instrrev(s,"\",len(s)))
 			End function
 			if sPP="" then sPP=GetPP
 			if right(sPP,1)<>"\" then sPP=sPP&"\"
 			set fso=server.createobject("scripting.filesystemobject")
 			Set f = fso.GetFolder(sPP)
 			Set fc = f.SubFolders
 			i=1
                        i2=1
 			For Each f in fc%> 目录<b><%=f.name%></b>占用空间：<%showSpaceinfo(""&f.name&"")%><div class="progress progress-striped active"  style="background-color:#fff;">
     <div class="progress-bar" style="width:<%=drawbar(""&f.name&"")/400*100%>%"><%=drawbar(""&f.name&"")/400*100%>%</div></div>
<%i=i+1
                          if i2<10 then
 			    i2=i2+1
                          else
                            i2=1
                          end if
 					Next%> 根目录文件占用空间：<%showSpecialSpaceinfo("Program")%><div class="progress progress-striped active" style="background-color:#fff;">
     <div class="progress-bar" style="width:<%=drawspecialbar/400*100%>%"><%=drawspecialbar/400*100%>%</div></div>
系统占用空间总计：<%showspecialspaceinfo("All")%> <div class="progress progress-striped active" style="background-color:#fff;">
     <div class="progress-bar" style="width:100%">100%</div></div> 
<%
 			else
 				response.write "<br><li>本功能已经被关闭"
 			end if
 			%> </div>
            </div>
              <!--  page end  -->
          </section>
      </section>
      <!--main content end-->
  </section>

<!--#include file="inc/windows.asp"-->
<!--#include file="inc/xgfooter.asp"-->
  <script type="text/javascript">
//导航菜单
$(".nav1").addClass('active');
$(".nav1-3").addClass('active');
</script>

