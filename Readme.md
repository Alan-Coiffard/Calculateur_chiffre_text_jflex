# Information pratique

Ce projet a pour but de créer un compilateur, avec JFlex et CUP, afin de calculer des chaînes et des entier.

## Utilisation

* make	        - Compile le programme
* make run      - Exécute le programme avec le fichier de test "projet"
* make dev      - Exécute le programme et permet d'entrer les calcule dans le terminal

## Warning

Le fichier de test "projet" ne montre pas forcement toutes les fonctionnalités du programme

# La grammaire

prog ::= expr_int EOL  prog 
    |expr_str EOL prog 
    |expr_err EOL prog 
    |EOL prog
    |PRINT EOL
    |
    ;

## Partie gestion erreurs
expr_err ::= 
         expr_str PLUS expr_int     
        |expr_int PLUS expr_str      
        |expr_str PLUS IDENTE        
        |expr_int PLUS IDENTS       
        |IDENTS PLUS expr_int        
        |IDENTE PLUS expr_str        
        |IDENTS EQUAL expr_int       
        |IDENTE EQUAL expr_str       
        |expr_str MULT expr_str     
        |IDENTS MULT expr_str       
        |IDENTS MULT IDENTS         
        |expr_str MULT IDENTS       
        |IDENTE MULT expr_str       
        |expr_str MULT IDENTE       
        ;

## Partie gestion entiers
expr_int ::= 
         expr_int PLUS expr_int
        |expr_int MULT expr_int
        |PAROUV expr_int PARFERM
        |IDENTE PLUS expr_int
        |expr_int PLUS IDENTE
        |IDENTE MULT expr_int
        |expr_int MULT IDENTE
        |IDENTE
        |NB
        ;

## Partie gestion chaines
expr_str ::= expr_str PLUS expr_str
        |expr_str MULT expr_int
        |expr_int MULT expr_str
        |IDENTS MULT expr_int
        |expr_int MULT IDENTS
        |PAROUV expr_str PARFERM
        |IDENTS EQUAL expr_str
        |IDENTS PLUS expr_str
        |expr_str PLUS IDENTS
        |CHAINE
        ;

# AMÉLIORATIONS

* Gestionnaire de syntaxe
Si l'utilisateur entre quelque chose qui n'est pas syntaxiquement correcte
le programme plante.
Exemple : "2++3"

* Saut de ligne à la fin du fichier
Si le fichier ne contient pas de saut de ligne à la fin, le programme plante
