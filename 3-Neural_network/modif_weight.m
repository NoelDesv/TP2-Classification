function [ W, B ,gradstock,nn] = modif_weight( W, B, grad, nn,gradstock)
%UNTITLED Summary of this function goes here

    gradstock.W.input(:,:,nn.nbitgrad)=grad.W.input;
    gradstock.W.deep(:,:,:,nn.nbitgrad)=grad.W.deep;
    gradstock.W.output(:,:,nn.nbitgrad)=grad.W.output;
    gradstock.B.deep(:,:,nn.nbitgrad)=grad.B.deep;
    gradstock.B.output(:,nn.nbitgrad)=grad.B.output;
    grad.W.deep   
    for ii=1:(nn.nbitgrad-1)
    grad.W.input  = grad.W.input+gradstock.W.input(:,:,nn.nbitgrad);
    grad.W.deep=grad.W.deep+gradstock.W.deep(:,:,:,nn.nbitgrad);
    grad.W.output=grad.W.output+gradstock.W.output(:,:,nn.nbitgrad);
    grad.B.deep=grad.B.deep+gradstock.B.deep(:,:,nn.nbitgrad);
    grad.B.output=grad.B.output+gradstock.B.output(:,nn.nbitgrad);
    end
        
   grad.W.deep
   
    W.input = W.input - (nn.theta)*(grad.W.input);
    W.deep = W.deep - (nn.theta)*(grad.W.deep);
    W.output = W.output - (nn.theta)*(grad.W.output);
    B.deep = B.deep - (nn.theta)*(grad.B.deep);
    B.output = B.output - (nn.theta)*(grad.B.output);
    nn.nbitgrad =  nn.nbitgrad+1;
end