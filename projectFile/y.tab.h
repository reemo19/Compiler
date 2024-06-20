#ifndef YYTOKENTYPE
# define YYTOKENTYPE

   enum yytokentype {
     NUM = 258,
     VAR = 259,
     IF = 260,
     ELSE = 261,
     WHILE = 262,
     FOR = 263,
	 INT = 264,
	 CPRINT = 265
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif
