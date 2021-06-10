function Resoviour = getResoviour(data2)
%generate resoviour by generateing a histogram distrubution for each
%combination of thresholds
data = rearrange2to1(data2);

maxTreah = max(max(data));
minTreah = min(min(data));
step = 0.5;

thresholds = minTreah:step:maxTreah;

Resoviour = {};

for thresh1 = 1:1:length(thresholds)
    for thresh2 = 1:1:length(thresholds)
        if(thresholds(thresh1) < thresholds(thresh2))
            nodesOut = probTreeGen(data2, thresholds(thresh1), thresholds(thresh2));
            allHist = allProbDist(nodesOut,false);
            Resoviour(thresh1,thresh2) = {allHist};
        end
    end
end

end

