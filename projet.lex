import java_cup.runtime.Symbol;

%%

%unicode
%cup
%line

identE = [a-zA-Z]+
identS = \$[a-zA-Z]+
chaine = \"[a-zA-Z]+\"

%%

"PRINT"	{
    //System.out.println("print: "+yytext());
    return new Symbol(sym.PRINT, yytext());
}
{chaine}	{
    //System.out.println("Chaine: "+yytext());
    return new Symbol(sym.CHAINE, yytext());
}
{identE}	{
    //System.out.println("idente:"+yytext());
    return new Symbol(sym.IDENTE, yytext());
}
{identS}	{
    //System.out.println("idente:"+yytext());
    return new Symbol(sym.IDENTS, yytext());
}

//E                  { return new Symbol(sym.ELETTRE, new String(yytext()));}
"="                  { return new Symbol(sym.EQUAL);}
"+"                  { return new Symbol(sym.PLUS);}
"*"                  { return new Symbol(sym.MULT);}
"("                  { return new Symbol(sym.PAROUV);}
")"                  { return new Symbol(sym.PARFERM);}
[0-9]+               { return new Symbol(sym.NB, new Integer(yytext()));}

[\n]               { return new Symbol(sym.EOL, new String(yytext()));}
[ \t] {}
.                 { System.out.println( "ERREUR ligne " + yyline + ": " + yytext() + "non reconnu");}