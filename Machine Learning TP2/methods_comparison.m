function methods_comparison( X, T, optimStruct, options)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    

    [ Wls, ersubLs] = fitcls(X, T);
    [ Wlog, ersubLog ] = fitclog(X, T, optimStruct, options);
    [ Wreg, ersubReg ] = fitcreglog(X, T, optimStruct, options);
    
        
    
    %DISPLAYING
    figure
    subplot(2,2,1)
    plot(x,y1)
    title('Subplot 1: sin(x)')

    subplot(2,2,2)
    plot(x,y2)
    title('Subplot 2: sin(2x)')

    subplot(2,2,3)
    plot(x,y3)
    title('Subplot 3: sin(4x)')

end

