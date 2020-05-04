function [ res ] = bprop( Winput, Wdeep, Woutput, Adeep, Aoutput, Hinput, Hdeep, Houtput, Loss, nn )
%Backpropagation -> Calculation of the gradient

    gradWinput = zeros(nn.nunits, nn.xsize);
    gradWdeep = zeros(nn.nunits, nn.nunits, nn.nlayer);
    gradWoutput = zeros(1, nn.nunits);
    
    gradBdeep = zeros(nn.nunits,nn.nlayer);
    gradBoutput = 0;

    g = 2*Loss
    
    % FORWARD PROPAGATION -------------------------------------------
    % Derniere couche, dernier noeud --------------
    
    g = g*tanh(Aoutput)
    gradBoutput = g
    gradWoutput = g*Hdeep(:,nn.nlayer)'
    g = Woutput'*g
    
    % Couches profondes -----------------------
    
    for k = nn.nlayer:-1:2
        g = g.*Hdeep(:,k)       
        gradBdeep(:,k) = g
        gradWdeep(:,:,k) = g*Hdeep(:,k-1)'
        g = Wdeep(:,:,k-1)'*g
    end
    
    % Première couche -------------------------
    
        g = g.*tanh(Adeep(:,1))
        gradWinput = g*Hinput'
        g = Winput'*g
    
    % END FORWARD PROPAGATION -------------------------------------------
    res = 0;

end

