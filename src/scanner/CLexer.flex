package scanner;

import java.util.HashMap;
import java.util.Map;
import java_cup.runtime.Symbol; // Importa la clase Symbol
import parser.Sym; // Importa los símbolos generados por CUP

%%
// Define la clase CLexer
%public
%class CLexer
%implements java_cup.runtime.Scanner
%unicode
%line
%type Symbol

%{
private Map<String, Token> tokenTable = new HashMap<>();
private int currentLine = 1;
private StringBuilder lineTokens = new StringBuilder();

// Implementa la interfaz Scanner de CUP
@Override
public Symbol next_token() throws java.io.IOException {
    Symbol symbol = yylex();
    return symbol;
}

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
[ \t\n\r]+                  { /* Ignore */ }

/* Comments */
"//".*                      { /* Ignore */ }
"/*"([^*]|\*+[^*/])*\*+"/"  { /* Ignore */ }
"/*"([^*\n]|\*+[^*/\n])*\n      { System.out.println("Block comment without closure: " + yytext() + " in " + (yyline + 1)); }

\"([^\"\\\n]|\\.)*          { System.out.println("String without closure " + yytext() + " in " + (yyline + 1)); }

/* Literals */
[-+]?(0|[1-9][0-9]*)[uU]?[lL]?[lL]?             { addToken(yytext(), TokenType.LITERAL_INT); return new Symbol(Sym.NUMBER, yyline + 1, yycolumn, Integer.valueOf(yytext())); }
0[xX][0-9a-fA-F]+[uU]?[lL]?[lL]?                { addToken(yytext(), TokenType.LITERAL_HEX); return new Symbol(Sym.HEX_LITERAL, yyline + 1, yycolumn, yytext()); }
0[0-7]+[uU]?[lL]?[lL]?                          { addToken(yytext(), TokenType.LITERAL_OCTAL); return new Symbol(Sym.OCTAL_LITERAL, yyline + 1, yycolumn, yytext()); }
0[bB][01]+[uU]?[lL]?[lL]?                       { addToken(yytext(), TokenType.LITERAL_BINARY); return new Symbol(Sym.BINARY_LITERAL, yyline + 1, yycolumn, yytext()); }
[-+]?[0-9]+\.[0-9]+[fF]?[lL]?                   { addToken(yytext(), TokenType.LITERAL_DOUBLE); return new Symbol(Sym.DOUBLE_LITERAL, yyline + 1, yycolumn, yytext()); }
[-+]?[0-9]+\.[0-9]*[eE][+-]?[0-9]+[fF]?[lL]?    { addToken(yytext(), TokenType.LITERAL_DOUBLE); return new Symbol(Sym.DOUBLE_LITERAL, yyline + 1, yycolumn, yytext()); }
[-+]?[0-9]+[eE][+-]?[0-9]+[fF]?[lL]?            { addToken(yytext(), TokenType.LITERAL_DOUBLE); return new Symbol(Sym.DOUBLE_LITERAL, yyline + 1, yycolumn, yytext()); }
\"([^\"\\\n]|\\.)*\"                            { addToken(yytext(), TokenType.LITERAL_STR); return new Symbol(Sym.STRING_LITERAL, yyline + 1, yycolumn, yytext()); }
\'(\\.|[^\\'])\'                                { addToken(yytext(), TokenType.LITERAL_CHAR); return new Symbol(Sym.CHAR_LITERAL, yyline + 1, yycolumn, yytext()); }
"#"[0-9]+                                       { addToken(yytext(), TokenType.LITERAL_CHAR); return new Symbol(Sym.CHAR_LITERAL, yyline + 1, yycolumn, yytext()); }

/* Defined errors */
[0-9]+[a-zA-Z_][a-zA-Z0-9_]*        { System.out.println("Digit before id: " + yytext() + " in " + (yyline+1)); }
\"([^\"\\\n]|\\.)*\n.*\"            { System.out.println("Strings cannot span multiple lines: " + yytext() + " in " + (yyline+1)); }
[-+]?[0-9]+(\.[0-9]+)*\.+[0-9]+     { System.out.println("Invalid number format: " + yytext() + " in " + (yyline + 1)); }
\.[0-9]+                            { System.out.println("Invalid number format: " + yytext() + " in " + (yyline + 1)); }

/* Keywords */
"auto"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.AUTO, yyline + 1, yycolumn, yytext()); }
"break"                 { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.BREAK, yyline + 1, yycolumn, yytext()); }
"case"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.CASE, yyline + 1, yycolumn, yytext()); }
"char"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.CHAR, yyline + 1, yycolumn, yytext()); }
"const"                 { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.CONST, yyline + 1, yycolumn, yytext()); }
"continue"              { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.CONTINUE, yyline + 1, yycolumn, yytext()); }
"default"               { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.DEFAULT, yyline + 1, yycolumn, yytext()); }
"do"                    { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.DO, yyline + 1, yycolumn, yytext()); }
"double"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.DOUBLE, yyline + 1, yycolumn, yytext()); }
"else"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.ELSE, yyline + 1, yycolumn, yytext()); }
"enum"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.ENUM, yyline + 1, yycolumn, yytext()); }
"extern"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.EXTERN, yyline + 1, yycolumn, yytext()); }
"float"                 { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.FLOAT, yyline + 1, yycolumn, yytext()); }
"for"                   { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.FOR, yyline + 1, yycolumn, yytext()); }
"goto"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.GOTO, yyline + 1, yycolumn, yytext()); }
"if"                    { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.IF, yyline + 1, yycolumn, yytext()); }
"int"                   { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.INT, yyline + 1, yycolumn, yytext()); }
"long"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.LONG, yyline + 1, yycolumn, yytext()); }
"register"              { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.REGISTER, yyline + 1, yycolumn, yytext()); }
"return"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.RETURN, yyline + 1, yycolumn, yytext()); }
"short"                 { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.SHORT, yyline + 1, yycolumn, yytext()); }
"signed"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.SIGNED, yyline + 1, yycolumn, yytext()); }
"sizeof"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.SIZEOF, yyline + 1, yycolumn, yytext()); }
"static"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.STATIC, yyline + 1, yycolumn, yytext()); }
"struct"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.STRUCT, yyline + 1, yycolumn, yytext()); }
"switch"                { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.SWITCH, yyline + 1, yycolumn, yytext()); }
"typedef"               { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.TYPEDEF, yyline + 1, yycolumn, yytext()); }
"union"                 { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.UNION, yyline + 1, yycolumn, yytext()); }
"unsigned"              { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.UNSIGNED, yyline + 1, yycolumn, yytext()); }
"void"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.VOID, yyline + 1, yycolumn, yytext()); }
"volatile"              { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.VOLATILE, yyline + 1, yycolumn, yytext()); }
"while"                 { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.WHILE, yyline + 1, yycolumn, yytext()); }
"read"                  { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.READ, yyline + 1, yycolumn, yytext()); }
"write"                 { addToken(yytext(), TokenType.KEYWORD); return new Symbol(Sym.WRITE, yyline + 1, yycolumn, yytext()); }


/* Operators */
"<<="                   { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.LSHIFT_ASSIGN, yyline + 1, yycolumn, yytext()); }
">>="                   { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.RSHIFT_ASSIGN, yyline + 1, yycolumn, yytext()); }
"+="                    { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.PLUS_ASSIGN, yyline + 1, yycolumn, yytext()); }
"-="                    { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.MINUS_ASSIGN, yyline + 1, yycolumn, yytext()); }
"*="                    { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.TIMES_ASSIGN, yyline + 1, yycolumn, yytext()); }
"/="                    { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.DIV_ASSIGN, yyline + 1, yycolumn, yytext()); }
"&"                     { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.BIT_AND, yyline + 1, yycolumn, yytext()); }
"^"                     { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.BIT_XOR, yyline + 1, yycolumn, yytext()); }
"|"                     { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.BIT_OR, yyline + 1, yycolumn, yytext()); }
">>"                    { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.RSHIFT, yyline + 1, yycolumn, yytext()); }
"<<"                    { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.LSHIFT, yyline + 1, yycolumn, yytext()); }
"~"                     { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.BIT_NOT, yyline + 1, yycolumn, yytext()); }
"%="                    { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.MOD_ASSIGN, yyline + 1, yycolumn, yytext()); }
"&="                    { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.BIT_AND_ASSIGN, yyline + 1, yycolumn, yytext()); }
"^="                    { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.BIT_XOR_ASSIGN, yyline + 1, yycolumn, yytext()); }
"|="                    { addToken(yytext(), TokenType.OPERATOR_BITWISE); return new Symbol(Sym.BIT_OR_ASSIGN, yyline + 1, yycolumn, yytext()); }
"->"                    { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.PTR_OP, yyline + 1, yycolumn, yytext()); }
"++"                    { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.INC_OP, yyline + 1, yycolumn, yytext()); }
"--"                    { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.DEC_OP, yyline + 1, yycolumn, yytext()); }
"=="                    { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.EQ_OP, yyline + 1, yycolumn, yytext()); }
">="                    { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.GE_OP, yyline + 1, yycolumn, yytext()); }
">"                     { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.GT_OP, yyline + 1, yycolumn, yytext()); }
"?"                     { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.QUESTION, yyline + 1, yycolumn, yytext()); }
"<="                    { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.LE_OP, yyline + 1, yycolumn, yytext()); }
"<"                     { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.LT_OP, yyline + 1, yycolumn, yytext()); }
"!="                    { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.NE_OP, yyline + 1, yycolumn, yytext()); }
"||"                    { addToken(yytext(), TokenType.OPERATOR_LOGICAL); return new Symbol(Sym.OR_OP, yyline + 1, yycolumn, yytext()); }
"&&"                    { addToken(yytext(), TokenType.OPERATOR_LOGICAL); return new Symbol(Sym.AND_OP, yyline + 1, yycolumn, yytext()); }
"!"                     { addToken(yytext(), TokenType.OPERATOR_LOGICAL); return new Symbol(Sym.NOT_OP, yyline + 1, yycolumn, yytext()); }
"="                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.ASSIGN, yyline + 1, yycolumn, yytext()); }
"+"                     { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.PLUS, yyline + 1, yycolumn, yytext()); }
"-"                     { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.MINUS, yyline + 1, yycolumn, yytext()); }
"*"                     { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.TIMES, yyline + 1, yycolumn, yytext()); }
"/"                     { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.DIVIDE, yyline + 1, yycolumn, yytext()); }
"%"                     { addToken(yytext(), TokenType.OPERATOR_ARITHMETIC); return new Symbol(Sym.MOD, yyline + 1, yycolumn, yytext()); }
"("                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.LPAREN, yyline + 1, yycolumn, yytext()); }
")"                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.RPAREN, yyline + 1, yycolumn, yytext()); }
"["                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.LBRACKET, yyline + 1, yycolumn, yytext()); }
"]"                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.RBRACKET, yyline + 1, yycolumn, yytext()); }
"{"                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.LCURLY, yyline + 1, yycolumn, yytext()); }
"}"                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.RCURLY, yyline + 1, yycolumn, yytext()); }
":"                     { addToken(yytext(), TokenType.OPERATOR_RELATIONAL); return new Symbol(Sym.COLON, yyline + 1, yycolumn, yytext()); }
"."                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.DOT, yyline + 1, yycolumn, yytext()); }
","                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.COMMA, yyline + 1, yycolumn, yytext()); }
";"                     { addToken(yytext(), TokenType.OPERATOR); return new Symbol(Sym.SEMICOLON, yyline + 1, yycolumn, yytext()); }

/* Ids */
[a-zA-Z_][a-zA-Z0-9_]*  { addToken(yytext(), TokenType.ID); return new Symbol(Sym.IDENTIFIER, yyline + 1, yycolumn, yytext()); }

/* Errors */
.                       { System.out.println("Character unknown: " + yytext() + " in " + (yyline+1)); }
