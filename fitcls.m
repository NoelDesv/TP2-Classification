function [w,ersub] = fitcls(X,T)
%UNTITLED4 
    %Degré du polynome de classification
    nbClass = min(size(T));
    setSize = length(X);
    nb_entree=size(X);
    degree=2;
    %Création de la matrice ~X : Analogie avec PHI de la régression
    %XTild = ones(setSize,nb_entree(2)+1,degree);
    XTild = ones(setSize,nb_entree(2)+1);
    for ii=2:nb_entree(2)+1
        XTild(:,ii) = XTild(:,ii).*X(:,ii-1);
    end
    %if (degree>1)
    %for jj=2:degree
    %        XTild(:,2:(nb_entree(2)+1),jj)=XTild(:,2:(nb_entree(2)+1),jj-1).*X;
    %end
    %end
    XTild=XTild';
    w = T'*pinv(XTild);
    y=w*XTild;
    ersub=0;
    for ii=1:setSize
        [~,imaxCal]=max(y(1:nbClass,ii));
        [~ ,imaxReel]= max(T(ii,1:nbClass));
        if (imaxCal~=imaxReel)
            ersub=ersub+1;
        end
    end
    ersub=ersub/setSize;
    
    

        
  
   
        
 
end

