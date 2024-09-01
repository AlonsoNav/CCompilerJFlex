package scanner;

import java.util.HashMap;
import java.util.Map;

%%
%public
%class CLexer
%unicode
%line
%column
%type Token

%{
private Map<String, Token> tokenTable = new HashMap<>();

private void addToken(String token, TokenType type) {
    Token tokenInfo = tokenTable.getOrDefault(token, new Token(token, type));
    tokenInfo.addOccurrence(yyline + 1);
    tokenTable.put(token, tokenInfo);
}

public Map<String, Token> getTokenTable() {
    return tokenTable;
}
%}

%%

/* Spaces */
[ \t\n\r]+                 { /* Ignore */ }

/* Comments */
"//".*                      { /* Ignore */ }
"/*"([^*]|\*+[^*/])*\*+"/"  { /* Ignore */ }

/* Literals */
[-+]?[1-9][0-9]*        { addToken(yytext(), TokenType.INTEGER_LITERAL); }
[-+]?0                  { addToken(yytext(), TokenType.INTEGER_LITERAL); }
0[xX][0-9a-fA-F]+       { addToken(yytext(), TokenType.HEX_LITERAL); } 
0[0-7]+                 { addToken(yytext(), TokenType.OCTAL_LITERAL); }
[-+]?[0-9]+\.[0-9]+            { addToken(yytext(), TokenType.DOUBLE_LITERAL); } 
"0\.[0-9]+"               { addToken(yytext(), TokenType.DOUBLE_LITERAL); } 
[-+]?[0-9]+\.[0-9]*[eE][+-]?[0-9]+ { addToken(yytext(), TokenType.DOUBLE_LITERAL); }
[-+]?[0-9]+[eE][+-]?[0-9]+     { addToken(yytext(), TokenType.DOUBLE_LITERAL); } 
\"([^\"\\]|\\.)*\"        { addToken(yytext(), TokenType.STRING_LITERAL); }
\'(\\.|[^\\'])\'        { addToken(yytext(), TokenType.CHAR_LITERAL); }
"#"[0-9]+                 { addToken(yytext(), TokenType.CHAR_LITERAL); }


/* Keywords */
"auto"                  { addToken(yytext(), TokenType.KEYWORD); }
"break"                 { addToken(yytext(), TokenType.KEYWORD); }
"case"                  { addToken(yytext(), TokenType.KEYWORD); }
"char"                  { addToken(yytext(), TokenType.KEYWORD); }
"const"                 { addToken(yytext(), TokenType.KEYWORD); }
"continue"              { addToken(yytext(), TokenType.KEYWORD); }
"default"               { addToken(yytext(), TokenType.KEYWORD); }
"do"                    { addToken(yytext(), TokenType.KEYWORD); }
"double"                { addToken(yytext(), TokenType.KEYWORD); }
"else"                  { addToken(yytext(), TokenType.KEYWORD); }
"enum"                  { addToken(yytext(), TokenType.KEYWORD); }
"extern"                { addToken(yytext(), TokenType.KEYWORD); }
"float"                 { addToken(yytext(), TokenType.KEYWORD); }
"for"                   { addToken(yytext(), TokenType.KEYWORD); }
"goto"                  { addToken(yytext(), TokenType.KEYWORD); }
"if"                    { addToken(yytext(), TokenType.KEYWORD); }
"int"                   { addToken(yytext(), TokenType.KEYWORD); }
"long"                  { addToken(yytext(), TokenType.KEYWORD); }
"register"              { addToken(yytext(), TokenType.KEYWORD); }
"return"                { addToken(yytext(), TokenType.KEYWORD); }
"short"                 { addToken(yytext(), TokenType.KEYWORD); }
"signed"                { addToken(yytext(), TokenType.KEYWORD); }
"sizeof"                { addToken(yytext(), TokenType.KEYWORD); }
"static"                { addToken(yytext(), TokenType.KEYWORD); }
"struct"                { addToken(yytext(), TokenType.KEYWORD); }
"switch"                { addToken(yytext(), TokenType.KEYWORD); }
"typedef"               { addToken(yytext(), TokenType.KEYWORD); }
"union"                 { addToken(yytext(), TokenType.KEYWORD); }
"unsigned"              { addToken(yytext(), TokenType.KEYWORD); }
"void"                  { addToken(yytext(), TokenType.KEYWORD); }
"volatile"              { addToken(yytext(), TokenType.KEYWORD); }
"while"                 { addToken(yytext(), TokenType.KEYWORD); }

/* Operators */
"<<="                   { addToken(yytext(), TokenType.OPERATOR); }
">>="                   { addToken(yytext(), TokenType.OPERATOR); }
"+="                    { addToken(yytext(), TokenType.OPERATOR); }
"-="                    { addToken(yytext(), TokenType.OPERATOR); }
"*="                    { addToken(yytext(), TokenType.OPERATOR); }
"/="                    { addToken(yytext(), TokenType.OPERATOR); }
"&"                     { addToken(yytext(), TokenType.OPERATOR); }
"^"                     { addToken(yytext(), TokenType.OPERATOR); }
"|"                     { addToken(yytext(), TokenType.OPERATOR); }
">>"                    { addToken(yytext(), TokenType.OPERATOR); }
"<<"                    { addToken(yytext(), TokenType.OPERATOR); }
"~"                     { addToken(yytext(), TokenType.OPERATOR); }
"%="                    { addToken(yytext(), TokenType.OPERATOR); }
"&="                    { addToken(yytext(), TokenType.OPERATOR); }
"^="                    { addToken(yytext(), TokenType.OPERATOR); }
"|="                    { addToken(yytext(), TokenType.OPERATOR); }
"->"                    { addToken(yytext(), TokenType.OPERATOR); }
"++"                    { addToken(yytext(), TokenType.OPERATOR); }
"--"                    { addToken(yytext(), TokenType.OPERATOR); }
"=="                    { addToken(yytext(), TokenType.OPERATOR); }
">="                    { addToken(yytext(), TokenType.OPERATOR); }
">"                     { addToken(yytext(), TokenType.OPERATOR); }
"?"                     { addToken(yytext(), TokenType.OPERATOR); }
"<="                    { addToken(yytext(), TokenType.OPERATOR); }
"<"                     { addToken(yytext(), TokenType.OPERATOR); }
"!="                    { addToken(yytext(), TokenType.OPERATOR); }
"||"                    { addToken(yytext(), TokenType.OPERATOR); }
"&&"                    { addToken(yytext(), TokenType.OPERATOR); }
"!"                     { addToken(yytext(), TokenType.OPERATOR); }
"="                     { addToken(yytext(), TokenType.OPERATOR); }
"+"                     { addToken(yytext(), TokenType.OPERATOR); }
"-"                     { addToken(yytext(), TokenType.OPERATOR); }
"*"                     { addToken(yytext(), TokenType.OPERATOR); }
"/"                     { addToken(yytext(), TokenType.OPERATOR); }
"%"                     { addToken(yytext(), TokenType.OPERATOR); }
"("                     { addToken(yytext(), TokenType.OPERATOR); }
")"                     { addToken(yytext(), TokenType.OPERATOR); }
"["                     { addToken(yytext(), TokenType.OPERATOR); }
"]"                     { addToken(yytext(), TokenType.OPERATOR); }
"{"                     { addToken(yytext(), TokenType.OPERATOR); }
"}"                     { addToken(yytext(), TokenType.OPERATOR); }
":"                     { addToken(yytext(), TokenType.OPERATOR); }
"."                     { addToken(yytext(), TokenType.OPERATOR); }
","                     { addToken(yytext(), TokenType.OPERATOR); }
";"                     { addToken(yytext(), TokenType.OPERATOR); }

/* Ids */
[a-zA-Z_][a-zA-Z0-9_]*  { addToken(yytext(), TokenType.ID); }

/* Errors */
.                       { System.err.println("Character unknown: " + yytext() + " in " + (yyline+1)); }