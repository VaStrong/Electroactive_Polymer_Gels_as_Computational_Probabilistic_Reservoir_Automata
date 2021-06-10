function devi = calcDeviation(data2,thresh1,thresh2)
%calcualte the stadnadrd deviation in output sequences

temp = (data2 > thresh2) - (data2 < thresh1);

dist = [sum(temp==-1) sum(temp==0) sum(temp==1)];

devi = std(dist);

end

