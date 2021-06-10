function getFitResoviour(data,resoviour,threshold1,threshold2,fitDegree)
%find the best fitting polynomial for the resoviour given by the thresholds
%based on the degree of the polynomial

maxTreah = max(max(data));
minTreah = min(min(data));
step = 0.5;
possThresholds = minTreah:step:maxTreah;

[minValue1,i] = min(abs(possThresholds-threshold1));
[minValue2,j] = min(abs(possThresholds-threshold2));

temp = cell2mat(resoviour(i,j));
        
if(isempty(temp))
    return;
end

achived = ceil(temp) .* (ones(size(temp,1),size(temp,2)) .* (1:size(temp,2)));
output = sum(achived .* temp,2);

input = 0:7;
[p,S] = polyfit(input,output',fitDegree);

%figure;
plot(input,output','-o');
hold on
plot(input, polyval(p, input),'-o');
xlabel("Input Sequence (I)")
ylabel("Output Sequence (O_I)")
legend('Reservoir','Polynomial')
xlim([0 7]);
ylim([0 28]);

allOneString = sprintf('%.4f, ' , p);
allOneString = allOneString(1:end-2);% strip final comma
data = strcat("Reservoir Response Against Fit Polynomial Function", strcat("For Thresholds 1&2: ",num2str(threshold1), ", ",num2str(threshold2)),strcat("Coefficients: ",allOneString),strcat("With Norm of the Residuals: ",num2str(S.normr)));
title("Reservoir Response Against Fit Polynomial Function")
disp(data);

end

