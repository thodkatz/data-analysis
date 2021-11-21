%% EXERCISE 4
% Validate E[1/x] != 1/E[x]

%n = [1e1 1e2 1e3 1e4 1e5 1e6];
n = [1e1 1e2 1e3];
test = zeros(numel(n),3);
count = 1;
for i=n
    randomNum = rand(i,1) + 1;        % [1,2]
    test(count,1) = mean(1./randomNum) - 1/mean(randomNum);

    randomNum = rand(i,1);            % [0,1]
    test(count,2) = mean(1./randomNum) - 1/mean(randomNum);

    randomNum = 2*rand(i,1) - 1;      % [-1,1]
    test(count,3) = mean(1./randomNum) - 1/mean(randomNum);

    count = count + 1;
end

%figure
labels = categorical(cellstr(compose("%.1e",n)));
%bar(labels,test)
subplot(3,1,1)
plot(labels,test(:,1),'b--o')
legend('[1,2]')
xlabel('Samples')
ylabel('E[1/X] - 1/E[X]')

subplot(3,1,2)
plot(labels,test(:,2),'b--o')
legend('[0,1]')
xlabel('Trials')
ylabel('E[1/X] - 1/E[X]')

subplot(313)
plot(labels,test(:,3),'b--o')
legend('[-1,1]')
xlabel('Trials')
ylabel('E[1/X] - 1/E[X]')

% COMMENTS
% Compare results for ranges [0,1] and [-1,1]:
% The deviation of E[1/X] with respect to 1/E[X] is greater for the range [-1,1]. This happens because 
% we have large values a) due to E[X] close to zero (thus division -> inf) and b) X close to zero 
% (thus 1/X -> large values)
