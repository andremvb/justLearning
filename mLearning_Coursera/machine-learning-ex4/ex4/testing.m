y = [9 4 2];
h_x = [9 3 2];
m = 3;
k = 10;
tmp = 0:9;
yMat = tmp';
hMat = tmp';
resp = zeros(k,m);
resp1 = zeros(k,m);
resp2 = zeros(k,m);

for i = 1:m-1
    yMat = [yMat tmp'];
    hMat = [hMat tmp'];
end

yMat = yMat == y;
hMat = hMat == h_x;


yMat
hMat


for i = 1:m
    for j = 1:k
        resp(j,i) = (-yMat(j,i) * log(hMat(j,i))) - ((1 - yMat(j,i)) * log(1 - hMat(j,i)));
        resp1(j,i) = -yMat(j,i) * log(hMat(j,i));
        resp2(j,i) = (1 - yMat(j,i)) * log(1 - hMat(j,i));
    end
end

resp
resp1
resp2