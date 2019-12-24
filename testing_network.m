function [ Y ] = testing_network( X, W,B, nn )
%Pour toutes les couches
for k=1:nn.nlayer+1
        %%Entrée
        %
        if k==1
            X=tanh(W.input*X'+B.deep(1));     
        end
        %%Sortie
        %
        if k==nn.nlayer+1
            Y=tanh(W.output*X+B.output);    
        end
        %%Deep
        if k~=1 && k~=nn.nlayer+1
            X=tanh(W.deep(:,:,k)*X+B.deep(k));
        end   
end