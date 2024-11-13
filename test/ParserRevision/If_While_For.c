//Esta es una prueba para verificar las estructuras de control

//if-else, while, for

int x;                         

int funcion1(){

	if () {   //deberia dar error, pues debe haber una expresion
		x= a+b;
	} else {
		x= a+b;
	}
        

	if (x==2) {
		x= a+b;
	} else {
		x--;
	}  
        

	if if (X < 3) { //deberia dar error por doble if
		x= a+b;
	} else {
		x= a+b;
	} 
        

	if (y>=0) {
		x= a+b; 
	}else {
		x--; 
	}else { //deberia dar error por doble uso de else
		y = x;
	} 
        

	if x==3 { //deberia dar error por expresion fuera de parentesis
		x= a+b;
	} else {
		x--;
	} 
       
	if (x==4){ //deberia aceptar if anidados y cualquier tipo de expresion dentro de ( )        
		if (x<= 7){			
			x= a+b;				
		} else {
			x--;
		}
	}else{ 
		x= a+b;
	}

	for ( ) { //deberia dar error pues no hay expresiones en parentesis
		x= a+b;
	}  
       
	for (x=0;  ) { //error pues hay solamente una expresion
		x= a+b;
	}  

	for  { //error 
		x= a+b;
	}

	for (x=1;x<2;x++){
		x= a+b; 
		break;
	}

        
	while ( ){  //debe dar error
		y = a +c;
	} 
        

	while (x != 1) {
		x= a+b;
	}  // aceptarlo correctamente
        

	while ((!f)||(x<2)) { 

		x= a+b; 
		x--; 
		continue; 
		break;
	}  //aceptarlo correctamente, el continue y el break
        


} // el del fin de la funcion
