function data1 = rearrange2to1(data2)
% rearranges the data from the layout in excel to that needed for matlab
% analysis
length = size(data2,1);

data1 = [];
%counter = 0;
    for j = 1:1:(size(data2,2)/(2^length)) %round
        for s = 1:2 %first input
            for n = 1:1:length %depth
                for i = 1:1:(2^n)/2 %width ((s-1)*4+i)
                    pos1 = (j-1)*2^length + (s-1)*4 + (i-1)*((2^length)/(2^n))+1;
                    pos2 = pos1 + 2^(length-n)-1;
                    data = data2(n,pos1:pos2);
                    
                    %counter = counter+1;
                    %disp(counter);
                    
                    place = 0.5*(j-1)*2^length + (i-1)*((2^length)/(2^n))+1;
                    
                    data1( ((s-1)*((2^length)-1))+(2^(n-1))+i-1 , place:place+size(data,2)-1 ) = data;
                end
            end
        end
    end

end

