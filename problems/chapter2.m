%% EXERCISE 1
% Verify the probability definition as the limit of the empirical frequency
% increasing the number of trials. Use as an experiment the coin flip


n = [1e1 1e2 1e3 1e4 1e5 1e6];
head = squeeze(zeros(numel(n),1));
tail = squeeze(zeros(numel(n),1));
count = 1;
for i=n
    randomNum = rand(i,1);
    head(count) = numel(find(randomNum > 0.5))/i;
    tail(count) = numel(find(randomNum < 0.5))/i;
    count = count + 1;
end


labels = categorical(cellstr(compose("%.1e",n)));
bar(labels,[head tail])
legend('head','tail')
xlabel('Trials')
ylabel('Probability')

%% EXERCISE 2
lambda = 1;

% generate random numbers using uniform distribution
y = -1/lambda*log(1-rand(1e3,1));

histogram(y,'Normalization','pdf')

%show exponential 0-1
hold on
x = 0:0.01:10;
showExp = pdf('Exponential',x,1/lambda);
plot(x,showExp,'LineWidth',2)

xlabel('$X$','Interpreter','latex')
ylabel('$f_{x}(X)$','Interpreter','latex')

%% EXERCISE 3
n = 1e3;
testbed = squeeze(zeros(n,1));
count = 1;
for i=1:n
    %[x,y] = mvnrnd(0,1,1e6);
    x = rand(1e6,1);
    y = rand(1e6,1);
    testbed(i) = var(x+y) - (var(x) + var(y));
end

histogram(testbed,'Normalization','probability')