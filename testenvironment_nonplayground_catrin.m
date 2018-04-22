%%%test environment for specific functions (so not playground)
close all; 
rng default; % For reproducibility
X = [randn(100,2)*0.75+ones(100,2);
    randn(100,2)*0.5-ones(100,2)];

figure(1);
plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';

%system= systematically(X,11)

[idx,C] = kmeans(X,3,'Distance','cityblock')% 'Replicates',5,'Options',opts);

figure(2);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(X(idx==3,1),X(idx==3,2), 'g.')
hold off
%poinc_test_vector=poinc(rr1,43000, 20, 10);

a=[1 2 3 4 5 6];
sum=0;
k=3 %does not work
for k=a
    k
    sum=sum+k;
    k=k+1;
end
sum

    
    