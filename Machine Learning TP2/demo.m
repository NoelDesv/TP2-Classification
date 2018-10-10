clear all;
load sim_data_set;

%Options ------------------------------
opt.disp = 1;
    %op.disp = 1 -> affichage des nuages de points
%--------------------------------------

%Corps --------------------------------
%Initialisation -----
%[X1, X2, X3, X4] = select_data(R, opt);
X = R(1:2);
T = classes2oneofK(R(:,3));
% -------------------

fitcls(X,T);
%--------------------------------------