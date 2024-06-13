clc
clear all
load test_tren.mat %%%% generated signal (True value damping value of ?0.1, frequency of 0.2 Hz)
ya=test_tren;

%%%%%%%%%%%  Nonlinear filtering of the  generated signal  %%%%%%%%

ja=0;
la=1;
km1a=1;
 wa=zeros(400,29);
 for i=1:200:5800
     wa(:,km1a)=ya(i:i+399);
     km1a=km1a+1;
 end
test_tren_fil=[];

for i=1:28
    a=wa(:,i);
    a1=(a-mean(a))';
    b=wa(:,i+1);
    b1=(b-mean(b))';
    av=(a1(201:400)+b1(1:200))./2;
  test_tren_fil=[test_tren_fil av];
 
end
x_sig=test_tren_fil';   %%%% signal obtained after non-linear filtering- signal in Fig 3 of the WAVELET paper
save test_tren_fil
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%% code for signal corrupted with colored noise %%%%%%%%%
fs=10;    %% sampling freq
cf=fs/2.5;  %% cutoff freq
% [B A]=butter (order,2*cf/fs)
[B A]=butter (5,2*2.5/6.25);
x_colored=filter(B,A,x_sig);   %%% signal corrupted with colored noise 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(x_sig)
%  YOUR TASK  %
% use optimization technique to minimize the coloured noise 
% Step 1:  apply techniques on  x_colored signal and finally reconstruct it.
% Step 2:   use random decrement (run the file ran_decre_test_sig)
% Step 3:   use TLS-ESPRIT  (run the file Solu_test_sig)
 % Note: Estimated value must be close to true value(True value damping value of ?0.1, frequency of 0.2 Hz)



