%% CHAPTER 3 EXERCISE 5 

data = readmatrix('eruption.dat');
waitTime1989 = data(:,1);
duration1989 = data(:,2);
waitTime2006 = data(:,3);

[samples,cols] = size(data);

ciStd = zeros(cols,2);
ciMean = zeros(cols,2);
h = zeros(3,1);
p = zeros(3,1);

a = 0.05;
for i=1:cols
    ciStd(i,1) = sqrt(((samples-1) * var(data(:,i))) / chi2inv(1-a/2,samples-1));
    ciStd(i,2) = sqrt(((samples-1) * var(data(:,i))) / chi2inv(a/2,samples-1));

    ciMean(i,1) = mean(data(:,i)) - tinv(1-a/2,samples-1) * (std(data(:,i)) / sqrt(samples));
    ciMean(i,2) = mean(data(:,i)) + tinv(1-a/2,samples-1) * (std(data(:,i)) / sqrt(samples));

    % chi-square test for normality
    [h(i),p(i)] = chi2gof(data(:,i));
end

fprintf("The confidence interval of the std of the waiting time 1989 is [%0.2f,%0.2f]\n",ciStd(1,1),ciStd(1,2))
fprintf("The confidence interval of the mean of the waiting time 1989 is [%0.2f,%0.2f]\n",ciMean(1,1),ciMean(1,2))
fprintf("Chi-square goodness fit test, boolean result: %d, p-value: %0.6f\n\n",h(1),p(1))

fprintf("The confidence interval of the std of the duration is 1989 [%0.2f,%0.2f]\n",ciStd(2,1),ciStd(2,2))
fprintf("The confidence interval of the mean of the duration is 1989 [%0.2f,%0.2f]\n",ciMean(2,1),ciMean(2,2))
fprintf("Chi-square goodness fit test, boolean result: %d, p-value: %0.6f\n\n",h(2),p(2))

fprintf("The confidence interval of the std of the wainting time 2006 is [%0.2f,%0.2f]\n",ciStd(3,1),ciStd(3,2))
fprintf("The confidence interval of the mean of the wainting time 2006 is [%0.2f,%0.2f]\n",ciMean(3,1),ciMean(3,2))
fprintf("Chi-square goodness fit test, boolean result: %d, p-value: %0.6f\n\n",h(3),p(3))
