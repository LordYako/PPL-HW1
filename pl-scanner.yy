%{ 

#Blake Robertson 113298232
#Noah Brown 113432834

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}



%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [a-zA-Z]
ALPHAL [a-z]

%%





\/\/.*$   
[ \t]+						
[\n]+							


"integer"							  { 
										return K_INTEGER; 
                  }
"float"							  { 
										return K_FLOAT; 
                  }
"foreach"							  { 
										return K_FOREACH; 
                  }
"begin"							  { 
										return K_BEGIN; 
                  }
"end"							  { 
										return K_END; 
                  }
"repeat"							  { 
										return K_REPEAT; 
                  }
"until"							  { 
										return K_UNTIL; 
                  }
"while"							  { 
										return K_WHILE; 
                  }
"declare"							  { 
										return K_DECLARE; 
                  }
"if"							  { 
										return K_IF; 
                  }
"then"							  { 
										return K_THEN; 
                  }
"print"							  { 
										return K_PRINT; 
                  }


";"							  { 
										return ';'; 
                  }

"="							  { 
										return OP_ASSIGN; 
                  }
"+"							  { 
										return OP_ADD; 
                  }
"-"							  { 
										return OP_SUB; 
                  }
"*"							  { 
										return OP_MUL; 
                  }
"/"							  { 
										return OP_DIV; 
                  }
"<="							  { 
										return OP_LEQ; 
                  }
">="							  { 
										return OP_GEQ; 
                  }
"=="							  { 
										return OP_EQ; 
                  }
"!="							  { 
										return OP_DIFF; 
                  }
"<"							  { 
										return OP_LT; 
                  }
">"							  { 
										return OP_GT; 
                  }


"main"					{ 
										return K_MAIN; 
                  }


{DIGIT}+					{ 
										return L_INTEGER;
									}

({ALPHAL}|"_")({ALPHAL}|"_"|{DIGIT})({ALPHAL}|"_"|{DIGIT})+        { 
									return T_ID;
							  }

({DIGIT}|"+"|"-")({DIGIT}+)(".")({DIGIT}+)					{ 
										return L_FLOAT; 
                  }

<<EOF>>						{ return T_EOF ; }
.									{ printf ("Unexpected character\n"); exit (1); }





%%
