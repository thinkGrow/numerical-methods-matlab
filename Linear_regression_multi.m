 clc
clear all

data = xlsread('Admission.csv');

data = data(: , 2:9);

[r c] = size(data);

dataTrain = data (1:300, :);
dataTest  = data(301:400,:);

[trainR trainC] = size(dataTrain);
[testR testC] = size(dataTest);

A_train = [ones(trainR,1),dataTrain(:,1:trainC-(1))];
y_train = dataTrain(:,trainC);

A_test = [ ones(testR,1), dataTest(:,1:testC-1) ];
y_test = dataTest(:,testC);

c_hat = inv(A_train'*A_train)*A_train'*y_train;

y_test_predict = A_test * c_hat;

e = y_test - y_test_predict;
sse = e'*e;
avg_err = (sse/100);

student = (301:400)';
plot(student, y_test, 'ro');
hold on
plot(student, y_test_predict, 'b*');
hold off
grid on;
