//Abre una ventana popup con el toolbar habilitado para imprimir desde el navegador
function popup(pag_imprimir)
{
        popup(pag_imprimir,640,520);
}

function popup(pag_imprimir,ancho,alto)
{
	window.open(pag_imprimir,'Impresion','toolbar=yes,location=no,directories=no,status=no, menubar=no,scrollbars=yes,resizable=no,width=' + ancho + ',height=' + alto);
}

function popupvacio(url)
{
       popupvacio(url,300,340);
}

function popupvacio(url,ancho,alto)
{
	window.open(url,"valida","width="+ancho+", height="+alto+",toolbar=no,location=no, status=no, menubar=no, scrollbars=no,resizable=no");
}

//Comprueba si una direccion de correo es valida
function compr_cc(cc){
	var posarroba,pospunto
  if (cc=="" || cc.indexOf("@")==(-1)) return(false);
  posarroba=cc.indexOf("@");
  pospunto=cc.indexOf(".");
  if ((posarroba==(pospunto-1)) ||(pospunto==-1)) return(false);
  if (pospunto!=-1 && pospunto==cc.length-1) return(false);
  return(true);
}