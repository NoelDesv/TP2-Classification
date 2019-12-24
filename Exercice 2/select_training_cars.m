function [ mpgTrain, wTrain, hTrain, cTrain, mTrain ] = select_training_cars( MPG, ...
    Weight, Horsepower, Cylinders, Model_Year, trainingNumber)
    
    numberList = randperm(numel(MPG));
    randomList = numberList(1:trainingNumber);
    testingList = numberList(trainingNumber+1:numel(MPG));
    trainingList = [];
    for ii=1:numel(randomList)
        if ~isnan(MPG(randomList(ii)))
            %disp('in');
            trainingList = [trainingList, randomList(ii)];
        end
    end
    %disp(numel(randomList));
    %disp(numel(trainingList));
    %disp(randomList);
    %disp('jgirjgiej');
    %disp(trainingList);
    mpgTrain = MPG(trainingList);
    wTrain = Weight(trainingList);
    hTrain = Horsepower(trainingList);
    cTrain = Cylinders(trainingList);
    mTrain = Model_Year(trainingList);
end

