function nodesOut = probTree(data2, thresh1, thresh2)
%generate the state tree and probability distribution histograms
nodesOut = probTreeGen(data2, thresh1, thresh2);
nodeTreeGen(nodesOut);
allProbDist(nodesOut,true);
end

