function [Labels, wrong] = test_nn(W1, W2, XTest)
    Aj = W1' * XTest;  %[M X N]
    %tanh function calculation for hidden layer
    Zj = tanh(Aj./180);    %[M X N]

    Ak = W2' * Zj; %[K X N]
    %Calculate softmax function at output layer
    temp = logsumexp(Ak,1);  %[ 1 X N]
    logy = repmat(temp, size(W2, 2) ,1);  %[ K X N ]
    Y = exp(Ak - logy);    %[K X N]
    
    Labels = zeros(size(XTest,2),1);

    [M,index] = max(Y, [], 1);
    
    for i=1:size(XTest,2)
        Labels(i,1) = index(i) - 1;
    end
    
    wrong = zeros(10,1);
    
    for i = 0:9
        for j = 1:150
            index = 150*i+j;
            
            if(Labels(index,1)~=i)
                wrong(i+1,1)=wrong(i+1,1)+1;
            end
            
        end
    end
end