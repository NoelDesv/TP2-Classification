load('carsmall');
%Weight Horsepower Cylinders Model_year
Mmean = zeros(5,1);%Vecteur des coefficients moyens sur 10 essais

numberTrain = 20;
numberTest = 10;
for ii=1:numberTrain
    [mpgTrain, wTrain, hTrain, cTrain, mTrain] = select_training_cars(MPG, ...
    Weight, Horsepower, Cylinders, Model_Year, 80);

    x = [ones(length(wTrain),1), wTrain, hTrain, cTrain, mTrain];
    M = regress(mpgTrain, x);
    Mmean = Mmean + M;
end
Mmean = Mmean/numberTrain;



% VISUALISATION DE LA DIFFERENCE ENTRE PREDICTION ET REALITE

mpgTheorique = ones(numberTest,1);
mpgReel = ones(numberTest,1);

[mpgTest, wTest, hTest, cTest, mTest] = select_training_cars(MPG, ...
Weight, Horsepower, Cylinders, Model_Year, 10);

mpgTheorique = M(1) + M(2)*wTest + M(3)*hTest + M(4)*cTest + M(5)*mTest;
k = 1:numberTest;
figure;
plot(k,mpgTest(k),'o',k,mpgTheorique,'x');
legend('Réalité','Prédiction');

%Calcul de l'erreur par rapport à la prédiction

Ed = 0.5*norm(mpgTheorique-mpgTest);
disp(Ed);




