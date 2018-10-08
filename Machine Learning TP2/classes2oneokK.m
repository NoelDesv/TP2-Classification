function [ ToneofK ] = classes2oneofK( T )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
R = 1:numel(T);
ToneofK = zeros(numel(T),max(T));
ToneofK(sub2ind(size(ToneofK),R,T)) = 1
end

