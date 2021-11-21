%% EXERCISE 5

mu    = 4;
sigma = 0.01;
probIronDestroy = normcdf(3.9,mu,sigma);
threshold = norminv(0.01,mu,sigma);

fprintf("The probability for an iron to be destroyed, with length less than 3.9, is %.4e\n",probIronDestroy);
fprintf("The length threshold required to have less than 0.01 probability for an iron to be destroyed is %.4e\n",threshold);
