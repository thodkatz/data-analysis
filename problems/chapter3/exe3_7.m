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

    ciMean = zeros(M,2);
    ciBoostMean = zeros(M,2);
    for i=1:M
        ciMean(i,1) = mean(samples(:,i)) - tinv(1-a/2,n-1) * (std(samples(:,i)) / sqrt(n));
        ciMean(i,2) = mean(samples(:,i)) + tinv(1-a/2,n-1) * (std(samples(:,i)) / sqrt(n));

        ci = bootci(M,@mean,samples(:,i));
        ciBoostMean(i,1) = ci(1);
        ciBoostMean(i,2) = ci(2);
    end

    figure(j)
    hold on
    plot(1:M,ciMean(:,1))
    plot(1:M,ciBoostMean(:,1))
    plot(1:M,ciMean(:,2))
    plot(1:M,ciBoostMean(:,2))
    legend("$\alpha_{parametric}$","$\alpha_{bootstrap}$","$\beta_{parametric}$","$\beta_{bootstrap}$",'interpreter','latex')
    title("Confidence intervals of mean estimation parametric vs boostrap for M=100 samples of length n=10")
end
