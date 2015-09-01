function [Wnew1, Wnew2, E] = train_nn(X, T)
    n_iter = 1000;
    eta1 = 0.00015;
    eta2 = 0.00015;
    M = 20;
    Wnew1 = rand(size(X, 1), M) - 0.5; %[(D + 1) X M]
    Wnew2 = rand(M, size(T, 1)) - 0.5; %[M X K]
    E = inf(1, n_iter);
    
    for i=1:n_iter
        Aj = Wnew1' * X;  %[M X N]
        %tanh function calculation for hidden layer
        Zj = tanh(Aj./180);    %[M X N]
        
        Ak = Wnew2' * Zj; %[K X N]
        %Calculate softmax function at output layer
        temp = logsumexp(Ak,1);  %[ 1 X N]
        logy = repmat(temp, size(Wnew2, 2) ,1);  %[ K X N ]
        Y = exp(Ak - logy);    %[K X N]
        
        %Calculate cross entropy function
        MultMat = T.* log(Y + 1e-40);
        E(i) = (-sum(sum(MultMat))) / size(X, 2);
        %disp(E(i));
        
        delK = Y - T;  %[K X N]
        delJ = (1 - (Zj.^2)) .* (Wnew2 * delK);  %[M X N]
        
        EGrad2 = Zj * delK';
        EGrad1 = X * delJ';
        
        Wnew1 = Wnew1 - (eta1.*EGrad1);
        Wnew2 = Wnew2 - (eta2.*EGrad2);
        
        
    end
end