function [ ToneofK ] = classes2oneofK( T )
    %Création de la matrice de classe de type one of k en fonction du numéro de
    %la classe
    
    %Pour parcourir l'ensemble de la matrice
    R = 1:numel(T);
    %Initialisation à 0 de la matrice one of K en fonction du nombre de classes
    ToneofK = zeros(numel(T),max(T));
    %En fonction des indices linéaires obtenues avec sub2ind, rempli la matrice
    %sub2ind avec la classe correspondante
    ToneofK(sub2ind(size(ToneofK),R,T')) = 1;
end
