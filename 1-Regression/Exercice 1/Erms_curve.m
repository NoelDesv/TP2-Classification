function Erms_curve(x, t, Mmax, opt)
    Minit = 1;
    Erms = ones(Mmax+1,1);
    wMatrix = zeros(Mmax + 1);
    [xTest,tTest] = generate_training_set(round(length(x)), 0.1);
    %FIRST PART : TRAINING SET -------------------------------
    for M=Minit:Mmax
        %CREATION OF MATRIX PHI FOR TRAINING
        phi = ones(length(x),M+1);
        for ii=1:M+1
            phi(:,ii) = phi(:,ii).*x;
        end
        %CREATION OF W VECTOR
        ww = pol_ls_fit(x, t, M, opt);
        wMatrix(1:size(ww),M+1) = ww;%SAVING THE W MATRIX FOR DISPLAY
        
        %CREATION OF MATRIX PHI FOR TESTING
        phiTest = ones(length(xTest),M+1);
        for ii=1:M+1
            phiTest(:,ii) = phiTest(:,ii).*xTest;
        end
        %CALCULATION OF THE 2 ERROR (Erms) FUNCTIONS (TRAINING AND TESTING)
        Ed = 0.5*(norm(phi*ww-t))^2;
        Erms(ii,1) = sqrt(2*Ed/length(x));
        EdTest = 0.5*(norm(phiTest*ww-tTest))^2;
        ErmsTest(ii,1) = sqrt(2*EdTest/length(xTest));
    end
    if opt.question == 'e'
        disp(wMatrix);
    end
    figure;
    plot(Minit+1:Mmax+1,Erms(Minit+1:Mmax+1),'b', Minit+1:Mmax+1,ErmsTest(Minit+1:Mmax+1),'r');
    legend('Training', 'Testing');
    title('Error functions','FontSize',23);
    xlabel('M : polynom degree','FontSize',15)
    ylabel('RMS Error','FontSize',15)
    drawnow
    %SECOND PART : TESTING SET -------------------------------
    %CREATION OF MATRIX PHI
    
end

