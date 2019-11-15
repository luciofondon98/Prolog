padres(joaquin,patricia,maria).
padres(joaquin,patricia,felipe).
padres(tomas,maria,jose).
padres(tomas,maria,isabel).
padres(joaquin,patricia,lucio).
padres(fernando,isabel,anita).
padres(felipe,antonia,gabriel).
padres(lucio,natalia,nayib).

%Nombre: hermanos
%Parametros: X,Y
%Descripcion: La funci�n hermanos toma una persona X, que ser� parte del �rbol familiar
% 	      entregado en los hecho y un valor Y, el cual ir� cambiando constantemente,
%             tomando el valor de los hermanos de las persona ingresada como par�metro (X).
%	      Retorna el nombre de todos los hermanos de una persona, sino tiene hermanos, entrega False.

hermanos(X,Y) :- padres(A,B,X),padres(A,B,Y), not(X = Y).


%Nombre: hijos
%Parametros: X,Y
%Descripcion: La funci�n hijos toma una persona X, que ser� parte del �rbol familiar
% 	      entregado en los hecho y un valor Y, el cual ir� cambiando constantemente,
%             tomando el valor de cada uno de los hijos de las persona ingresada como par�metro (X).
%	      Retorna el nombre de todos los hermanos de una persona, sino tiene hijos, entrega False.

hijos(X,Y) :- padres(X,_,Y);padres(_,X,Y).

%Nombre: aux
%Parametros: X,L
%Descripcion: La funci�n aux toma una persona X, que ser� parte del �rbol familiar
% 	      entregado en los hecho y una lista L.
%	      Esta funci�n se encarga de poner en la lista L todos los hijos, padres y hermanos
%             de la persona X entregada y retornarla.

aux(X,L) :- hijos(X,Y),append([],Y,L);
    		hermanos(X,Y),append([],Y,L);
    		padres(A,B,X),append([],(A,B),L).

%Nombre: relacion
%Parametros: X,L
%Descripcion: La funci�n relacion toma una persona X, que ser� parte del �rbol familiar
%             y una lista L que ser� el retorno. Esta funci�n llama a todas la funci�n aux, y el aplica la funci�n
%             findall para encontrar todas las soluciones,
%             y adem�s, convierte la lista a un conjunto, para poder sacar los elementos repetidos.

relacion(X,L) :- findall(A,aux(X,A),B),
    			 list_to_set(B,L).