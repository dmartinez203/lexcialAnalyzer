%{
#include <stdio.h>

/**
 * Helper function to print token information
 * @param tok The token type as a string
 * @param txt The actual text matched in the source
 */
static void emit(const char *tok, const char *txt)
{
    printf("%s(%s)\n", tok, txt);
}
%}

/* Tell flex we don't need yywrap function */
%option noyywrap

/* Character class definitions for readability */
DIGIT   [0-9]
ID      [A-Za-z_][A-Za-z0-9_]*

%%
"int"        { emit("TYPE_INT",  yytext); }
"char"       { emit("TYPE_CHAR", yytext); }
"return"     { emit("RETURN",    yytext); }
"read"       { emit("READ",      yytext); }
"write"      { emit("WRITE",     yytext); }
"writeln"    { emit("WRITELN",   yytext); }
"break"      { emit("BREAK",     yytext); }
"if"         { emit("IF",        yytext); }
"else"       { emit("ELSE",      yytext); }
"while"      { emit("WHILE",     yytext); }
"=="         { emit("EQ_OP",     yytext); }
"!="         { emit("NE_OP",     yytext); }
"<="         { emit("LE_OP",     yytext); }
">="         { emit("GE_OP",     yytext); }
"&&"         { emit("AND_OP",    yytext); }
"||"         { emit("OR_OP",     yytext); }
"+"          { emit("PLUS",      yytext); }
"-"          { emit("MINUS",     yytext); }
"*"          { emit("MUL",       yytext); }
"/"          { emit("DIV",       yytext); }
"="          { emit("ASSIGN",    yytext); }
"<"          { emit("LT",        yytext); }
">"          { emit("GT",        yytext); }
"!"          { emit("NOT",       yytext); }
";"          { emit("SEMI",      yytext); }
","          { emit("COMMA",     yytext); }
"("          { emit("LPAREN",    yytext); }
")"          { emit("RPAREN",    yytext); }
"{"          { emit("LBRACE",    yytext); }
"}"          { emit("RBRACE",    yytext); }
"["          { emit("LBRACKET",  yytext); }
"]"          { emit("RBRACKET",  yytext); }
{DIGIT}+     { emit("NUM",       yytext); }
{ID}         { emit("ID",        yytext); }
[ \t\r\n]+   { /* Skip whitespace */ }
"//".*       { /* Skip single-line comments */ }
.            { emit("UNKNOWN",   yytext); }
%%

/**
 * Main function to run the lexer
 */
int main(void)
{
    yylex();  /* Start the lexical analysis */
    return 0;
}