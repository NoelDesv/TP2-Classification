function [ A, H, Loss, g ] = fprop(W, B, X, Y, nn)
    
    %H.input = X(1,:)';
    %H.output = Y(1,:)'; % On s'en fiche des valeurs, on veut que les dimensions
    H.input=X';
    H.output=Y';
    
    H.deep = zeros(nn.nunits,nn.nlayer); % A modifier
    
    A.deep = zeros(nn.nunits,nn.nlayer);
    
    % FORWARD PROPAGATION -------------------------------------------
    %Couche 1 -> Couche L
    for k = 1:nn.nlayer
        if(k == 1) % Initial case (number of layer-0 units != number of other layer units
            A.deep(:,1) = B.deep(:,1) + W.input*H.input;
            H.deep(:,1) = tanh(A.deep(:,1));
        else
            A.deep(:,k) = B.deep(:,k) + W.deep(:,:,k-1)*H.deep(:,k-1);
            H.deep(:,k) = tanh(A.deep(:,k));
        end
    end
    
    % Dernier couche, dernier noeud --------------
    A.output = B.output + W.output*H.deep(:,nn.nlayer);
    H.output = tanh(A.output);
    
    % END FORWARD PROPAGATION -------------------------------------------
    
    % Loss function calculation
    if(nn.task == 'regress')
        Ycalc = H.output;
    else
        Ycalc = 0;
    end
    Loss = 0.5*(Ycalc - Y)^2;
    g = Ycalc - Y;
    
end