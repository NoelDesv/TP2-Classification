function [ W, ersub ] = fitclog(X, T, optimStruct)
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
    w = ones(nbClass, degree*setSize(2)+1);
    size(phi)
    disp(w)
    %DESCENTE DE GRADIENT
    ii = 1;
    sensitivity = 1;
    while (sensitivity>optimStruct.tolerance && ii < optimStruct.nbIteration)
        wprev = w;
        disp(sigmoid(phi*w));
        %grad = (phi')*(sigmoid(phi*w)-T); 
        %grad = (phi')*(softmax(phi*w)-t);
        w = w - optimStruct.gamma*grad;
        sensitivity = norm(w - wprev)/norm(w);
        ii = ii + 1;
        lossfunct(ii) = 0.5 * norm(phi*w-t);
        if options.disp == 2 %VISUALISATION DE LA FONCTION D'ERREUR 
            plot(1:ii,lossfunct(1:ii))
        end
    end

end

