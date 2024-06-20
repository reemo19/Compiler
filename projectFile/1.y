
%{
	#include<stdio.h>
	int sym[1000];
	int t1=0;
	void yyerror(char *);
	int yylex(void);
	extern FILE * yyin;
extern FILE * yyout;
FILE * yyError;
%}


%token  NUM VAR IF ELSE WHILE FOR INT CPRINT
%nonassoc IFX
%nonassoc ELSE 
%left '<' '>' '=='
%left '+' '-'
%left '*' '/'

%%

program: 
	| program statement        
	;



statement  :  

     expression ';'      
     /* | CPRINT '(' '"' expression '"' ')'   ';'  { fprintf(yyout,"\nvalue of expression in print: %s\n",$4) ;} */ /*strin */
        | CPRINT '(' expression ')'   ';'  { fprintf(yyout,"\nValue of your print is : %d\n",$3); 
						fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-Print-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
					   } 
    
        | VAR '=' expression ';'{ 
				   sym[$1] = $3; 
			        }

        |INT VAR '=' expression  ';'    { 
						sym[$2] = $4;
                                        }

	|INT VAR ';'                   { $$=sym[$2];} 
	
	|FOR '(' expression ';' expression ';' expression ')' '{' statement '}'       
						{
	                                          int i;
	                                          for(i=$3;i<t1;i++) {      
									fprintf(yyout,"\nHello from for { loop } \n");
								     }
							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-For-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
					        }	
	|FOR '(' expression ';' expression ';' expression ')' CPRINT '(' expression ')' ';' 
					 {
	                                          int i;								
	                                      for(i=$3;i<t1;i++) { 
                                                     
								    fprintf(yyout,"\nHello from for loop %d : %d\n",++$3,$11);
								  }
							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-For-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
					 }		
	|FOR '(' expression ';' expression ';' expression ')' '{' CPRINT '(' expression ')' ';' '}'      
					 {
	                                          int i;								
	                                      for(i=$3;i<t1;i++) { 
                                                     
								    fprintf(yyout,"\nHello from for { loop } %d : %d\n",++$3,$12);
								  }
							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-For-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
					 }	
        |WHILE '(' expression ')' '{' statement '}'
	 
	                    {
                            fprintf(yyout,"\nwhile Loop\n");
							while($3--) {	
							fprintf(yyout,"Hello from { while }\n");
							            }
				fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-While-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");		
			    }
        |WHILE '(' expression ')' '{' CPRINT '(' expression ')'   ';' '}'    /*WHILE PRINT*/
	 
	                    {
                              fprintf(yyout,"\nwhile Loop\n");
							while($3--) {	
							fprintf(yyout," While Loop %d:%d\n",$3+1,$8);
						
							            }
				fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-While-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");		
			    }
	| IF '(' expression ')' expression ';'   {
								if($3)
								{
									fprintf(yyout,"\nHello from IF \n");
								}
								else
								{
							     	fprintf(yyout,"Uncorrect condition in IF\n");
								}
							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-IF-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
							  }

	| IF '(' expression ')' expression ';' ELSE expression ';'  {
								 	if($3)
									
										fprintf(yyout,"\nHello from True_IF_Else ,we in IF\n");
									
									else
									
										fprintf(yyout,"\nHello from IF_True_Else ,we in Else \n");
									

							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-IF-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
								}

	
        |IF '(' expression ')' '{' expression ';' '}'  
                                                          {
								 	if($3)
									{
										fprintf(yyout,"\nHello from { IF }\n");
									}
									else
									{
										fprintf(yyout,"\nUncorrect condition in { IF }\n");
									}

							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-IF-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
								}	
								
       |IF '(' expression ')' '{' expression ';' expression ';' '}'  
                                                          {
								 	if($3)
									{
										fprintf(yyout,"\nHello from { Multi_IF }\n");
									}
									else
									{
										fprintf(yyout,"\nUncorrect condition in { Multi_IF }\n");
									}

							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-IF-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
								}
	|IF '(' expression ')' '{'   CPRINT '(' expression ')'   ';' '}'  
                                                          {
								 	if($3)
									{
										fprintf(yyout,"\nHello from { IF } value: %d\n",$8);
									}
									else
									{
										fprintf(yyout,"\nUncorrect condition in { IF } \n");
									}

							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-IF-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
								}
        | IF '(' expression ')'  CPRINT '(' expression ')'   ';'  {
								if($3)
								{
									fprintf(yyout,"\nHello from  IF  value: %d\n",$7);
								}
								else
								{
							     	fprintf(yyout,"Uncorrect condition in  IF \n");
								}

							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-IF-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
							}

	| IF '(' expression ')'  CPRINT '(' expression ')'   ';' ELSE  CPRINT '(' expression ')'   ';' {
								 	if($3)
									
										fprintf(yyout,"\nHello from True_IF_Else ,we in IF value : %d\n",$7);
									
									else
									
										fprintf(yyout,"\nHello from IF_True_Else ,we in Else value : %d\n",$13);
									

							fprintf(yyout,"\n ♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡>>-IF-<<♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡ \n");
								}
								
	;

           
expression: NUM				{ $$ = $1; 	}
	| VAR				{ $$ = sym[$1]; }
	| VAR	'=' expression			{sym[$1]= $3; }
  
	| expression '+' expression	{ $$ = $1 + $3; }
	| expression '+' %prec '+'	{ $$ = $1 + 1; }

	| expression '-' expression	{ $$ = $1 - $3; }
    | expression '-' %prec '-'	{ $$ = $1 - 1; }
 	
	
	| expression '*' expression	{ $$ = $1 * $3; }

	| expression '/' expression	{ 	
	                    if($3) 
				  		{
				     		$$ = $1 / $3;
				  		}
				  		else
				  		{
							$$ = 0;
							printf("\ndivision by zero\t");
				  		} 	
				        }

	| expression '<' expression	{$$ =  $1 < $3? 1: 0; t1=$3; }

	| expression '>' expression	{$$ =  $1 > $3? 1: 0; t1=$3;}
	
	| expression '==' expression	{$$ =  $1 == $3? 1: 0;}
	

	| '(' expression ')'		{ $$ = $2;	}

	;
        
%%



void yyerror(char *s){
	fprintf(yyError,"Error happend %s",s);
}
int main(){
 
	yyin = fopen( "in.txt", "r" );
    yyout = fopen( "out.txt", "w" );
    yyError = fopen( "outError.txt", "w" );
	yyparse();
fprintf(yyout,"\nEL_FLAHEEN *_*\n"); 
fclose(yyin);
fclose(yyout);
return 0;
}
