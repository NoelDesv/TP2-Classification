function [ W, B ] = training_network( W, B, X, Y, nn )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    gradstock.W.input = zeros(nn.nunits, nn.sizex,50);
    gradstock.W.deep = zeros(nn.nunits, nn.nunits, nn.nlayer);
    gradstock.W.output = zeros(1, nn.nunits);
    gradstock.B.deep = zeros(nn.nunits,nn.nlayer);
    gradstock.B.output = 0;
    
    for ii=1:nn.ntrain
        [ A, H, Loss, g ] = fprop(W, B, X(ii,:), Y(ii,:), nn);
        L(ii)=Loss;
        grad = bprop(W, A, H, Loss, g, nn);  
        [W,B,gradstock,nn] = modif_weight(W, B, grad, nn,gradstock);
    end
    
    figure;
    plot(1:nn.ntrain, L);

end