function [Wnew, E] = train_lr(X, T)
    n_iter = 600;
    eta = 0.2;
    Wold = ones(size(X, 1), size(T, 1)); %[(D + 1) X K]
    E = inf(1, n_iter);

    for i=1:n_iter
        %Calculate softmax function
        a = Wold' * X;    %[K X N]
        temp = logsumexp(a,1);  %[ 1 X N]
        logy = repmat(temp, size(Wold, 2) ,1);  %[ K X N ]
        Y = exp(a - logy);

        %Calculate error gradient
        EGrad = X * (Y - T)';

        %Calculate Error
        MultMat = T.* log(Y + 1e-40);
        E(i) = (-sum(sum(MultMat))) / size(X, 2);
        %disp(E(i));

        %Calculate New weight vector
        Wnew = Wold - (eta * EGrad);
        Wold = Wnew;
    end
end