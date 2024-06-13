load mal2    %%% signal with white noise for window 2
[B A]=butter (5,2*2.5/6.25);
colored_signal_w2=filter(B,A,x);   %%%signal with colored noise for window 2
save colored_signal_w2.mat