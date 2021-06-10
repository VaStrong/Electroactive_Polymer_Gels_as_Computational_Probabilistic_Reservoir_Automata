function uniq = calcUniq(data2,thresh1,thresh2)
%calcualte the number of uniqe ouput sequences

temp = (data2 > thresh2) - (data2 < thresh1);

uniq = size(unique(temp', 'rows'),1);

end

