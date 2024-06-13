% load mal1
% 
% ya=x;
% kp=1;
% a=[];
% for i=1:17600
%     if ya(i) >= 9.35
%         a1=ya(i);
%         jp(kp)=i;
%         kp=kp+1;
%         a=[a a1];
%     end
%  end
  % m1=255;





% Load the data from the file mal1
load colored_signal_w1.mat

% Store the loaded data in variable ya
ya = x;

% Initialize variables
kp = 1;
a = [];
jp = [];

% Loop through the data
for i = 1:17600
    % Check if ya(i) is greater than or equal to 9.35
    if ya(i) >= 7.5
        % If yes, store the value in a1
        a1 = ya(i);
        % Store the index i in jp array
        jp(kp) = i;
        % Increment kp
        kp = kp + 1;
        % Store the value in array a
        a = [a a1];
    end
end

% Plot the original data ya
plot(ya)
hold on

% Highlight the points where ya >= 9.35
scatter(jp, ya(jp), 'r', 'filled')

% Add labels and title
xlabel('Index')
ylabel('Value')
title('Plot of ya with Points where ya >= 9.35 highlighted')

% Turn off hold
hold off

  % peak=7.5 %%
% dat1=ya(866:866+m1);
% dat2=ya(1307:1307+m1);
% dat3=ya(2378:2378+m1);
% dat4=ya(2551:2551+m1);
% dat5=ya(2846:2846+m1);
% dat6=ya(3907:3907+m1);
% dat7=ya(5033:5033+m1);
% dat8=ya(6502:6502+m1);
% dat9=ya(9613:9613+m1);
% dat10=ya(10792:10792+m1);
% mal1_75=(dat1+dat2+dat3+dat4+dat5+dat6+dat7+dat8+dat9+dat10)/10;
% xm=mal1_75';
% save mal1_75

%%% peak=8 %%%

% dat1=ya(866:866+m1);
% dat2=ya(2552:2552+m1);
% dat3=ya(3907:3907+m1);
% dat4=ya(5385:5385+m1);
% dat5=ya(10792:10792+m1);
% mal1_8=(dat1+dat2+dat3+dat4+dat5)/5;
% xm=mal1_8';
% save mal1_8

%%% peak=8.5 %%%

% dat1=ya(868:868+m1);
% dat2=ya(2552:2552+m1);
% dat3=ya(5389:5389+m1);
% dat4=ya(10796:10796+m1);
% mal1_85=(dat1+dat2+dat3+dat4)/4;
% xm=mal1_85';
% save mal1_85

%%% peak=8.8
% dat1=ya(868:868+m1);
% dat2=ya(2555:2555+m1);
% dat3=ya(5389:5389+m1);
% dat4=ya(10796:10796+m1);
% mal1_88=(dat1+dat2+dat3+dat4)/4;
% xm=mal1_88';
% save mal1_88


%%% peak=9
%  dat1=ya(2555:2555+m1);
%  dat2=ya(5389:5389+m1);
%  dat3=ya(10796:10796+m1);
%  mal1_9=(dat1+dat2+dat3)/3;
%  xm=mal1_9';
%  save mal1_9

%%% peak=9.4
% dat1=ya(2555:2555+m1);
%  dat3=ya(10796:10796+m1);
%  mal1_94=(dat1+dat3)/2;
%  xm=mal1_94';
%  save mal1_94
 
 

