%{
int nb_open = 0;
int nb_close = 0;
%}

%%
<INITIAL>[\{\(\[] {
	printf("%s",yytext);
	nb_open++;
}
<INITIAL>[\}\)\]] {
	printf("%s",yytext);
	nb_close++;
}
\n {
	printf("\n");
	for(int i = 0; i < nb_open-nb_close-1; i++)
		printf(" ");
}
. {printf("%s",yytext);}

%%

int main()
{
	yylex();
	exit(0);
}

