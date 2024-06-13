load Domitrend
ya1=Domitrend;
j=0;
l=1;
kma=1;
w1=zeros(400,29);
 for i=1:200:5800
     w1(:,kma)=ya1(i:i+399);
     kma=kma+1;
 end

domi_trend_fil=[];

for i=1:28
    a=w1(:,i);
    a1=(a-mean(a))';
    b=w1(:,i+1);
    b1=(b-mean(b))';
    ava=(a1(201:400)+b1(1:200))./2;
   domi_trend_fil=[domi_trend_fil ava];
    
end

 x_sig= domi_trend_fil';
 save  domi_trend_fil;

