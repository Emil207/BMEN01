%%% Loading Data %%%%

load afdb_1;
rr1=rr;
targetsrr1=targetsRR;

load afdb_2;
rr2=rr;
targetsrr2=targetsRR;

load afdb_3;
rr3=rr;
targetsrr3=targetsRR;

load afdb_4;
rr4=rr;
targetsrr4=targetsRR;

%RR=[rr1; rr2; rr3; rr4]; %matrix

%% building more values %%%
DeltaRR1=zeros(1,length(rr1));
for i=1:(length(DeltaRR1)-1)
    DeltaRR1(i)=(rr1(i+1)-rr1(i));
end

DeltaRR2=zeros(1,length(rr2));
for i=1:(length(DeltaRR2)-1)
    DeltaRR2(i)=(rr2(i+1)-rr2(i));
end

DeltaRR3=zeros(1,length(rr3));
for i=1:(length(DeltaRR3)-1)
    DeltaRR3(i)=(rr3(i+1)-rr3(i));
end

DeltaRR4=zeros(1,length(rr4));
for i=1:(length(DeltaRR4)-1)
    DeltaRR4(i)=(rr4(i+1)-rr4(i));
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DETECTOR PLAYGROUND %%%%%%%%%%%%%
%% Poincare
% Recipe: Getting the plot/values (window dependent) for one window, put it into grid, analyze
% the grid

close all;
rr4_test=rr4;
poinc_test_full=poinc_withsys(rr4_test, 30, 1); %rand approx 20 min
figure(21)
hold on;
plot(1:length(rr4_test), targetsrr4(1:length(rr4_test)),'r*');
plot(1:length(rr4_test), poinc_test_full,'b*');
plot(1:length(rr4_test), (targetsrr4(1:length(rr4_test))-poinc_test_full), 'g*')
legend('targets','poinc','targets-poinc')
hold off;




poinc_test_full=poinc_withsys(rr1, 30, 1); %ran approx 40 minutes....
figure(23)
hold on;
plot(1:length(rr1), targetsrr4(1:length(rr1)),'r*');
plot(1:length(rr1), poinc_test_full,'b*');
plot(1:length(rr1), (targetsrr1(1:length(rr1))-poinc_test_full), 'g*')
legend('targets','poinc','targets-poinc')
hold off;

rr2_test=rr2;
poinc_test_2=poinc(rr2_test, 30, 1);
figure(22)
hold on;
plot(1:length(rr2_test), targetsrr2(1:length(rr2_test)),'r*');
plot(1:length(rr2_test), poinc_test_2,'b*');
plot(1:length(rr2_test), (targetsrr2(1:length(rr2_test))-poinc_test_2), 'g*')
hold off;
    

%% systematically
t=cputime;
system=systematically(rr1(1:30),10)
time=cputime-t %time it takes for systematically.

%% Plot Poincare Delta
figure(11)
hold on
plot(DeltaRR1(1:end-1), DeltaRR1(2:end),'.')
hold off

figure(12)
hold on
plot(DeltaRR2(1:end-1), DeltaRR2(2:end),'.')
hold off

figure(13)
hold on
plot(DeltaRR3(1:end-1), DeltaRR3(2:end),'.')
hold off

figure(14)
hold on
plot(DeltaRR4(1:end-1), DeltaRR4(2:end),'.')
hold off


%% Just Plotting %%%
figure(1)
hold on
plot(rr1);
plot(targetsrr1);
plot(DeltaRR1);
title('data 1');
legend('rr1', 'targetsrr1', 'DeltaRR1')
hold off

figure(2)
hold on;
plot(rr2)
plot(targetsrr2);
title('data 2');
legend('rr2', 'targetsrr2')
hold off

figure(3)
hold on
plot(rr3)
plot(targetsrr3)
title('data 3')
legend('rr3', 'targetsrr3')
hold off;


figure(4)
hold on
plot(rr4)
plot(targetsrr4)
title('data 4')
legend('rr4', 'targetsrr4')
hold off;

