function display_regularization( x, t, M, opt, std)
%CREATION OF MATRIX PHI
    N = round(0.2*numel(x));
    interval = -9:0.25:-0.5;
    
    phi = ones(length(x),M+1);
    [xTest tTest] = generate_training_set(N, std);
    phiTest = ones(length(xTest),M+1);
    
    Erms=ones(numel(interval),1);
    ErmsTest=ones(numel(interval),1);
    for ii=2:M+1
        phi(:,ii) = phi(:,ii-1).*x;
    end
    for ii=2:M+1
        phiTest(:,ii) = phiTest(:,ii-1).*xTest;
    end
    lambdaList = exp(interval);
    for ii=1:numel(interval)
        w = pol_ridge_fit(x, t, M, lambdaList(ii), opt);
        Ed = 0.5*(norm(phi*w-t))^2;
        Erms(ii,1) = sqrt(2*Ed/length(x));
        EdTest = 0.5*(norm(phiTest*w-tTest))^2;
        ErmsTest(ii,1) = sqrt(2*EdTest/length(xTest));
    end
    figure;
    plot(interval, Erms, 'r', interval, ErmsTest, 'b');
    legend('Training', 'Testing');
    title('Error functions','FontSize',23);
    xlabel('ln(lambda)','FontSize',15)
    ylabel('RMS Error','FontSize',15)
end

