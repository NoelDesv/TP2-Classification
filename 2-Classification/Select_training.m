function [ X_train, T_train, X_test, T_test ] = Select_training( Data_fleur )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    indice_Test=0;
    indice_Train=0;
    for ii=1:length(Data_fleur)    
        if rand>0.8
            indice_Test=indice_Test+1;
            X_test(indice_Test,1:2)=Data_fleur(ii,1:2);
            T_test(indice_Test,1)=Data_fleur(ii,3);
        else
            indice_Train=indice_Train+1;
            X_train(indice_Train,1:2)=Data_fleur(ii,1:2);
            T_train(indice_Train,1)=Data_fleur(ii,3);        
        end
    end
end

