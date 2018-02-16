v = zeros(10,1)


% For loop
for i =1:10,
    v(i) = 2^i;
end;

v

indices = 1:10
for i=indices,
    disp(i);
end;

%While
i = 1
while i<= 5,
    v(i) = 100;
    i = i+1;
end;

%If
i = 1
while true,
    v(i) = 999; 
    if(i == 6),
        break;
    end;
    i++
end;

v

if v(1) == 1
    disp('The value is 1')
elseif v(1) == 2
    disp('The value is 2')
else
    disp('The value is other number')
end;

%Function in exampleFunction.m
exampleFunction(5)
addpath('/Users/Andre/Git/justLearning/Octave Tutorial')    %Para añadir la busqueda de archivos en otro path

exampleFunction2(4)


