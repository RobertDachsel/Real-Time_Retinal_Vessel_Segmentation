clc, close all, clear all
addpath('./dataset')

%% load fundus image
I=imread('01_h.jpg');
GT=imread('01_h.tif');
mask=imread('01_h_mask.tif');

mask=mask(:,:,1);
mask=(mask/255);
GT=double(GT/255);
I=I(:,:,2); %green channel-> best contrast
I=double(I);

%% Parameters
a=0.3;   % free paramter
m=512;   %contrast colors
T=0.10;  % binarization threshold
k=0.056; %connected components


%% Laplace Pyramid framework
[L2,L3,L4]=L_pyramid(I,a,m);
[S2,S3,S4]=Conn_comp(L2,L3,L4,T,k);
S=fusion(S2,S3,S4,mask,a);

%% Evaluation and Plot
[sens,spec,acc]=evaluation(S,GT);
imtool(S)






