
%INITIALISATION OF PARAMETERS
N = 25;
std = 0.1;
M = 6;
lambda = 0.01;

%OPTIONS ----------------------------------------------------------------
opt.question = 'g'; %fonctions à éxecuter en fonction de la question du TP

opt.meth = 2; %méthode de résolution de la régression linéaire :

%opt.meth = 1 -> méthode par pseudo-inverse
%opt.meth = 2 -> méthode par descente de gradient

opt.tol = 10^-5; %tolérance de la descente de gradient
opt.nitermax = 10^6; %nombre d'itérations maximal pour la DG
opt.verb = 3; %mode d'affichage des différentes fenêtres :

%opt.verb = 0 -> aucun affichage
%opt.verb = 1 -> affichage des données 
% et de la fonction réelle
%opt.verb = 2 -> affichage de la fonction d'erreur

%DIFFERENT FONCTIONS --------------------------
[x,t] = generate_training_set(N, std);

if opt.question == 'b'
    w = pol_ls_fit(x, t, M, opt);
end
if opt.question == 'c'
    w = pol_ls_fit(x, t, M, opt);
    w2 = polyfit(x,t,M);
    plot(xf,sin(2*pi*xf), xf,polyval(flip(w),xf),'x',x , t, 'o', xf, polyval(w2,xf),'b');
    legend('Original function', 'Regression function', 'Sampled data','Polyfit');
end
if opt.question == 'd' || opt.question == 'e'
    Erms_curve(x, t, M, opt);
end
if opt.question == 'f'
    w = pol_ridge_fit(x, t, M, lambda,opt);
    plot(xf,sin(2*pi*xf), xf,polyval(flip(w),xf),'x',x , t, 'o');
    legend('Original function', 'Regression function', 'Sampled data');
end
if opt.question == 'g'
    display_regularization( x, t, M, opt, std);
end

% ---------------------------------------------

%DISPLAYING
if opt.verb <= 1
    figure;
    xf = 0:0.01:1;
    plot(xf,sin(2*pi*xf), xf,polyval(flip(w),xf),'x',x , t, 'o', xf);
    legend('Original function', 'Regression function', 'Sampled data');
end

