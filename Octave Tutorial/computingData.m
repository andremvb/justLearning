A = [1 2; 3 4; 5 6]
B = [11 12; 13 14; 15 16]
C = [1 1; 2 2]
v = [1 ; 2 ; 3]

A * C           %Multiplicacion
A .* B          %Multiplicacion punto
A .^ 2
1 ./ v 
log(v)          %Logaritmo
exp(v)          %Exponencial    
abs(v)          %Valor absoluto

v + ones(length(v),1)
v + 1

A'              %Transpuesta
a = [1 5 15 25]
val = max(a)        %El maximo valor de v
[val, ind] = max(a) %El maximo valor y su indice
a<10                %Matriz con cada valor verdadero o falso

find(a < 10)           %Matriz con los indices donde es verdadero el (find)


sum(a)              %Suma todos los elementros de a (Sumatoria)
prod(a)             %(Productorio)
floor(a)
ceil(a)

A = magic(3)
max(A,[],1)         %Maximo por filas
max(A,[],2)         %Maximo por columnas
max(A(:))           %El maximo valor de toda la matriz
max(max(A))         %Lo mismo que el anterior

A = magic(9)
sum(A,1)            %Suma de columnas
sum(A,2)            %Suma de filas

temp = pinv(A)      %Invesrsa aproximada



