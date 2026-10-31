
        var clockID = 0;
        function UpdateClock() {
           if(clockID) {
              clearTimeout(clockID);
              clockID  = 0;}
           var tDate = new Date();
           var formateada="";
           if (tDate.getDate()<10) formateada=formateada+"0";
           formateada=formateada+tDate.getDate();
           formateada=formateada+"/"+(tDate.getMonth()+1);
           formateada=formateada+"/"+tDate.getFullYear()+"  ";
           if (tDate.getHours()<10) formateada=formateada+"0";
           formateada=formateada+tDate.getHours()+":";
           if (tDate.getMinutes()<10) formateada=formateada+"0";
           formateada=formateada+tDate.getMinutes()+":";
           if (tDate.getSeconds()<10) formateada=formateada+"0";
           formateada=formateada+tDate.getSeconds();

           document.getElementById("reloj").innerHTML=formateada;


           clockID = setTimeout("UpdateClock()", 1000);
        }

        //function StartClock() {
           clockID = setTimeout("UpdateClock()", 2000);
        //}

        function KillClock() {
           if(clockID) {
              clearTimeout(clockID);
              clockID  = 0;
           }
        }

		function mostrar(id){
			var e =document.getElementById(id);
			if (e!=null) e.style.display = 'block';
		}
		function ocultar(id){
			var e =document.getElementById(id);
			if (e!=null) e.style.display = 'none';
				
		}
		function visualizaImg(idContainer,idImg,imagen) {
			document.getElementById(idImg).src=imagen; 
  			mostrar(idContainer);			
  		}
		