%{
#include <iostream>
using namespace std;

int yylex();
int yyparse();
extern FILE* yyin;
extern int line;
extern int lexerr;
void yyerror(const char *s) {
    cerr << "Parser error: " << s;
    if (lexerr) {
        cerr << " on line " << line << " (Lexical error)";
    } else {
        cerr << " on line " << line;
    }
    cerr << endl;
}

%}

%token _FUNCTION_TOK _IDENTIFIER _NUMBER _BREAK _CALL _IF _ELSE _LET _READ _RETURN _WHILE _WRITE
%token _O_BRACK _C_BRACK _O_BRACE _C_BRACE _SEMICOLON _EQUAL _COMMA
%token _PLUS _MINUS _TIMES _DIVIDE _MODULUS _LESS _GREATER _LESSOREQUAL _GREATEROREQUAL _EQUALEQUAL _NOTEQUAL
%token _AMPERSAND _BAR _TILDE _EXCLAMATION
%token _LEXICALERROR 
%token _INT _BOOL _VOID
%token <type> _INT _BOOL _VOID
%token <value> _NUMBER

%type <type> FUNCTION
%type <type> BLOCK
%type <type> STATEMENT
%type <type> IF_STATEMENT
%type <type> ELSE_STATEMENT
%type <type> LET_STATEMENT
%type <type> RETURN_STATEMENT
%type <type> EXPR


%start PROGRAM

%%

PROGRAM : FUNCTION_TIMES BLOCK
    ;

FUNCTION_TIMES :
    | FUNCTION FUNCTION_TIMES
    ;

FUNCTION :
    _FUNCTION_TOK _IDENTIFIER _O_BRACK PARAMLIST _C_BRACK
    ;

PARAMLIST :
    _IDENTIFIER PARAMREST
    |
    ;

PARAMREST :
    _COMMA _IDENTIFIER PARAMREST
    |
    ;

BLOCK :
    _O_BRACE STATEMENT_TIMES _C_BRACE
    ;

STATEMENT_TIMES :
    | STATEMENT STATEMENT_TIMES
    ;

STATEMENT :
    BREAK_STATEMENT
    | IF_STATEMENT
    | CALL_STATEMENT
    | LET_STATEMENT
    | READ_STATEMENT
    | WHILE_STATEMENT
    | WRITE_STATEMENT
    | RETURN_STATEMENT
    ;

BREAK_STATEMENT :
    _BREAK _SEMICOLON
    ;

CALL_STATEMENT :
    _CALL _IDENTIFIER _O_BRACK ARGLIST _C_BRACK 
    ;

ARGLIST :
    EXPR ARGREST
    |
    ;

ARGREST :
    _COMMA EXPR ARGREST
    |
    ;

IF_STATEMENT :
    _IF EXPR BLOCK ELSE_STATEMENT
    ;

ELSE_STATEMENT :
    _ELSE BLOCK | 
    ;

LET_STATEMENT :
    _LET _IDENTIFIER _EQUAL EXPR _SEMICOLON
    | _LET _IDENTIFIER _EQUAL CALL_STATEMENT _SEMICOLON
    ;

READ_STATEMENT :
    _READ _IDENTIFIER _SEMICOLON
    ;

RETURN_STATEMENT :
    _RETURN EXPR _SEMICOLON
    ;

WHILE_STATEMENT :
    _WHILE EXPR BLOCK
    ;

WRITE_STATEMENT :
    _WRITE EXPR _SEMICOLON
    ;

EXPR :
    _NUMBER
    | _IDENTIFIER
    | _O_BRACK EXPR _C_BRACK
    | _O_BRACK UNOP EXPR _C_BRACK
    | _O_BRACK BINOP EXPR EXPR _C_BRACK
    ;

BINOP :
    _PLUS | _MINUS | _TIMES | _DIVIDE | _MODULUS | _AMPERSAND | _BAR | _LESS | _GREATER | _LESSOREQUAL 
    | _GREATEROREQUAL | _EQUALEQUAL
    | _NOTEQUAL
    ;

UNOP :
    _TILDE | _EXCLAMATION
    ;

%%

int main(int argc, char* argv[]) {
    if (argc < 2) {
        cout << "Usage: " << argv[0] << " input_file" << endl;
        return 1;
    }

    FILE* file = fopen(argv[1], "r");
    if (!file) {
        cout << "Error: Unable to open file!" << endl;
        return 1;
    }

    yyin = file; // Set yyin to read from the opened file

    // Call yyparse to start lexing and parsing
    yyparse();

    fclose(file); // Close the file after reading

    return 0;
} 
