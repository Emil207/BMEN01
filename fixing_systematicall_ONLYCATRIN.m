%% Mission: Solving the Clusters!

plot(rr1(1:30), rr1(2:31),'b.');

X=[rr1(1:30); rr1(2:31)].'; %x-values in 1. spalte, y-values in 2. spalte
plot(X(:,1), X(:,2),'r.');

%make a silhouette plot using the cluster indices output from kmeans. 
%The silhouette plot displays a measure of how close each point in one 
%cluster is to points in the neighboring cluster
% +1= totally fine defined, 0= can be either this or another cluster,
% -1=probably assigned the wrong cluster.

%create a while loop....
k=1;
kmax=10;
mean_vector=zeros(1,kmax);
while k<kmax
    idx=kmeans(X,k);
    s=silhouette(X,idx);
    mean_silh_val=mean(s)
    mean_vector(k)=mean_silh_val;
    k=k+1
end    
find(mean_vector==max(mean_vector))