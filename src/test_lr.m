function [Labels, wrong] = test_lr(W, XTest)

    % XTest [(D + 1) X N]
    %Calculate softmax function
    a = W' * XTest;    %[K X N]
    temp = logsumexp(a,1);  %[ 1 X N]
    logy = repmat(temp, size(W, 2) ,1);  %[ K X N ]
    Y = exp(a - logy);
    
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