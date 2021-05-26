clc 
clear ALL

data = xlsread('Admission_classifier.csv');

data = data(:,2:end);

[r c] = size(data);

dataTrain = data(1:300,:);
dataTest = data(301:400,:);

[trainR trainC] = size(dataTrain);
[testR testC] = size(dataTest);

dataGRETOEFL = dataTrain(:,1:2);
y_train = dataTrain(:,trainC);

posIsIndex = find(y_train == 1);
negIsIndex = find(y_train == -1);

A_train = [ones(trainR,1), dataTrain(:,1:trainC-1)];
c_hat = inv(A_train'*A_train)*A_train'*y_train;

A_test = [ones(testR,1), dataTest(:,1:testC-1)];
y_test = dataTest(:,testC);

figure;
plot(dataTrain(posIsIndex,1), dataTrain(posIsIndex,2),'o');
hold on
plot(dataTrain(negIsIndex,1), dataTrain(negIsIndex,2), 'r*');
hold on

x1 = [280:350];
x2 = ( -c_hat(1) - c_hat(2)*x1 )    /   c_hat(3);
    
plot(x1,x2,'-');
hold off

%A_test = [ ones(testR,1), dataTest(:,1:testC-1)]

y_test_PR = sign(A_test*c_hat);
y_test_GT = dataTest(:,testC);
       
correctClassificationPosition = find(y_test_PR == y_test_GT);
accuracy = size(correctClassificationPosition)/size(y_test_GT);

allPosIndex = find(y_train == 1)
allNegIndex = find(y_train == -1)

%plot(x1,x2,'-');

       