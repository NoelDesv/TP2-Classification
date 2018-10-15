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
    grad = (phi')*(phi*w-T);

end

