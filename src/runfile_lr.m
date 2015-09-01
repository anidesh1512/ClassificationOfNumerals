load('X.mat');  %[(D + 1) X N]
load('T.mat');  %[K X N]
tic;
[W, E] = train_lr(X, T);

load('XTest.mat');
load('TTest.mat');

[Labels, wrong] = test_lr(W, XTest);
misclass = sum(sum(wrong));
fprintf('The no. of misclassified images are %d \n', misclass);
error_rate = (misclass / size(XTest,2)) * 100;
fprintf('\nThe error rate is %0.1f %% \n', error_rate);
rec_rank = find(Labels==0);
fprintf('\nThe reciprocal rank is %0.1f \n', 1/rec_rank(1));
toc;