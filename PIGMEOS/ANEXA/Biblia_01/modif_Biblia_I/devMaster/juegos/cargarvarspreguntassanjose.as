// Modificado del original

System.useCodepage = true;
fscommand("");

// -------------- PROTOTYPE REPLACE ------------

String.prototype.replace = function() 
{
	var arg_search, arg_replace, position; 
	var endText, preText, newText; 
	arg_search = arguments[0];
	arg_replace = arguments[1];
	if(arg_search.length==1) return this.split(arg_search).join(arg_replace);
	position = this.indexOf(arg_search); 
	if(position == -1) return this; 
	endText = this; 
	do{ 
	
		position = endText.indexOf(arg_search); 
		preText = endText.substring(0, position) 
		endText = endText.substring(position + arg_search.length) 
		newText += preText + arg_replace; 
		
	} while(endText.indexOf(arg_search) != -1)
	
	newText += endText; 

	return newText; 
} 

// ----------------------------------------------


url = _url.replace('\\','/') ;
dir = url.substr(0, url.lastIndexOf('/')+1);

//rescato el nombre del archivo swf, le incluyo un numero al inicio y le quito .swf
///archivo=cualtitulo+ url.slice(url.lastIndexOf('/')+1,url.lastIndexOf('.'));

/// de omei - archivo="../../../bd/TextosBreves/aki el titulo"


	archivo="preguntas_sanjose";

///archivo=numerito+ "_"+ url.slice(url.lastIndexOf('/')+1,url.lastIndexOf('.'));
url=dir+archivo;

//
salida="dir :"+dir+newline+" url: "+ url;
//nnn=archivo
//

vars = variables;

if (typeof (vars) == "undefined") {
	vars = url+ ".txt";
	
} else {
	vars = dir+vars;
}


var cargadorVars = new LoadVars();

cargadorVars.onLoad = function(correcto) {
	if (correcto)	
		for(var v in this)
		{
			if (!isNaN(this[v]))
				set(v,parseFloat(this[v]));
			else
				set(v,this[v]);
		}
	////nextFrame();
}
cargadorVars.load(vars);
