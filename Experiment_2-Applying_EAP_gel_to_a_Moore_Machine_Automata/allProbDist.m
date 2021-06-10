function allHist = allProbDist(nodesOut,dispFlag)
%generate histogrames of probabilities for the given node tree data

length = size(nodesOut,1);

combis = allcomb([1 -1],[1 -1],[1 -1]);
if(dispFlag)
    figure('WindowState', 'maximized');
end

allHist = [];

for i = 1:2^length
    if(dispFlag)
        subplot(2,2^(length-1),i);
    end
    [tempHist , tempLable] = probDist(nodesOut,combis(i,:),dispFlag);
    
    for n = 1:size(tempHist,1)
        temp = str2double(split(tempLable(n)));
        loc = 1;
        for j = 1:length
            if (isnan(temp(j)))
                loc = [loc,loc+length^(j-1),loc+2*length^(j-1)];
            else
                loc = loc + ((temp(j) + 1) * length^(j-1));
            end
        end
        allHist(i,loc) = tempHist(n)/size(loc,2);
    end
end
end