function CancelPaste(e)
{
  if (e.keyCode==86 || e.ctrlKey)   
     return false;
  else
     return true;
}
            
function ValidateNumbers(e) 
{
  document.oncontextmenu = function(){return false}  
  var key = (document.all)?e.keyCode:e.which;
  if (key==8) return true;
  patron = /\d/;
  te = String.fromCharCode(key);
  return patron.test(te);
}

function OnlyLetters (e)
{
  var key = (document.all) ? e.keyCode : e.which; 
  if (key==8) return true; 
  patron =/[A-Za-z\s]/;
  te = String.fromCharCode(key); 
  return patron.test(te);
}

function CleanScreen(oForm) {
	frm = document.getElementById(oForm);
	for(i=0; i<frm.elements.length; i++){
		if (frm.elements[i].type == 'text')
		{
			frm.elements[i].value = '';			
		}		
	}
	
}