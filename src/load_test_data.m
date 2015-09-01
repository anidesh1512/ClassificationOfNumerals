XTest0 = importdata('feature\features_test\0.txt');
XTest1 = importdata('feature\features_test\1.txt');
XTest2 = importdata('feature\features_test\2.txt');
XTest3 = importdata('feature\features_test\3.txt');
XTest4 = importdata('feature\features_test\4.txt');
XTest5 = importdata('feature\features_test\5.txt');
XTest6 = importdata('feature\features_test\6.txt');
XTest7 = importdata('feature\features_test\7.txt');
XTest8 = importdata('feature\features_test\8.txt');
XTest9 = importdata('feature\features_test\9.txt');

XTest = [XTest0; XTest1; XTest2; XTest3; XTest4; XTest5; XTest6; XTest7; XTest8; XTest9];

%Adding bias to X
XTest = [ones(size(XTest,1),1) XTest];

XTest = XTest';  %[(D + 1) X N]

T0 = [1 0 0 0 0 0 0 0 0 0];
T0 = repmat(T0, size(XTest0,1), 1);

T1 = [0 1 0 0 0 0 0 0 0 0];
T1 = repmat(T1, size(XTest1,1), 1);

T2 = [0 0 1 0 0 0 0 0 0 0];
T2 = repmat(T2, size(XTest2,1), 1);

T3 = [0 0 0 1 0 0 0 0 0 0];
T3 = repmat(T3, size(XTest3,1), 1);

T4 = [0 0 0 0 1 0 0 0 0 0];
T4 = repmat(T4, size(XTest4,1), 1);

T5 = [0 0 0 0 0 1 0 0 0 0];
T5 = repmat(T5, size(XTest5,1), 1);


T6 = [0 0 0 0 0 0 1 0 0 0];
T6 = repmat(T6, size(XTest6,1), 1);


T7 = [0 0 0 0 0 0 0 1 0 0];
T7 = repmat(T7, size(XTest7,1), 1);


T8 = [0 0 0 0 0 0 0 0 1 0];
T8 = repmat(T8, size(XTest8,1), 1);


T9 = [0 0 0 0 0 0 0 0 0 1];
T9 = repmat(T9, size(XTest9,1), 1);

TTest = [T0; T1; T2; T3; T4; T5; T6; T7; T8; T9]';   %[K X N]


save XTest.mat XTest;
save TTest.mat TTest;