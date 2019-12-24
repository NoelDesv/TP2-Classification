function [X, Y] = generate_training_set(nn)
%GENERATION OF THE DATA
    X = ones(nn.ntrain, nn.sizex);
    Y = ones(nn.ntrain, nn.sizey);
    
    for ii=1:nn.ntrain
        for jj=1:nn.sizex
            X(ii,jj) = rand;
        end
        for kk=1:nn.sizey
            Y(ii,kk) = sin(X(ii,1)*2*pi)+cos(X(ii,2))+nn.trainstd*randn;
        end
    end
    
end

