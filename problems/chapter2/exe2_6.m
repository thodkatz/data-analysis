%% EXERCISE 6

N = 1e4;
means = squeeze(zeros(N,1));
for i=1:N
    means(i) = mean(rand(100,1));
end

%histogram(means,'Normalization','probability','BinWidth',0.005)
histfit(means)
