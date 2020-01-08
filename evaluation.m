function [sens,spec,acc]=evaluation(S,GT)

TP_1=zeros(size(S,1),size(S,2));
TP_1(GT==S)=1;
TP=(sum(sum(TP_1.*GT)));

FP_1=zeros(size(S,1),size(S,2));
FP_1(GT~=S)=1;
FP=(sum(sum(FP_1.*S)));

TN_1=zeros(size(S,1),size(S,2));
TN_1(GT==S)=1;
TN=(sum(sum(TN_1.*abs(S-1))));

FN_1=zeros(size(S,1),size(S,2));
FN_1(GT~=S)=1;
FN=(sum(sum(FN_1.*abs(S-1))));

total=TP+FP+TN+FN;
sens=TP/(TP+ FN); %sensitivity
spec=TN/(TN+ FP); %specificity
acc=(TP+TN)/total;%accuracy
     
end