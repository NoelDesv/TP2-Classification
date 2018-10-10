function [W,ersub] = fitcls(X,T)
%UNTITLED4 
    %Degr� du polynome de classification
    degree = 2;
    nbClass = min(size(T));
    setSize = length(X);
    
    %Cr�ation de la matrice ~X : Analogie avec PHI de la r�gression
    XTild = ones(setSize,degree+1)
    for ii=2:degree+1
        XTild(:,ii) = XTild(:,ii-1).*X;
    end
    x = [1 X'];
    w = T'*pinv(XTild)

end

