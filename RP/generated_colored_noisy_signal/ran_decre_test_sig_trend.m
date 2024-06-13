clc
clear all;
load ('predictions1.mat')

y_sig= ensemble_predictions;
ja1=0;
ka1=1;
for i=1:5600
    if y_sig(i) > 4.5
        am1=y_sig(i);
        ja1(ka1)=i;
        ka1=ka1+1;
    end
end
plot(y_sig);
hold on
m1=200;

%%%%%%%%%%%    first data  %%%%%%%%%%%%%%
dat1=y_sig(1143:1143+m1);
dat2=y_sig(1421:1421+m1);
dat3=y_sig(1992:1992+m1);
dat4=y_sig(2358:2358+m1);
dat5=y_sig(2453:2453+m1);
% 
% dat1=y_sig(1144:1144+m1);
% dat2=y_sig(1421:1421+m1);
% dat3=y_sig(1987:1987+m1);
% dat4=y_sig(2354:2354+m1);
% dat5=y_sig(2451:2451+m1);

test_tren_fil_325a=(dat1+dat2+dat3+dat4+dat5)/5;
x=test_tren_fil_325a;
save test_tren_fil_325a


%x = linespace(0,10,1000);
[peaks, locations] = findpeaks(y_sig, 'MinPeakDistance',200,'MinPeakHeight',1);

plot(y_sig(locations), peaks, 'ro','MarkerSize',5);
title('peaks in the Signal')


disp('Peak Coordinates:');
disp([y_sig(locations); peaks]);


