function [ W, ersub ] = fitcreglog(X, T, optimStruct, options)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %XTild = ones(setSize,nb_entree(2)+1,degree);
    alpha = optimStruct.gamma;
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
        grad = (phi')*(softmax(phi*W)-T) + alpha*norm(W); 
        %grad = (phi')*(softmax(phi*w)-t);
        W = W - optimStruct.gamma*grad;
        sensitivity = norm(W - wprev)/norm(W);
        ii = ii + 1;
        ersub(ii) = 0.5 * norm(phi*W-T);
        if options.disp == 2 %VISUALISATION DE LA FONCTION D'ERREUR 
            plot(1:ii,ersub(1:ii))
        end
    end

end

