function [data2_gain,gainParams] = DataGain(data2)
%calcualte the gain values for each of the gel runs and show the verience
%reduction
    length = size(data2,1);
    average = [];
    varienceStart = [];
    for n = 1:1:length
        for i = 1:1:2^n
            total = [];
            for j = 1:1:(size(data2,2)/(2^length))
                pos1 = (j-1)*2^length + (i-1)*((2^length)/(2^n))+1;
                pos2 = (j-1)*2^length + i*((2^length)/(2^n));
                total = [total data2(n,pos1:pos2)];
            end
            varienceStart = [varienceStart var(total)];
            average(n,(i-1)*((2^length)/(2^n))+1:i*((2^length)/(2^n))) = mean(total);
        end
    end
    
    gainParams = [];
    for n = 1:1:size(data2,2)
        %gain = 1;
        %error = sum((data2(:,n)*gain - average(:,mod(n-1,2^length)+1)).^2);
        fun = @(G)sum((data2(:,n)*G - average(:,mod(n-1,2^length)+1)).^2); %sum of squared errors
        %fun = @(G)sum(abs(data2(:,n)*G - average(:,mod(n-1,2^length)+1))); %sum of errors
        G0 = -10;
        gain = fminsearch(fun,G0);
        gainParams = [gainParams gain];
    end
    
    data2_gain = data2.*gainParams;
    
    varienceEnd = [];
    for n = 1:1:length
        for i = 1:1:2^n
            total = [];
            for j = 1:1:(size(data2_gain,2)/(2^length))
                pos1 = (j-1)*2^length + (i-1)*((2^length)/(2^n))+1;
                pos2 = (j-1)*2^length + i*((2^length)/(2^n));
                total = [total data2_gain(n,pos1:pos2)];
            end
            varienceEnd = [varienceEnd var(total)];
        end
    end
    
    temp = 1:1:size(varienceEnd,2);
    tableDat = [temp' varienceStart' varienceEnd' (varienceStart-varienceEnd)'];
    VarNames = {'N', 'Varience_Before', 'Varience_After', 'Reduction'};
    %disp(table(tableDat(:,1),tableDat(:,2),tableDat(:,3),tableDat(:,4), 'VariableNames',VarNames));
    fprintf(1, '%s\t%s\t%s\t%s\n', VarNames{:})
    fprintf(1, '%d\t%.2f\t\t\t%.2f\t\t\t%.2f\n', tableDat')
%     for i = 1:1:size(varienceEnd,2)
%         disp(strcat(string(i),": ",string(varienceStart(i))," to ",string(varienceEnd(i))," reduction of ",string(varienceStart(i)-varienceEnd(i))));
%     end
    disp(strcat("Average reduction of ",string(mean(varienceStart-varienceEnd))));
        
end

