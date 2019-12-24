clear all;

% CONSTANT SETTINGS --------------
nn.ntrain = 100; % Number of training X
nn.trainstd = 0,01; % Value of the standard deviation
nn.nbitgrad=1;
nn.nlayer = 1; % WARNING : nlayer corresponds to the number of HIDDEN layers
nn.nunits = 2; % number of units in hidden layers
nn.sizex = 2; %number of input data
nn.sizey = 1; %number of output data
nn.activf = 'tanh'; %activation function
nn.task = 'regress'; %type of solver (classification, regression ...)
nn.theta = 0.01; % value of the gradient coefficient
%----------------------------------------------------

% DISPLAYING OPTIONS ------------------------------
options.disp = 0;
    %options.disp = 1 -> affichage des nuages de points
  
% INITIALISATION ----------------------------------

[X,Y] = generate_training_set(nn);
%DISPLAYING
if options.disp == 1
    figure;
    [x1,x2]=meshgrid(0:.1:1,0:.1:1);
    y1 = sin(x1*2*pi)+cos(x2);
    
    plot3(X(:,1),X(:,2),Y(:,1), 'o');
    mesh(x1,x2,y1);
    %legend('Original function', 'Regression function', 'Sampled data');
end




%PROGRAM BODY ----------------------------------
%------- Construction of the neural network ----------

W.input = randn(nn.nunits, nn.sizex);
W.deep = randn(nn.nunits, nn.nunits, nn.nlayer);
W.output = randn(1, nn.nunits);

B.deep = zeros(nn.nunits,nn.nlayer);
B.output = 0;

%------- Machine Learning ----------


[W,B] = training_network( W, B, X, Y, nn );

for(ii=1:nn.ntrain)
Ycalc(ii,1)  = testing_network( X(ii,:), W,B, nn );
Err(ii)=abs(Ycalc(ii)-Y(ii));
end
Errtot=mean(Err)
%END OF PROGRAM BODY ----------------------------------