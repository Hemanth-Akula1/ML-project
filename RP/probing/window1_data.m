load mal1    %%% signal with white noise for window 1
[B A]=butter (5,2*2.5/6.25);
colored_signal_w1=filter(B,A,x);   %%%signal with colored noise for window 1 
save colored_signal_w1.mat