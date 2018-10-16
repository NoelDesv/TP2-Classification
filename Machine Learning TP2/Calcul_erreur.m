function [ erreur_total] = Calcul_erreur( Data_fleur )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
erreur_total=0;

for ii=0:10
    erreur_partiel=0;
    [ X_train, T_train, X_test, T_test ] = Select_training( Data_fleur );
    size(T_train)
    [w,~]=fitcls(X_train,classes2oneofK(T_train));
    [ C ] = predcls( X_test, w )
    for jj=1:length(X_test)
    if (C(jj)~=T_test(jj))
        erreur_partiel=erreur_partiel+1;
    end
    end
    erreur_total=erreur_total+erreur_partiel/length(X_test);
end
erreur_total=erreur_total/10;
end



