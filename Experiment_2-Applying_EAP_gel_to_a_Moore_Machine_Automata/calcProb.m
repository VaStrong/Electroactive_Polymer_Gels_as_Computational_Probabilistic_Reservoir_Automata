function prob = calcProb(data,thresh1,thresh2)
%calculate the probability of output sequences beingthe same each run
probs = zeros(size(data,1),1);

for i = 1:1:size(data,1)
    sample = data(i,data(i,:) ~= 0);
    temp = (sample > thresh2) - (sample < thresh1);
    temp2 = [sum(temp == -1)/length(temp) sum(temp == 0)/length(temp) sum(temp == 1)/length(temp)];
    probs(i) = max(temp2);
end
prob = mean(probs);
end

