function dispResoviours(data,resoviour,fitDegree)
%generate the error of fitting a plynomial to the probability histogram
%generated from each threshold pair for the given degree

maxTreah = max(max(data));
minTreah = min(min(data));
step = 0.5;
possThresholds = minTreah:step:maxTreah;

%values = zeros(size(resoviour,1),size(resoviour,2),8);

fit = nan * ones(size(possThresholds,2),size(possThresholds,2));
poly = nan * ones(size(possThresholds,2),size(possThresholds,2),fitDegree+1);

%figure;
%colormap(parula);
%cmap = colormap;

for i = 1:size(resoviour,1)
    for j = 1:size(resoviour,2)
        temp = cell2mat(resoviour(i,j));
        
        if(isempty(temp))
            continue;
        end
        
        achived = ceil(temp) .* (ones(size(temp,1),size(temp,2)) .* (1:size(temp,2)));
        output = sum(achived .* temp,2);
        
        input = 0:7;
        [p,S] = polyfit(input,output',fitDegree);
        fit(i,j) = S.normr;
        poly(i,j,:) = p;
        
        %figure;
        %plot(input,output');
        %hold on
        %plot(input, polyval(p, input));
        
        
        %for n = 1:8
        %    scatter3(possThresholds(i),possThresholds(j),n-1,'filled','MarkerFaceColor',cmap(round(values(i,j,n)*2),:));
        %    hold on
        %end
    end
    %drawnow;
end
%hold off

surf(possThresholds,possThresholds,fit);
xlabel("Threshold 2 (deg)")
ylabel("Threshold 1 (deg)")
zlabel("Norm of the Residuals")
title({"Norm of the Residuals from Fitted Polynomial",strcat("for Polynomial Power ",num2str(fitDegree))})
caxis([0,35]);
view(180,90);
shading interp

end

