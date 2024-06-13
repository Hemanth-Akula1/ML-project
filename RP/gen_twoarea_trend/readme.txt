%%%%%%  Generated  two area  signal  with dominant mode damp=-.25 and freq=0.5374 and having  trends   %%%%%%%%%%%%%%%%%%%


1) domin_trend.mdl                   -----  Simulink model to generate two area data 

2) Domitrend.mat                     -----  Generated test data two area  signal  with damp=-.25 and freq=0.5374

3) domi_tren_fil.mat                 -----  data obtained after nonlinear filtering

4) tf92.mat                          -----  data obtained after random decrement of the filtered signal taking peak=9.2

5) non_filter_area_sig_trend.m       -----  non linear filtering of the signal Domitren.mat 
  
6) ran_decre__area_trend.m          -----  random decrement of the filtered signal  domi_tren_fil.mat  

7) Solu_area_gen.m                   -----   TLS-ESPRIT to find the modes taking the signal tf92.mat 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

No of samples  N=256
Model order    M=44

RESULT:  Attn= -0.3188,   freq= 0.5491,  TVE= 2.9264


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%