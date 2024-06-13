clc
clear all
load mal8
ya=x;
kab1=1;
a=[];
for i=1:21800
    if ya(i) >=7.9
        a1=ya(i);
        jab1(kab1)=i;
        kab1=kab1+1;
        a=[a a1];
    end
end
 m1=255;
%%% peak9 %%%%%%%%%%%%%%%%%
% dat1=ya(8766:8766+m1);
% dat2=ya(12804:12804+m1);
% dat3=ya(13988:13988+m1);
% mal8_9=(dat1+dat2+dat3)/3;
% xm=mal8_9';
% save mal8_9

dat1=ya(8764:8764+m1);
dat2=ya(12802:12802+m1);
dat3=ya(13985:13985+m1);
dat4=ya(16932:16932+m1);
dat5=ya(20485:20485+m1);
mal8_8=(dat1+dat2+dat3+dat4+dat5)/5;
xm=mal8_8';
save mal8_8

% dat1=ya(1015:1015+m1);
% dat2=ya(5602:5602+m1);
% dat3=ya(8764:8764+m1);
% dat4=ya(12801:12801+m1);
% dat5=ya(13985:13985+m1);
% dat6=ya(14820:14820+m1);
% dat7=ya(16932:16932+m1);
% dat8=ya(20485:20485+m1);
% mal8_78=(dat1+dat2+dat3+dat4+dat5+dat6+dat7+dat8)/8;
% xm=mal8_78';
% save mal8_78

% dat1=ya(1015:1015+m1);
% dat2=ya(5602:5602+m1);
% dat3=ya(8764:8764+m1);
% dat4=ya(12802:12802+m1);
% dat5=ya(13985:13985+m1);
% dat6=ya(16932:16932+m1);
% dat7=ya(20485:20485+m1);
% mal8_79=(dat1+dat2+dat3+dat4+dat5+dat6+dat7)/7;
% xm=mal8_79';
% save mal8_79

% dat1=ya(1015:1015+m1);
% dat2=ya(5602:5602+m1);
% dat3=ya(8764:8764+m1);
% dat4=ya(12801:12801+m1);
% dat5=ya(13985:13985+m1);
% dat6=ya(14571:14571+m1);
% dat7=ya(16932:16932+m1);
% dat8=ya(20477:20477+m1);
% dat9=ya(505:505+m1);
% dat10=ya(1214:1214+m1);
% dat11=ya(10586:10586+m1);
% dat12=ya(13370:13370+m1);
% dat13=ya(17028:17028+m1);
% mal8_73=(dat1+dat2+dat3+dat4+dat5+dat6+dat7+dat8+dat9+dat10+dat11+dat12+dat13)/13;
% xm=mal8_73';
% save mal8_73