c(greenpath, crossroads, 4).
c(crossroads, greenpath, 4).
c(greenpath, canyon, 10).
c(canyon, greenpath, 10).
c(dirtmouth, crystal_peak, 5).
c(crystal_peak, dirtmouth, 5).
c(crystal_peak, dirtmouth, 5).
c(dirtmouth, crystal_peak, 5).
c(dirtmouth, crossroads, 1).
c(crossroads, dirtmouth, 1).
c(crystal_peak, resting_grounds, 8).
c(resting_grounds, crystal_peak, 8).
c(crossroads, blue_lake, 2).
c(blue_lake, crossroads, 2).
c(crossroads, city_of_tears, 4).
c(city_of_tears, crossroads, 4).
c(crossroads, fungal, 5).
c(fungal, crossroads, 5).
c(blue_lake, resting_grounds, 3).
c(resting_grounds, blue_lake, 3).
c(resting_grounds, city_of_tears, 3).
c(city_of_tears,resting_grounds, 3).
c(resting_grounds, edge, 14).
c(edge,resting_grounds, 14).
c(canyon, fungal, 3).
c(fungal,canyon, 3).
c(canyon, garden, 12).
c(garden, canyon, 12).
c(garden, fungal, 16).
c(fungal, garden, 16).
c(fungal, deepnest, 10).
c(deepnest, fungal, 10).
c(fungal, waterways, 10).
c(waterways, fungal, 10).
c(city_of_tears, waterways, 7).
c(waterways, city_of_tears, 7).
c(edge, waterways, 6).
c(waterways, edge, 6).
c(edge, hive, 7).
c(hive, edge, 7).
c(beast_den, deepnest, 8).
c(deepnest, beast_den, 8).

%Nombre: camino
%Parametros: Ciudad1, Tiempo, Ultimo, Aux
%Descripcion: La funcion camino toma una ciudad inicial, un tiempo total
%			  el ultimo vecino por encontrar y una lista auxiliar.
%			  Lo que hace la funcion es ver cuanto tiempo se demora en
%			  viajar de una ciudad a otra, resta ese tiempo de viaje al
%			  tiempo total y agrega esa ciudad a la lista Aux2. Luego,
%			  revisa si el tiempo es menor que 0.
%			  Si ese es el caso, elimina la ultima ciudad encontrada y
%			  detiene el proceso.

camino(_,Tiempo,Ultimo,Lista):-
    Tiempo < 0,
    append(_,[Ultimo],Lista),!.

camino(Ciudad1,Tiempo,Ultimo,Aux):-
    c(Ciudad1,Ciudad2,Tiempo2),
    T_aux is (Tiempo - Tiempo2),
    append(Aux,[Ciudad2],Aux2),
    camino(Ciudad2,T_aux,Ultimo,Aux2).

%Nombre: alcanzables
%Parametros: Ciudad, Tiempo, L
%Descripcion:	La funcion alcanzables hace lo mismo que la funcion caminos,
%				pero lo hace con todos los caminos posibles. Como los caminos
%				se pueden repetir, al final lo que hace es pasar la lista a un
%				conjunto y luego retorna ese conjunto con los elementos repetidos
%				eliminados.

alcanzables(Ciudad,Tiempo,L):-
    Lista = [Ciudad],
    findall(S,camino(Ciudad,Tiempo,S,Lista),L_repetidos),
    list_to_set(L_repetidos,L).
