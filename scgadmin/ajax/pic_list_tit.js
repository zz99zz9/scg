// JavaScript Document
function pro_info(v){
	$.post("ajax/pic_list_tit.asp",{pid:v},
	  
    function(data,status){
	  if(status=="success"){
	//	  console.log(data);
		   if(data=="add"){

		  location.href='Pro_List.Asp?sta=add'
		  }else if(data=="mod"){

			  location.href='Pro_List.Asp?sta=mod'
			  }else if(data=="del"){

			  location.href='Pro_List.Asp?sta=del'
		  }
		/* */

		  }
    });
}

