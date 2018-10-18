function methods_comparison( X, T, optimStruct, options)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    minx = options.scatter.minx;
    maxx = options.scatter.maxx
    miny = options.scatter.miny;
    maxy = options.scatter.maxy;
    nbp = options.scatter.nbp;
    
    figure;

    [ Wls, ersubLs] = fitcls(X, T);
    disp('least :');
    disp(Wls);
    plotdecr(Wls,minx,maxx,miny,maxy,nbp,1);
    [ Wlog, ersubLog ] = fitclog(X, T, optimStruct, options);
    disp('log :');
    disp(Wlog);
    plotdecr(Wlog',minx,maxx,miny,maxy,nbp,2);
    [ Wreg, ersubReg ] = fitcreglog(X, T, optimStruct, options);
    disp('reg :');
    disp(Wreg);
    plotdecr(Wreg',minx,maxx,miny,maxy,nbp,3);
    
end

