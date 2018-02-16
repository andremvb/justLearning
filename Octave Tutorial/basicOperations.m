%Igualdad
1 == 2      %False (0)

%Desigualdad
1 ~= 2       %True (1)

%AND
1 && 0 

%OR
1 || 0

%Imprime
a = 3

%No imprime (Con el ;)
b = 5;

%Pi e impresion
c = pi;
c
disp(c)
disp(sprintf('2 decimals: %0.2f', a))

%Formatear para varios 
format long
c

format short
c

%Matrices 2x2
A = [1,2;3,4;5,6]

%Vector 1x3 (Vector fila)
v = [1,2,3]

%Vector [1,2,3,4,5,6]
v2 = 1:6

%Vector desde 1 hasta 7, incrementando en 2 [1,3,5,7]
v3 = 1:2:7
v3

%Rellenar matrices
ones(2,3)   %2x3
zeros(3,2)  %3x2      
rand(3,3)   %3x3 Distribuicion uniforme de [0,1]
randn(1,3)  %Distribucion Gausiana: promedio 0 desviacion 1
eye(3)      %3x3 Matriz de identidad

w = -6 * sqrt(10) * randn(1,1000);
%Plotear en un histograma
hist(w)

size(A)   % El tamaño de todas las dimensiones
length(A) %El tamaño de la dimension mayor
pwd         %Current path
who         %Variables in the current scope
whos        %Variables en mas detalle

save var.mat A          %Guarda la variable v2 en var.mat
save var.txt A -ascii   %Guarda la variable v2 en var.txt para que se lea

clear a             %Elimina la variable a
clear               %Elimina todas las variables

load var.mat        %Carga la variable guardaa en var.mat
A

A(3,2)                      %Valor en la columna 3, fila 2
A(2,:)                      % ":" Significa cada elemento en esa "Columna o Fila"
A(:,1)
A([1 3],:)                  % "[]" Significa solo en las filas 1 y 3
A(:,2) = [10; 11; 12]
A = [A,[100;101;102]]       %Append 
A(:)                        %Put all elements in a single vector
A = [1 2; 3 4; 5 6]
B = [10 11; 12 13; 14 15]
C = [A B]                   %Concatenar al lado
C = [A ;B]                  %Concatenar abajo










