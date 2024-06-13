clear all;
fs=10;


 %load tf92  % taking this for single mode
% d_true= -.25;
% f_true=0.5374;
% P=2;
% N1=256; % taking this for single mode
% M=44;    

load tf95 % taking this for multi mode
d_true=[-0.25 -.25 -.25];
f_true=[0.5374 1.2047 1.1950];
P=6;
N1=175;  %%% 150, 11
M=11; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ymat=zeros(N1-M+1,M);


d3=[];
f3=[];
 
for k=1:1
    k


for i=1:M
    ymat(:,i)=y(i:N1-M+i,1);
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
 spoles=(spoles1+spoles2)./2;
aa=zeros(N1,P);
 omega_list=imag(spoles);
 modes_fr=omega_list./(2*pi);
 dampin=real(spoles);
 

end
% d_est=dampin(1)
% f_est=modes_fr(1)
% TVE=sqrt(((d_est-d_true)^2+(2*pi*f_true-2*pi*f_est)^2)/(d_true^2+2*pi*f_true)^2)*100

d_est=[dampin(1) dampin(3) dampin(5)]
f_est=[modes_fr(1) modes_fr(3) modes_fr(5)]
for ia=1:3
TVE(ia)=sqrt(((d_est(ia)-d_true(ia))^2+(2*pi*f_est(ia) - 2*pi*f_true(ia))^2)/(d_true(ia)^2+(2*pi*f_true(ia))^2))*100;
end
TVE
