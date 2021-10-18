%% EXERCISE 4
% Validate E[1/x] != 1/E[x]

n = [1e1 1e2 1e3 1e4 1e5 1e6];
test = squeeze(zeros(numel(n),3));
count = 1;
for i=n
    randomNum = rand(i,1) + 1;        % [1,2]
    test(count,1) = mean(1/randomNum) - 1/mean(randomNum);

    randomNum = rand(i,1);         % [0,1]
    test(count,2) = mean(1/randomNum) - 1/mean(randomNum);

    randomNum = 2*rand(i,1) - 1;   % [-1,1]
    test(count,2) = mean(1/randomNum) - 1/mean(randomNum);

    count = count + 1;
end

labels = categorical(cellstr(compose("%.1e",n)));
%bar(labels,test)
subplot(311)
plot(labels,test(:,1),'b--o')
legend('[1,2]')
xlabel('Trials')
ylabel('E[1/X] - 1/E[X]')

subplot(312)
plot(labels,test(:,2),'b--o')
legend('[0,1]')
xlabel('Trials')
ylabel('E[1/X] - 1/E[X]')

subplot(313)
plot(labels,test(:,3),'b--o')
legend('[-1,1]')
xlabel('Trials')
ylabel('E[1/X] - 1/E[X]')
