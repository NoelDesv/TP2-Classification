function [ C ] = predcls( X, W )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   %Degr� du polynome de classification
    nbClass = length(W);
    setSize = length(X);
    nb_entree=size(X);
    %Cr�ation de la matrice ~X : Analogie avec PHI de la r�gression
    XTild = ones(setSize,nb_entree(2)+1);
    for ii=2:nb_entree(2)+1
        XTild(:,ii) = XTild(:,ii).*X(:,ii-1);
    end
    y=W*XTild';       
    for ii=1:setSize
        [~,imaxCal]=max(y(1:nbClass,ii));
        C(ii)=imaxCal;
    end
end

