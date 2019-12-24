function w = pol_ls_fit(x, t, M, opt)
    %INITIALISATION
    if nargin < 4 || ~isfield(opt,'meth') 
        opt.meth = 1;
    end
    if nargin < 3
        M = 3;
    end
    %LEARNING
    
    %CREATION OF MATRIX PHI
    phi = ones(length(x),M+1);
    for ii=2:M+1
        phi(:,ii) = phi(:,ii-1).*x;
    end
    %PSEUDO-INVERSE --------------------
    if opt.meth == 1 
        w = pinv(phi)*t;
    %DESCENTE DE GRADIENT --------------
    elseif opt.meth == 2 
        w = ones(M+1, 1);
        w(2,1) = 10000;
        xf = 0:0.01:1;
        sens = 1;
        %RECHERCHE DE LA CONSTANTE DE LIPSCHITZ
        L = norm(phi.'*phi);
        gamma = 0.99*2/L;
        %ITERATIONS DE LA DESCENTE DE GRADIENT
        ii = 1;
        while (sens>opt.tol & ii < opt.nitermax)
            wprev = w;
            grad = (phi')*(phi*w-t);
            w = w - gamma*grad;
            sens = norm(w - wprev)/norm(w);
            ii = ii + 1;
            lossfunct(ii) = 0.5 * norm(phi*w-t);
            if opt.verb == 2 %VISUALISATION DE LA FONCTION D'ERREUR 
                plot(1:ii,lossfunct(1:ii))
            end
        end
    end
end

