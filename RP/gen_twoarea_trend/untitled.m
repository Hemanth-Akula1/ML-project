clc;
clear;
close all;

s = tf('s');
G = 1/(s*(s+6.54));

K = [5 100];
zeta = zeros(1,2);
wr = zeros(1,2);
Mr = zeros(1,2);

for i = 1:2
    sys = feedback(G*K(i),1,-1);
    wn = sqrt(K(i));
    zeta(i) = 6.54/(2*wn);
    wr(i) = wn * sqrt(1 - (2 * zeta(i)^2));

    fprintf('\n Resonant frequency for K = %d is wr = %2.2f rad/s', K(i), wr(i));

    if zeta(i) > 0.707
        Mr(i) = 1;
        fprintf('\n Resonant peak for K = %d is Mr = 1 ', K(i));
    else
        Mr(i) = 1/(2 * zeta(i) * sqrt((1 - zeta(i))^2));
        fprintf('\n Resonant peak for K = %d is Mr = %2.3f', K(i), Mr(i));
    end

    % Bandwidth calculation
    BW = wn * (sqrt(1 - 2 * zeta(i)^2 + sqrt(2 - 4 * zeta(i)^2 + 4 * zeta(i)^4)));
    fprintf('\n Bandwidth for K = %d is BW = %2.3f rad/s \n', K(i), BW);

    figure;
    bode(sys);
    title(['Bode Plot for K = ' num2str(K(i))]);
    grid on;

end
