load('X.mat');  %[(D + 1) X N]
load('T.mat');  %[K X N]
tic;
[Wnew1, Wnew2, E] = train_nn(X, T);

load('XTest.mat');

[Labels, wrong] = test_nn(Wnew1, Wnew2, XTest);
misclass = sum(sum(wrong));
fprintf('The no. of misclassified images are %d \n', misclass);
error_rate = (misclass / size(XTest,2)) * 100;
fprintf('\nThe error rate is %0.1f %% \n', error_rate);
rec_rank = find(Labels==0);
fprintf('\nThe reciprocal rank is %0.1f \n', 1/rec_rank(1));
toc;