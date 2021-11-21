%% EXERCISE 7 CHAPTER 3

M = 100;
n = 10;
mu = 0;
sigma = 1;

data(:,:,1) = normrnd(mu,sigma,[n M]);
data(:,:,2) = data(:,:,1) .* data(:,:,1);

a = 0.05;
for j=1:2
    samples = data(:,:,j);

    ciStd = zeros(M,2);
    ciBoostStd = zeros(M,2);
    for i=1:M
        ciStd(i,1) = sqrt(((n-1) * var(samples(:,i))) / chi2inv(1-a/2,n-1));
        ciStd(i,2) = sqrt(((n-1) * var(samples(:,i))) / chi2inv(a/2,n-1));


        ci = bootci(M,@std,samples(:,i));
        ciBoostStd(i,1) = ci(1);
        ciBoostStd(i,2) = ci(2);
    end

    figure(j)
    hold on
    plot(1:M,ciStd(:,1))
    plot(1:M,ciBoostStd(:,1))
    plot(1:M,ciStd(:,2))
    plot(1:M,ciBoostStd(:,2))
    legend("$\alpha_{parametric}$","$\alpha_{bootstrap}$","$\beta_{parametric}$","$\beta_{bootstrap}$",'interpreter','latex')
    title("Confidence intervals of std estimation parametric vs boostrap for M=100 samples of length n=10")
end
