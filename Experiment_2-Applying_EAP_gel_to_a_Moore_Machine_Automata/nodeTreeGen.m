function nodeTreeGen(nodesOut)
% generate the state tree of outcomes for the given node tree data
length = size(nodesOut,1);
nodes(1) = 0;     % Root node

nodeI = 2;
levels = 1;

lables = "Start";

for n = 1:1:length
    prevNodeI = 1+ sum(levels)-levels(end);
    sixcount = 0;
    sixFlag = 0;
    for i = 1:1:6^n
        sixcount = sixcount+1;
        if sixcount > 6
            sixcount = 1;
            sixFlag = 1;
        end
        if nodesOut(n,i) ~= 0
            if sixFlag == 1
                prevNodeI = prevNodeI+1;
                sixFlag = 0;
            end
            nodes(nodeI) = prevNodeI;
            nodeI = nodeI +1;
            
            inSymbol = 1;
            if mod(floor((i-1)/3),2) ~= 0
                inSymbol = -1;
            end
            
            outSymbol = -1*round((((i-1)/3)-floor((i-1)/3))*3+1-2);
            
            lables = [lables ; strcat(num2str(inSymbol),":",num2str(outSymbol),":",num2str(round(nodesOut(n,i),2)))];
        end
    end
    levels = [levels nodeI-sum(levels)-1];
end

figure('WindowState', 'maximized');
treeplot(nodes);
title("Probability Transition Tree");

[x,y] = treelayout(nodes);
for i=1:size(x,2)
    text(x(i),y(i),lables(i),'FontSize',8)
end
end

