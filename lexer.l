%{

#include <iostream>
#include <cstdio>
#include "parser.tab.h"
using namespace std;

int line = 1;
int lexerr = 0;
%}

DIGIT   [0-9]
LETTER  ([a-zA-Z])
KEYWORDS (if|else|while|break|read|write|function|let|call|return)

%%

"#".*        {/* Ignoring comments */}
" "*
"\t"*
"\r"*
"\n"          { line++ ; }
"+"           { return _PLUS ; }
"-"           { return _MINUS ; }
"*"           { return _TIMES ; }
"%"           { return _MODULUS ; }
"/"           { return _DIVIDE ; }
"="           { return _EQUAL ; }
"=="          { return _EQUALEQUAL ; }
"!="          { return _NOTEQUAL ; }
"<"           { return _LESS ; }
"<="          { return _LESSOREQUAL ; }
">"           { return _GREATER ; }
">="          { return _GREATEROREQUAL ; }
"("           { return _O_BRACK ; }
")"           { return _C_BRACK ; }
"{"           { return _O_BRACE ; }
"}"           { return _C_BRACE ; }
"~"           { return _TILDE ; }
"|"           { return _BAR ; }
"&"           { return _AMPERSAND ; }
"!"           { return _EXCLAMATION ; }
"if"          { return _IF ; }
"else"        { return _ELSE ; }
"break"       { return _BREAK ; }
"call"        { return _CALL ; }
"return"      { return _RETURN ; }
"read"        { return _READ ; }
"write"       { return _WRITE ; }
","           { return _COMMA ; }
";"           { return _SEMICOLON ; }
"while"       { return _WHILE ; }
"function"    { return _FUNCTION_TOK ; }
"let"         { return _LET ; }
{DIGIT}+      { return _NUMBER ; }
"int"         { return _INT; }
"bool"        { return _BOOL; }
"void"        { return _VOID; }

{LETTER}({LETTER}|{DIGIT}|_)*    { return _IDENTIFIER; } 
.           { lexerr = 1; return _LEXICALERROR; }

%%
int yywrap() {
    return 1; // Indicates the end of input
}
