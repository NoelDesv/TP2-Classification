clear all;
load sim_data_set;

%Options ------------------------------
options.disp = 1;
    %op.disp = 1 -> affichage des nuages de points
%--------------------------------------

optimStruct.step = 0.01;
%Corps --------------------------------
%Initialisation -----
%Binary classifier
%R = R(R(:,3)==1|R(:,3)==2,:);
%------------------
%3 K classifier
%R = R(R(:,3)==1|R(:,3)==2|R(:,3)==3,:);
%------------------
%Pour Question f en classification binaire
%Ajout de 10 points (0,5) avec K=1
%R = add_values_to_R(R);
%--------------------------------------
[X1, X2, X3, X4] = select_data(R, options);
X = R(:,1:2);
T = classes2oneofK(R(:,3));
% -------------------
[w,ersub]=fitcls(X,T);
%--------------Question e-------------------
%binary_separators( w );
[ W, ersub ] = fitclog(X, T, optimStruct);

