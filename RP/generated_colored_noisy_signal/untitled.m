K  = [5 100];

wn = zeros(1,2);
zeta = zeros(1,2);
Mp = zeros(1,2);
rf = zeros(1,2);
bw = zeros(1,2);

for i = 1:2
    wn(i) = sqrt(K(i));
    zeta(i) = 6.54/(2*wn(i));
    if i == 1
        Mp(i) = (1/(2*zeta(i)*sqrt(zeta(i)^2)-1));
    else
        Mp(i) = (1/(2*zeta(i)*sqrt(1- zeta(i)^2)));
    end
    rf(i) = wn(i)*zeta(i);
    bw(i) = wn(i)*sqrt((1-2*zeta(i)^2) + sqrt((1-2*zeta(i)^2)^2 + 1));
end