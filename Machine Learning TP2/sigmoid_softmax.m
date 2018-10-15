function [ sigmoid ] = sigmoid( value )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    sigmoid = 1/(1+exp(-value));
end

function [ softmax ] = softmax( value )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    softmax = [];
    denominateur = 0;
    for ii= 1:length(value)
        denominateur = denominateur + exp(value(ii));
    end
    for ii= 1:length(value)
        softmax.append(exp(value(ii))/denominateur);
    end

end
