
clc;
clear;
close all;

%values for the 'ball-beam' system
g=9.8;
J=1;
M=1;
d=0.2;
R=0.5
L=5;

%derived transfer function
G=tf([M*g*d],[L*(J/R^2+M) 0 0])

%state space 
sys = ss(G);

%step response
step(G,10)
title('Step Response of the system')
xlabel('Time');
ylabel('Amplitude');
grid on
