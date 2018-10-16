clear all;
load sim_data_set;

%Options ------------------------------
options.disp = 1;
    %op.disp = 1 -> affichage des nuages de points
%--------------------------------------
optimStruct.step = 0.01;
optimStruct.tolerance=10^-6; 
optimStruct.nbIteration=10^5;
optimStruct.gamma=0.01;
%{
%Question e----------
Nb_classes=2;
[Xe,Te,Re]=Preparation_data(R,Nb_classes);
[w,~]=fitcls(Xe,Te);
figure;
separators(w,Re,Nb_classes);
%Pour Question f en classification binaire
%Ajout de nbp points (a,b) de classe K
a=0;b=5;K=1;Nb_points=10;Nb_classes=2;
Rf = add_values_to_R(R,a,b,K,Nb_points);
[Xf,Tf,Rf]=Preparation_data(Rf,Nb_classes);
[w,~]=fitcls(Xf,Tf);
figure;
separators(w,Rf,Nb_classes);
%----------Question G avec fcontour--------------------
Nb_classes=3;
[Xe,Te,Re]=Preparation_data(R,Nb_classes);
[w,~]=fitcls(Xe,Te);
figure;
separators(w,Re,Nb_classes);
%----------Question h------------
plotdecr(w,min(Xe(:,1))-1,max(Xe(:,1))+1,min(Xe(:,2))-1,max(Xe(:,2))+1,100);
%----------Question i------------
Nb_classes=4;
[Xi,Ti,Ri]=Preparation_data(R,Nb_classes);
[w,~]=fitcls(Xi,Ti);
plotdecr(w,min(Xi(:,1))-1,max(Xi(:,1))+1,min(Xi(:,2))-1,max(Xi(:,2))+1,100);
%%---------Question j---------------------- 
Nb_classes=4;
a=0;b=0.5;K=1;Nb_points=10;
Rj = add_values_to_R(R,a,b,K,Nb_points);
a=0.2;b=0.2;K=2;
Rj = add_values_to_R(Rj,a,b,K,Nb_points);
[Xj,Tj,Rj]=Preparation_data(Rj,Nb_classes);
[w,~]=fitcls(Xj,Tj);
size(w)
plotdecr(w,min(Xj(:,1))-1,max(Xj(:,1))+1,min(Xj(:,2))-1,max(Xj(:,2))+1,1000);
%}
% ---------Question k

Nb_classes=3;
[Xk,Tk,~]=Preparation_data(R,Nb_classes);
[Wk, ersub ] = fitclog(Xk, Tk, optimStruct,options);
plotdecr(Wk',-5,5,-5,5,1000);


