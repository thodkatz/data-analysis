%% EXERCISE 6 CHAPTER 3

mu = 0;
sigma = 1;
n = 10;

samples(:,1) = normrnd(mu,sigma,[n,1]);
samples(:,2) = exp(samples(:,1))

for i=1:2
    data = samples(:,i);
    B = 1000;
    means = bootstrp(B,@mean,data);

    %% (a)
    figure(i)
    hold on
    histogram(means,'normalization','pdf')
    xline(mean(data),'color','red')
    text = sprintf("Mean initial sample: %0.2f (red line)",mean(data))
    title(text)
    hold off

    %% (b)
    initStandardError = std(data)/sqrt(n)
    bootStandardError = std(means)/sqrt(B)
    fprintf("Standard error of mean value for the initial sample %0.2f\n",initStandardError)
    fprintf("Standard error of mean for boostrap samples %0.2f\n\n",bootStandardError)
end
