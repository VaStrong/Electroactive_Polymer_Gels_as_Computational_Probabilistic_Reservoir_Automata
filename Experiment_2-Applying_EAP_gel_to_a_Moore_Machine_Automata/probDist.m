function [hist , lables] = probDist(nodesOut,inputSeq,dispFlag)
%generate the proability distribution histogram for the given node tree
%data snd the given input sequence 

sample = 1000;
data = [];
for i = 1:1:sample
    data = [data; runProbTree(nodesOut,inputSeq)];
end

uniq = unique(data, 'rows');
hist = [];
lables = {};
for i = 1:1:size(uniq,1)
    hist = [hist ; sum(prod(data == uniq(i,:),2))];
    lables(i) = {strrep(num2str(uniq(i,:)),'2','X')};
    
    id = sum((uniq(i,:)+1).*[3^0 3^1 3^2])+1;
    lablesID(i) = {strcat(strrep(num2str(uniq(i,:)),'2','X'),':',num2str(id))};
end
hist = hist/sample;


if(dispFlag)
    x = categorical(lablesID);
    bar(x,hist);
    ylim([0,1]);
    xlabel("Output Sequence")
    ylabel("Probability")
    title(strcat("Probability of Output with Input of ",num2str(inputSeq)))
end

end

