function outputSeq = runProbTree(nodesOut,inputSeq)
%run through the node tree data using the input seuqnec to generate an
%output sequence

length = size(nodesOut,1);
location = [];
outputSeq = [];
for n = 1:1:length
    location = [location inputSeq(n)];
    
    %-----------------------------------------position calc
    position = 1;
    l = size(location,2);
    width = (2^ceil((l+1)/2))*(3^((l+1)-ceil((l+1)/2)));
    for i = 1:l
        if mod(i,2) == 1 %odd input
            if location(i) == -1
                if i == 1
                    position = position + width/2;
                else
                    position = position + width/((2^ceil((l-(l-i)/2)/2))*(3^((l-(l-i)/2)-ceil((l-(l-i)/2)/2))));
                end
            end
        else %even output
            temp = 3^(ceil((l-i)/2))*(l-1);
            if location(i) == 0
                position = position + temp;
            elseif location(i) == -1
                position = position + 2*temp;
            end
        end
    end
    %---------------------------------------------------------
    
    prec = nodesOut(n,position:position+2);%[0.33 0.33 0.33];
    
    dist = [1*ones(1,round(prec(1)*100)) 0*ones(1,round(prec(2)*100)) -1*ones(1,round(prec(3)*100))];
    if prec == [0 0 0]
        outputSeq = [outputSeq 2];
    else
        outputSeq = [outputSeq dist(randi(size(dist,2)))];
    end
    
    location = [location outputSeq(n)];
    
end
end

