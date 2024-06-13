clc
clear all
load Processed_signal.mat

y_sig=ensemble_predictions;
plot(y_sig);
am=[];
ka=1;
for i=1:5600
    if y_sig(i) > 9
        am=y_sig(i);
        ja(ka)=i;
        ka=ka+1;
       end
end
 m1=250;
 

% dat1=y_sig(1158:1158+m1);
% dat2=y_sig(1362:1362+m1);
% dat3=y_sig(1974:1974+m1);
% dat4=y_sig(4202:4202+m1);
% dat5=y_sig(4615:4615+m1);
% dat6=y_sig(5001:5001+m1);
% tf92=(dat1+dat2+dat3+dat4+dat5+dat6)/6;
% y=tf92';
% save tf92

dat1=y_sig(1363:1363+m1);
dat2=y_sig(1975:1975+m1);
dat3=y_sig(4202:4202+m1);
dat4=y_sig(4616:4616+m1);
dat5=y_sig(5001:5001+m1);

% 
% dat1=y_sig(88:88+m1);
% dat2=y_sig(749:749+m1);
% dat3=y_sig(1159:1159+m1);
% dat4=y_sig(1365:1365+m1);
% dat5=y_sig(1975:1975+m1);

%dat9=y_sig(5542:5542+m1);
tf95=(dat1+dat2+dat3+dat4+dat5)/5;
y=tf95';
save tf95




