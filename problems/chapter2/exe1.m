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
