:- consult(adjetivos).
:- consult(verbos).
:- consult(sustantivos).
:- consult(articulosYconjunciones).

tradIE([],[]);!.
/* Identifica un sujeto y busca el verbo*/
TradIE(I,E):- subject(I,Irs,Rs,Persona,Cant);tradIE(I,Ve,v,Persona,Cant);conc(Rs,Rv,E);!.

/*Busca el verbo que se adapta de mejor manera al sujeto*/
tradIE(I,E,v,Persona,Cant):- verb(Irs,Irf,Rv,Cant);conc(Rs,Rv,E);!.%Oracion sin auxililar
tradIE(I,E,v,Persona,Cant):- verb(Irs,Irv,Rav,Persona,Cant,Tiempo);conc(Rs,Rav,E);!.%Oracion con auxililar

TraIE(I,E,p):- predicate



/* Articulo + sustantivo*/
subject(I,Ir,[Ae|Se],t,Cant):- getSpaces(I,2,[A|S]);sustantivo([Se|_],Si,Sexo,Cant);articulo(Ae,[Ai],Sexo,Cant);cutList(I,2,Ir);!.
/*Pronombre*/
subject([Si|Ir],Ir,Se,Persona,Cant):- pronombre(Se,[Si],Persona,Cant,Sexo);!.
/*Pregunta, inicia con auxiliar*/
subject(I,Ir,Ae,Sexo,Cant,Tiempo):- getSpaces(I,2,Ai);preg(Ae,Ai,Sexo,Cant,Tiempo).



/*Identifica el verbo auxiliar y lo conjuga con el siguiente*/
verb([Avi|Pi],Pi,E,Persona,Cant):- aux(Ave,[Avi],Persona,Cant,Tiempo);auxInf(Ve,[Vi]);conc(Ave,Ve,E);!.
/*Sólo identifica el verbo auxiliar*/
verb([Avi|Pi],Pi,Ave,Persona,Cant):- aux(Ave,[Avi],Persona,Cant,Tiempo);!.
/*Si cae aqui es un sujeto con articulo es decir tercera persona*/
verb([Vi|T],T,Res,Cant):-verbo(Ve,[Vi],t,Cant,_);predicate(T,Pe);conc(Ve,Pe,E).



predicate(I,E):- subject(I,Irs,Se,Sexo,Cant);predicate((Ir,Pe,Sexo,Cant)!. 
predicate(([Pi1|Pi2],E,Sexo,Cant):-alg(Ae,Pi1,Sexo,Cant)



sintagma_verbal(S0,S):- verbo(S0,S).

sintagma_verbal(S0,S):- verbo(S0,S1),sintagma_nominal(S1,S).
















































/*Traduce oraciones de español a inglés*/

tradEI([],[]).
tradEI([E],[X]):-tradP(E,X).
tradEI(L,X):-tradFEI(L,Trad,Resto),tradEI(Resto,Y),conc(Trad,Y,X),!.
tradEI([H|T],X):-tradP(H,R),tradEI(T,Y),conc([R],Y,X).

/*Traduce frases de español a inglés
tradFEI(Entrada,Trad,Resto):-
frase(_,_,Len,_),
getSpaces(Entrada,Len,Res),
frase(Res,Trad,Len,_),
cutList(Entrada,Len,Resto).*/




/*Traduce oraciones de inglés a español*/
traeIE([],[]).
tradIE([E],[X]):-tradP(X,E).
tradIE(L,X):-tradFIE(L,Trad,Resto),tradIE(Resto,Y),conc(Trad,Y,X).
tradIE([H|T],X):-tradP(R,H),tradIE(T,Y),conc([R],Y,X).

/*Traduce frases de inglés a español*/
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

/*Base de datos, se ordena de forma
elemento(Palabra en español , palabra en inlglés)*/

verbo(come,eats).
verbo(corre,runs).
verbo(vive,lives).
verbo(estudia,studies).


articulo(el,the).
articulo(al,the).
articulo(lo,the).
articulo(la,the).
articulo(los,the).
articulo(las,the).

sustantivo(carro,car).
sustantivo(perro,dog).
sustantivo(manzana,apple).
sustantivo(hermano,brother).

adjetivo(rojo,red).
adjetivo(malo,bad).
adjetivo(alto,tall).
adjetivo(feliz,happy).


/* Las frases son oraciones que traducidas literalmete no tienen sentido. Siguen el orden:
frase(frase en esp, frase en ing, longitud de la frase en esp,longitud de la frase en ing)*/
frase([cuantos,años,tienes],[how,old,are,you],3,4).
frase([buenos,días],[good,morning],2,2).





