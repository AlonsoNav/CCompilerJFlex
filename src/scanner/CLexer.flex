package scanner;

%%
%public
%class CLexer
%unicode
%column
%type Tokens

%%

[ \t\n\r]+                 { /* Ignore */ }

"int"                      { return Tokens.INT; }
"float"                    { return Tokens.FLOAT; }
"if"                       { return Tokens.IF; }
"else"                     { return Tokens.ELSE; }
[a-zA-Z_][a-zA-Z0-9_]*     { return Tokens.ID; }

[0-9]+                     { return Tokens.NUM; }

"+"                        { return Tokens.PLUS; }
"-"                        { return Tokens.MINUS; }
"*"                        { return Tokens.MULT; }
"/"                        { return Tokens.DIV; }

"("                        { return Tokens.LPAREN; }
")"                        { return Tokens.RPAREN; }
"{"                        { return Tokens.LBRACE; }
"}"                        { return Tokens.RBRACE; }
";"                        { return Tokens.SEMICOLON; }

"//".*                     { /* Ignore */ }
"/*"([^*]|\*+[^*/])*\*+"/"  { /* Ignore */ }

.                          { System.err.println("Caracter no reconocido: " + yytext()); }