function resoviourPredicability(data,resoviour)
%generate heat map for predicatiblty of the resoviour

maxTreah = max(max(data));
minTreah = min(min(data));
step = 0.5;
possThresholds = minTreah:step:maxTreah;

predicability = nan * ones(size(possThresholds,2),size(possThresholds,2));

for i = 1:size(resoviour,1)
    for j = 1:size(resoviour,2)
        
        resoviourInce = cell2mat(resoviour(i,j));
        if(isempty(resoviourInce))
            continue;
        end
        
        achived = ceil(resoviourInce) .* (ones(size(resoviourInce,1),size(resoviourInce,2)) .* (1:size(resoviourInce,2)));
        average = sum(achived .* resoviourInce, 2);
        diff = (achived - average).^2;
        diff(achived == 0) = 0;
        count = sum(resoviourInce>0,2);
        varience = sum(diff,2)./count;
        
        %varience = var(resoviourInce');
        predicability(i,j) = sum(varience.^2);
        
    end
end

figure;
surf(possThresholds,possThresholds,predicability);
xlabel("Threshold 2 (deg)")
ylabel("Threshold 1 (deg)")
zlabel("Predicability")
title({"Unpredictability of Output of Reservoir","From Database Against Thresholds"})
%caxis([0,35]);
view(180,90);
shading interp

h = colorbar;

ylabel(h, "Unpredictability",'FontSize',15);

maximum = max(max(predicability));
[indexI,indexJ]=find(predicability==maximum);
disp(possThresholds(indexI));
disp(possThresholds(indexJ));

end

