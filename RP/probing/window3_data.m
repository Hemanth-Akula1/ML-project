load mal8    %%% signal with white noise for window 3
[B A]=butter (5,2*2.5/6.25);
colored_signal_w3=filter(B,A,x);   %%%signal with colored noise for window 3
save colored_signal_w3.mat