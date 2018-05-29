/*Traduce oraciones de español a inglés*/
traeEI([],[]).
tradEI([E],[X]):-tradP(E,X).
tradEI(L,X):-tradFEI(L,Trad,Resto),tradEI(Resto,Y),conc(Trad,Y,X),!.
tradEI([H|T],X):-tradP(H,R),tradEI(T,Y),conc([R],Y,X).

/*Traduce frases de español a inglés*/
tradFEI(Entrada,Trad,Resto):-
frase(_,_,Len,_),
getSpaces(Entrada,Len,Res),
frase(Res,Trad,Len,_),
cutList(Entrada,Len,Resto).




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



getSpaces([H|_],1,[H]).
getSpaces([H|T],N,[H|LR]):-K is N-1,getSpaces(T,K,LR).

/*Recorta N espacios de una lista y retorna el resultado*/
cutList(L,0,L).
cutList([_|T],N,LR):-K is N-1, cutList(T,K,LR).

conc([],L,L).
conc([X|L1],L2,[X|L3]):- conc(L1,L2,L3).

/*Base de datos, se ordena de forma
elemento(Palabra en español , palabra en inlglés)
*/

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






