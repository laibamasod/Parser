
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     _FUNCTION_TOK = 258,
     _IDENTIFIER = 259,
     _NUMBER = 260,
     _BREAK = 261,
     _CALL = 262,
     _IF = 263,
     _ELSE = 264,
     _LET = 265,
     _READ = 266,
     _RETURN = 267,
     _WHILE = 268,
     _WRITE = 269,
     _O_BRACK = 270,
     _C_BRACK = 271,
     _O_BRACE = 272,
     _C_BRACE = 273,
     _SEMICOLON = 274,
     _EQUAL = 275,
     _COMMA = 276,
     _PLUS = 277,
     _MINUS = 278,
     _TIMES = 279,
     _DIVIDE = 280,
     _MODULUS = 281,
     _LESS = 282,
     _GREATER = 283,
     _LESSOREQUAL = 284,
     _GREATEROREQUAL = 285,
     _EQUALEQUAL = 286,
     _NOTEQUAL = 287,
     _AMPERSAND = 288,
     _BAR = 289,
     _TILDE = 290,
     _EXCLAMATION = 291,
     _LEXICALERROR = 292
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


