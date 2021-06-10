function nodesOut = probTreeGen(data2, thresh1, thresh2)
%generate the tree probability data from the raw data and threshold values

data2 = fliplr(data2);
length = size(data2,1);

rounds = [];
outputs = [];
for i = 1:1:(size(data2,2)/(2^length))
    rounds(:,:,i) = data2(:,((i-1)*2^3)+1:i*(2^length));
    outputs(:,:,i) = (rounds(:,:,i) > thresh2) - (rounds(:,:,i) < thresh1);
end

%round1 = data2(:,1:2^length);
%round2 = data2(:,(2^length)+1:2*(2^length));
%round3 = data2(:,2*(2^length)+1:3*(2^length));

%output1 = (round1 > thresh2) - (round1 < thresh1);
%output2 = (round2 > thresh2) - (round2 < thresh1);
%output3 = (round3 > thresh2) - (round3 < thresh1);

nodesOut = zeros(length,6^length);


for n = 1:1:length
    temp = [];
    Ac = [];
    [Ac{1:n}] = ndgrid([1 0 -1]);
    combi = flipud(cell2mat(cellfun(@(M) M(:), Ac, 'uniform', 0))');
    combi = reshape(combi,[n 3 size(combi,2)/3]);
    for in = [1 2]
        if in == 1 %input = 1 at start
            start = 1;
            stop = (2^n)/2;
        elseif in ==2 %input = -1 at start
            start = ((2^n)/2)+1;
            stop = (2^n);
        end
        for c = 1:size(combi,3)
            for j = start:1:stop
                pos1 = (j-1)*2^(length-n)+1;
                pos2 = j*2^(length-n);
                
                allOut = [];
                for assem = 1:1:(size(data2,2)/(2^length))
                    allOut = [allOut outputs(1:n,pos1:pos2,assem)];
                end
                
                %allOut = [output1(1:n,pos1:pos2) output2(1:n,pos1:pos2) output3(1:n,pos1:pos2)];

                for i = 1:size(combi,2)
                    top = n-1;
                    top(top < 1) = 1;
                    if n == 1
                        precnt = sum(prod(allOut == combi(:,i,c),1))/size(allOut,2);
                    else
                        precnt = sum(prod(allOut == combi(:,i,c),1))/(sum(prod(combi(1:top,i,c)==allOut(1:top,:),1)));
                    end
                    if isnan(precnt)
                        precnt = 0;
                    end
                    temp = [temp precnt]; %size(allOut,2)];
                end

            end 
        end
    end
    nodesOut(n,1:size(temp,2)) = temp;
end

end