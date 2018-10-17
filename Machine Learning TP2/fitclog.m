function [ W, ersub ] = fitclog(X, T, optimStruct, options)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %XTild = ones(setSize,nb_entree(2)+1,degree);
    degree = 1;
    setSize = size(X);
    nbClass = min(size(T));
    phi = ones(setSize(1),setSize(2)+1);
    for ii=2:setSize(2)+1
        phi(:,ii) = phi(:,ii).*X(:,ii-1);
    end
    W = ones(degree*setSize(2)+1, nbClass);
    %DESCENTE DE GRADIENT
    ii = 1;
    sensitivity = 1;
    while (sensitivity>optimStruct.tolerance && ii < optimStruct.nbIteration)
        wprev = W;
        %disp(phi);
        %disp(W);
        %disp(softmax(phi*W));
        grad = (phi')*(softmax(phi*W)-T); 
        %grad = (phi')*(softmax(phi*w)-t);
        W = W - optimStruct.gamma*grad;
        sensitivity = norm(W - wprev)/norm(W);
        ii = ii + 1;
        err(ii) = 0.5 * norm(phi*W-T);
        if options.disp == 2 %VISUALISATION DE LA FONCTION D'ERREUR 
            plot(1:ii,err(1:ii))
        end
    end
    y=W*phi';
    ersub=0;
    for ii=1:setSize
        [~,imaxCal]=max(y(1:nbClass,ii));
        [~ ,imaxReel]= max(T(ii,1:nbClass));
        if (imaxCal~=imaxReel)
            ersub=ersub+1;
        end
    end
    ersub=ersub/setSize(1);
end
