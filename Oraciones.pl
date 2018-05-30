:- consult(adjetivos).
:- consult(verbos).
:- consult(sustantivos).
:- consult(articulosYconjunciones).

traduccionEI(X,R):-split_string(X," ", "", L),tradEI(L,I),atomic_list_concat(I, ' ', R).
traduccionIE(X,R):-split_string(X," ", "", L),tradIE(L,I),atomic_list_concat(I, ' ', R).


/* Identifica un sujeto y busca el verbo*/
tradIE(I,E):- subject(I,Irs,Se,Persona,Cant,_),
tradIE(Irs,Irv,Ve,v,Persona,Cant),
conc(Se,Ve,E0),tradIE(Irv,E1,p),
conc(E0,E1,E).
tradIE([],[],_).
tradIE(I,E,p):- predicate(I,E).
/*Busca el verbo que se adapta de mejor manera al sujeto*/
/*tradIE(I,Ir,Rv,v,Persona,Cant):- verb(I,Ir,Rv,Cant),!.%Oracion sin auxililar*/
tradIE(I,Ir,E,v,Persona,Cant):- verb(I,Ir,E,Persona,Cant),!.%Oracion con auxililar



/* Articulo + sustantivo  getSpaces(I,2,[Ai|Si]),*/
subject([Ai|[Si|P]],P,E,t,Cant,Sexo):-sustantivo(Se,[Si],Sexo,Cant),articulo(Ae,[Ai],Sexo,Cant),conc(Ae,Se,E),!.
/*Pronombre*/
subject([Si|Ir],Ir,Se,Persona,Cant,_):- pronombre(Se,[Si],Persona,Cant,_),!.
/*Pregunta, inicia con auxiliar*/
subject([A1|[A2|Ir]],Ir,Ae,Sexo,Cant,Tiempo):- preg(Ae,[A1,A2],Sexo,Cant,Tiempo),!.



/*Identifica el verbo auxiliar y lo conjuga con el siguiente*/
verb([Avi|[Vi|Pi]],Pi,E,Persona,Cant):- aux(Ave,[Avi],Persona,Cant,_),auxInf(Ve,[Vi]),conc(Ave,Ve,E),!.
/*Si cae aqui es un sujeto con articulo es decir tercera persona*/
verb([Vi|T],T,Ve,Persona,Cant):-verbo(Ve,[Vi],Persona,Cant,_).
/*Solo identifica el verbo auxiliar*/
verb([Avi|Pi],Pi,Ave,Persona,Cant):- aux(Ave,[Avi],Persona,Cant,_),!.



predicate(I,Se):- subject(I,_,Se,_,_,_),!.
predicate([Si|_],Se):- sustantivo(Se,[Si],_,_),!.





tradEI(E,I):- sintagma_nominal(E,Ers,Si,Persona,Cant,_),
tradEI(Ers,Erv,Vi,v,Persona,Cant),
conc(Si,Vi,I0),tradEI(Erv,I1,p),
conc(I0,I1,I).
tradEI([],[],_).
tradEI(E,I,p):- predicado(E,I).
/*Busca el verbo que se adapta de mejor manera al sujeto*/
/*tradEI(I,Ir,Rv,v,Persona,Cant):- verb(I,Ir,Rv,Cant),!.%Oracion sin auxililar*/
tradEI(E,Er,I,v,Persona,Cant):- sintagma_verbal(E,Er,I,Persona,Cant),!.%Oracion con auxililar




sintagma_nominal([Ae|[Se|P]],P,E,t,Cant,Sexo):- sustantivo([Se],Si,Sexo,Cant),articulo([Ae],Ai,Sexo,Cant),conc(Ai,Si,E),!.
/*Pronombre*/
sintagma_nominal([Se|Ir],Ir,Si,Persona,Cant,_):- pronombre([Se],Si,Persona,Cant,_),!.

/*En español la conjugacion del verbo decide los auxiliares en ingles*/
sintagma_verbal([Ve|T],T,Vi,Persona,Cant):-verbo([Ve],Vi,Persona,Cant,_).

predicado(E,Se):- sintagma_nominal(E,_,Se,_,_,_),!.
predicado([Se|_],Si):- sustantivo([Se],Si,_,_),!.
































/*Traduce oraciones de español a ingles*/
/*
tradEI([],[]).
tradEI([E],[X]):-tradP(E,X).
tradEI(L,X):-tradFEI(L,Trad,Resto),tradEI(Resto,Y),conc(Trad,Y,X),!.
tradEI([H|T],X):-tradP(H,R),tradEI(T,Y),conc([R],Y,X).*/

/*Traduce frases de español a ingles
tradFEI(Entrada,Trad,Resto):-
frase(_,_,Len,_),
getSpaces(Entrada,Len,Res),
frase(Res,Trad,Len,_),
cutList(Entrada,Len,Resto).*/





/*Traduce frases de ingles a español*/
tradFIE(Entrada,Trad,Resto):-
frase(_,_,_,Len),
getSpaces(Entrada,Len,Res),
frase(Trad,Res,_,Len),
cutList(Entrada,Len,Resto).





/*Traduce un palabra*/
tradP(E,I):-verbo(E,I).
tradP(E,I):-articulo(E,I).
tradP(E,I):-sustantivo(E,I).
tradP(E,I):-adjetivo(E,I).


/*Obtiene los primeros N espacios de una lista y retorna el resultado*/
getSpaces([H|_],1,[H]).
getSpaces([H|T],N,[H|LR]):-K is N-1,getSpaces(T,K,LR).

/*Recorta N espacios de una lista y retorna el resultado*/
cutList(L,0,L).
cutList([_|T],N,LR):-K is N-1, cutList(T,K,LR).

conc([],L,L).
conc([X|L1],L2,[X|L3]):- conc(L1,L2,L3).


/* Las frases son oraciones que traducidas literalmete no tienen sentido. Siguen el orden:
frase(frase en esp, frase en ing, longitud de la frase en esp,longitud de la frase en ing)*/
frase([cuantos,años,tienes],[how,old,are,you],3,4).
frase([buenos,dias],[good,morning],2,2).





