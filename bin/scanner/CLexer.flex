package scanner;

%%
%public
%class CLexer
%unicode
%column
%type Tokens

%%

// Reglas léxicas
// Ignorar espacios en blanco
[ \t\n\r]+                 { /* Ignorar espacios en blanco */ }

// Identificadores y palabras clave
"int"                      { return Tokens.INT; }
"float"                    { return Tokens.FLOAT; }
"if"                       { return Tokens.IF; }
"else"                     { return Tokens.ELSE; }
[a-zA-Z_][a-zA-Z0-9_]*     { return Tokens.ID; }

// Literales
[0-9]+                     { return Tokens.NUM; }

// Operadores
"+"                        { return Tokens.PLUS; }
"-"                        { return Tokens.MINUS; }
"*"                        { return Tokens.MULT; }
"/"                        { return Tokens.DIV; }

// Delimitadores
"("                        { return Tokens.LPAREN; }
")"                        { return Tokens.RPAREN; }
"{"                        { return Tokens.LBRACE; }
"}"                        { return Tokens.RBRACE; }
";"                        { return Tokens.SEMICOLON; }

// Comentarios
"//".*                     { /* Ignorar comentarios de una línea */ }
"/*"([^*]|\*+[^*/])*\*+"/"  { /* Ignorar comentarios de varias líneas */ }

// Caracteres no reconocidos
.                          { System.err.println("Caracter no reconocido: " + yytext()); }

