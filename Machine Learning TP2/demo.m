clear all;
load sim_data_set;

%Options ------------------------------
options.disp = 1;
options.scatter.minx = -5;
options.scatter.maxx = 5;
options.scatter.miny = -5;
options.scatter.maxy = 5;
options.scatter.nbp = 1000;
%op.disp = 1 -> affichage des nuages de points
%--------------------------------------
optimStruct.step = 0.01;
optimStruct.tolerance=10^-6; 
optimStruct.nbIteration=10^5;
optimStruct.gamma=0.01;
opt.disp=1;
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

plotdecr(w,min(Xj(:,1))-1,max(Xj(:,1))+1,min(Xj(:,2))-1,max(Xj(:,2))+1,1000);
% ---------Question k
Nb_classes=4;
[Xk,Tk,~]=Preparation_data(R,Nb_classes);
[Wk, ersub ] = fitclog(Xk, Tk, optimStruct,options);
plotdecr(Wk',-5,5,-5,5,1000);
%}
%Exo 2
load fisheriris;
Nb_classes=2;
Xfleur = meas(:,1:2);
for ii=1:length(species)
    if (strcmp('setosa',species(ii))==true)
        Tfleur(ii,1)=1;
    end
    if (strcmp('versicolor',species(ii))==true)
        Tfleur(ii,1)=2;
    end
    if (strcmp(species(ii),'virginica')==true)
        Tfleur(ii,1)=3;
    end
end

Datafleur=[Xfleur Tfleur];
[ ~, ~, ~, ~ ] = select_data(Datafleur, opt);
methods_comparison( Xfleur, classes2oneofK(Tfleur), optimStruct, options)
%{
[ erreur_total] = Calcul_erreur( Datafleur );
disp(erreur_total);
[w,~]=fitcls(Xfleur,classes2oneofK(Tfleur));
figure;
plotdecr(w,min(Xfleur(:,1))-1,max(Xfleur(:,1))+1,min(Xfleur(:,2))-1,max(Xfleur(:,2))+1,100);
%}







