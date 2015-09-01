X0 = importdata('feature\features_train\0.txt');
X1 = importdata('feature\features_train\1.txt');
X2 = importdata('feature\features_train\2.txt');
X3 = importdata('feature\features_train\3.txt');
X4 = importdata('feature\features_train\4.txt');
X5 = importdata('feature\features_train\5.txt');
X6 = importdata('feature\features_train\6.txt');
X7 = importdata('feature\features_train\7.txt');
X8 = importdata('feature\features_train\8.txt');
X9 = importdata('feature\features_train\9.txt');

X = [X0; X1; X2; X3; X4; X5; X6; X7; X8; X9];

%Adding bias to X
X = [ones(size(X,1),1) X];

X = X';  %[(D + 1) X N]

T0 = [1 0 0 0 0 0 0 0 0 0];
T0 = repmat(T0, size(X0,1), 1);

T1 = [0 1 0 0 0 0 0 0 0 0];
T1 = repmat(T1, size(X1,1), 1);

T2 = [0 0 1 0 0 0 0 0 0 0];
T2 = repmat(T2, size(X2,1), 1);

T3 = [0 0 0 1 0 0 0 0 0 0];
T3 = repmat(T3, size(X3,1), 1);

T4 = [0 0 0 0 1 0 0 0 0 0];
T4 = repmat(T4, size(X4,1), 1);

T5 = [0 0 0 0 0 1 0 0 0 0];
T5 = repmat(T5, size(X5,1), 1);


T6 = [0 0 0 0 0 0 1 0 0 0];
T6 = repmat(T6, size(X6,1), 1);


T7 = [0 0 0 0 0 0 0 1 0 0];
T7 = repmat(T7, size(X7,1), 1);


T8 = [0 0 0 0 0 0 0 0 1 0];
T8 = repmat(T8, size(X8,1), 1);


T9 = [0 0 0 0 0 0 0 0 0 1];
T9 = repmat(T9, size(X9,1), 1);

T = [T0; T1; T2; T3; T4; T5; T6; T7; T8; T9]';   %[K X N]

save X.mat X;
save T.mat T;