clc
clear all;

load test_tren_fil_325a

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d_true=-0.1;
f_true=0.2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1=x ;%+0.001*randn(64,1);

fs=10;

P=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N1=200;
M=40;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ymat=zeros(N1-M+1,M);


d3=[];
f3=[];
 
for k=1:1
    k;

y2=x;



y=y2;
%y=y3;
for i=1:M
    ymat(:,i)=y(1,i:N1-M+i);
end




[nsamp, msens] = size(ymat); 

Rb=zeros(M,M);

cmat = zeros(M,M); 

%ymat  = ymat  - ones(nsamp,1) * mean(ymat);   % remove mean 
ymat=ymat;  % In ESPRIT you need not to remove mean escusively, it does of its own

order=2;

if (order == 4)
  
   zmat = ymat .* ymat .* conj(ymat);    % the iv for the fourth moments
   cmat = conj(zmat' * ymat) /nsamp;     % fourth-order cross-moments 
   r1   = conj(ymat' * ymat) / nsamp;    % correlation matrix of order 2
   r2   = conj(ymat.'* ymat) / nsamp;    % moment matrix this algo has implemented using diagonal slicing t1=t2=t3

                                         % cross-cumulant matrix: 
   cmat = cmat - 2 * diag(diag(r1)) * r1  - diag(conj(diag(r2))) * r2; 
   
elseif (order == 3)
        
   zmat = conj(ymat) .*conj(ymat);       % Diagonal slice of third order cumulant
   cmat = (ymat.'*zmat) /nsamp;      %       
   %cmat=zmat/nsamp;   
        
else 
   cmat = conj(ymat' * ymat) / nsamp;    % correlation matrix 
end 

Rb=cmat;

% Doing scholosky decomposition and producing mutually uncorrelated
% variable
% Rb1=cmat;
% [v1,d1] = eig(Rb1);            % Square root of measurement noise cov.
% Rb    = real(v1*sqrt(d1));




[E,D,V]=svd(Rb);
Es=E(:,1:P);


%ESPRIT algorithm:
Es1=Es(1:M-1,:); Es2=Es(2:M,:);

[E,D,V]=svd([Es1 Es2]);
V11=V(1:P,1:P);
V12=V(1:P,(P+1):(2*P));
V21=V((P+1):(2*P),1:P);
V22=V((P+1):(2*P),(P+1):(2*P));
Psi=-V12*inv(V22);

[E,Phi]=eig(Psi);
Phivec=diag(Phi);
spoles1=log(Phivec(:))*fs;
omega_list=imag(spoles1);
%freq=omega_list./(2*pi);


Es1=Es(1:M-2,:); Es2=Es(3:M,:);

[E,D,V]=svd([Es1 Es2]);
V11=V(1:P,1:P);
V12=V(1:P,(P+1):(2*P));
V21=V((P+1):(2*P),1:P);
V22=V((P+1):(2*P),(P+1):(2*P));
Psi=-V12*inv(V22);

[E,Phi1]=eig(Psi);
Phi=sqrt(Phi1);
Phivec=diag(Phi);
spoles2=log(Phivec(:))*fs;


%spoles=spoles1;
 spoles=(spoles1+spoles2)./2;

 omega_list=imag(spoles);
 modes_fr=omega_list./(2*pi);
 dampin=real(spoles);
 f1=modes_fr';



end

d_est=dampin(1)
f_est=modes_fr(1)

TVE=sqrt(((d_est-d_true)^2+(2*pi*f_true-2*pi*f_est)^2)/(d_true^2+2*pi*f_true)^2)*100



