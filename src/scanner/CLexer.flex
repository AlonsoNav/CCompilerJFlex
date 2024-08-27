package scanner;

%%
%public
%class CLexer
%unicode
%line
%column
%type Tokens

%%

[ \t\n\r]+                 { /* Ignore */ }

/* Keywords */
"auto"                  { return Tokens.KEYWORDS; }
"break"                 { return Tokens.KEYWORDS; }
"case"                  { return Tokens.KEYWORDS; }
"char"                  { return Tokens.KEYWORDS; }
"const"                 { return Tokens.KEYWORDS; }
"continue"              { return Tokens.KEYWORDS; }
"default"               { return Tokens.KEYWORDS; }
"do"                    { return Tokens.KEYWORDS; }
"double"                { return Tokens.KEYWORDS; }
"else"                  { return Tokens.KEYWORDS; }
"enum"                  { return Tokens.KEYWORDS; }
"extern"                { return Tokens.KEYWORDS; }
"float"                 { return Tokens.KEYWORDS; }
"for"                   { return Tokens.KEYWORDS; }
"goto"                  { return Tokens.KEYWORDS; }
"if"                    { return Tokens.KEYWORDS; }
"int"                   { return Tokens.KEYWORDS; }
"long"                  { return Tokens.KEYWORDS; }
"register"              { return Tokens.KEYWORDS; }
"return"                { return Tokens.KEYWORDS; }
"short"                 { return Tokens.KEYWORDS; }
"signed"                { return Tokens.KEYWORDS; }
"sizeof"                { return Tokens.KEYWORDS; }
"static"                { return Tokens.KEYWORDS; }
"struct"                { return Tokens.KEYWORDS; }
"switch"                { return Tokens.KEYWORDS; }
"typedef"               { return Tokens.KEYWORDS; }
"union"                 { return Tokens.KEYWORDS; }
"unsigned"              { return Tokens.KEYWORDS; }
"void"                  { return Tokens.KEYWORDS; }
"volatile"              { return Tokens.KEYWORDS; }
"while"                 { return Tokens.KEYWORDS; }

[a-zA-Z_][a-zA-Z0-9_]*     { return Tokens.ID; }

[0-9]+                     { return Tokens.NUM; }

/* Operadores */

","                     { return Tokens.OPERATOR; }
";"                     { return Tokens.OPERATOR; }
"++"                    { return Tokens.OPERATOR; }
"--"                    { return Tokens.OPERATOR; }
"=="                    { return Tokens.OPERATOR; }
">="                    { return Tokens.OPERATOR; }
">"                     { return Tokens.OPERATOR; }
"?"                     { return Tokens.OPERATOR; }
"<="                    { return Tokens.OPERATOR; }
"<"                     { return Tokens.OPERATOR; }
"!="                    { return Tokens.OPERATOR; }
"||"                    { return Tokens.OPERATOR; }
"&&"                    { return Tokens.OPERATOR; }
"!"                     { return Tokens.OPERATOR; }
"="                     { return Tokens.OPERATOR; }
"+"                     { return Tokens.OPERATOR; }
"-"                     { return Tokens.OPERATOR; }
"*"                     { return Tokens.OPERATOR; }
"/"                     { return Tokens.OPERATOR; }
"%"                     { return Tokens.OPERATOR; }
"("                     { return Tokens.OPERATOR; }
")"                     { return Tokens.OPERATOR; }
"["                     { return Tokens.OPERATOR; }
"]"                     { return Tokens.OPERATOR; }
"{"                     { return Tokens.OPERATOR; }
"}"                     { return Tokens.OPERATOR; }
":"                     { return Tokens.OPERATOR; }
"."                     { return Tokens.OPERATOR; }
"+="                    { return Tokens.OPERATOR; }
"-="                    { return Tokens.OPERATOR; }
"*="                    { return Tokens.OPERATOR; }
"/="                    { return Tokens.OPERATOR; }
"&"                     { return Tokens.OPERATOR; }
"^"                     { return Tokens.OPERATOR; }
"|"                     { return Tokens.OPERATOR; }
">>"                    { return Tokens.OPERATOR; }
"<<"                    { return Tokens.OPERATOR; }
"~"                     { return Tokens.OPERATOR; }
"%="                    { return Tokens.OPERATOR; }
"&="                    { return Tokens.OPERATOR; }
"^="                    { return Tokens.OPERATOR; }
"|="                    { return Tokens.OPERATOR; }
"<<="                   { return Tokens.OPERATOR; }
">>="                   { return Tokens.OPERATOR; }
"->"                    { return Tokens.OPERATOR; }


"//".*                     { /* Ignore */ }
"/*"([^*]|\*+[^*/])*\*+"/"  { /* Ignore */ }

.                          { System.err.println("Caracter no reconocido: " + yytext()); }