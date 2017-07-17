// JavaScript Document
$("#alert .close").click(function(){
	$("#alert").fadeOut();
});


function ConfirmDel()
{
   if(confirm("确定要删除吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
}