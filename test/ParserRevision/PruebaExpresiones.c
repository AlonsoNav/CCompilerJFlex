//Esta es una prueba para probar las expresiones que son aceptadas por el parser


int funcion1(int x){

/////Todas las siguientes expresiones son aceptadas,

x++;
x();
a = a * c;
x=2;
funcion1(3);      //se espera que acepte llamado a funciones
funcion1(3+x, 3)  ;  //tambien se pueden incluir cosas como estas como parametro y se aceptan

a =  2 % 3 / 345 ; //se aceptan combinaciones de expresiones
++x  // error por el punto y coma

a = a * c + 55 - funcion(8);

}

