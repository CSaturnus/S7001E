[X, fs] = audioread('newspapers.wav');

lambda = 0.99995;
Step_size = 10^-5;

L = X(:,1);
R = X(:,2);

L2=mean(X(1:100,1).^2);
R2=mean(X(1:100,2).^2);
LR=mean(X(1:100,1).*X(1:100,2));

k = zeros(length(X),1);

for i=2:length(X)
    dQdk = 2*(k(i-1)*L2^2+LR+k(i-1)*sqrt(L2)*sqrt(R2)+k(i-1)*R2)*(L2+LR+sqrt(L2)+R2+2*sqrt(R2));
    L2=(1-lambda)*X(i,1)^2+lambda*L2;
    R2=(1-lambda)*X(i,2)^2+lambda*R2;
    LR =(1-lambda)*L(i)*R(i)+lambda*LR;

    k(i) = k(i-1) - Step_size * sign(dQdk);
end

X_hat = L + k.*R;
Y_hat = k.*L + R;

audiowrite("sepnewspaper1.wav",X_hat/max(abs(X_hat)),fs)
audiowrite("sepnewspaper2.wav",Y_hat/max(abs(Y_hat)),fs)