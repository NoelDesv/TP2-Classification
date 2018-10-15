function [ R ] = add_values_to_R(R)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    for ii=0:10
        Ajout(ii+1,1)=0.2*rand+0;
        Ajout(ii+1,2)=0.2*rand+5;
        Ajout(ii+1,3)=1;
    end
    R = [R;Ajout];
end

