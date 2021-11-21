%% EXERCISE 3
% Validate var(x+y) != var(x) + var(y) for dependent r.d x,y

n = 1e3;
test = squeeze(zeros(n,1));
mu = [0 0];
sigma = [1 1.5; 1.5 3];
for i=1:n
    r = mvnrnd(mu,sigma,10);
    x = r(:,1);
    y = r(:,2);
    test(i) = var(x+y) - (var(x) + var(y));
end

h = histogram(test,'Normalization','probability');
h.BinWidth = 0.05;
title("Histogram of var(x+y) - (var(x) + var(y)")
