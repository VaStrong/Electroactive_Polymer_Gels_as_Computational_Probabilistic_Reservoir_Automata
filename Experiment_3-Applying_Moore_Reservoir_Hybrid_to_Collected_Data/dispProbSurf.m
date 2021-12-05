function dispProbSurf(data,resoviour,threshold1,threshold2) %-31.3 and 29.3
maxTreah = max(max(data));
minTreah = min(min(data));
step = 0.5;

Out = 1:27;
In = 1:8;

possThresholds = minTreah:step:maxTreah;

[minValue1,i] = min(abs(possThresholds-threshold1));
[minValue2,j] = min(abs(possThresholds-threshold2));

temp = cell2mat(resoviour(i,j));
empty = zeros(8,27);
reservInst = empty;
reservInst(1:size(temp,1),1:size(temp,2)) = temp;

if(isempty(temp))
    disp("no resoviour")
    return;
end

[y,x] = ndgrid(In,Out);
p = [x(:),y(:)];
z = reshape(reservInst,length(Out)*length(In),1);
pointsize = 40;

figure;
scatter(p(:,2), p(:,1), pointsize, z,'filled');
cb = colorbar();
caxis([0 1]);

%surf(Out, In, reservInst);
xlabel("Input Sequence (I)")
xlim([0 9])
ylabel("Output Sequence (O_I)")
ylim([0 28])
title(["Reservoir Probability Response";"for Full Range of Inputs"])

colorTitleHandle = get(cb,'Title');
titleString = 'Probability';
set(colorTitleHandle ,'String',titleString);

end