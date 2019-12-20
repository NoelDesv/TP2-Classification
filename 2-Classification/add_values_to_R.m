function [ R ] = add_values_to_R(R,x,y,K,Nb_points)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    for ii=0:10
        Ajout(ii+1,1)=0.2*rand+x;
        Ajout(ii+1,2)=0.2*rand+y;
        Ajout(ii+1,3)=K;
    end
    R = [R;Ajout];
end

