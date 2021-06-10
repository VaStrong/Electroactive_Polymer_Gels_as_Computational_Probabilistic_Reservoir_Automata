function threshProb(data2)
%generate the graphs of the probability, uniqe sequences and stnadard
%deviatio to find the most divers threshold values

data = rearrange2to1(data2);

maxTreah = max(max(data));
minTreah = min(min(data));
step = 0.5;

thresholds = minTreah:step:maxTreah;

prob = ones(length(thresholds),length(thresholds))*nan;
uniq = ones(length(thresholds),length(thresholds))*nan;
devis = ones(length(thresholds),length(thresholds))*nan;
error =  ones(length(thresholds),length(thresholds))*nan;

for thresh1 = 1:1:length(thresholds)
    for thresh2 = 1:1:length(thresholds)
        if(thresholds(thresh1) < thresholds(thresh2))
            prob(thresh1,thresh2) = calcProb(data,thresholds(thresh1),thresholds(thresh2));
            uniq(thresh1,thresh2) = calcUniq(data2,thresholds(thresh1),thresholds(thresh2));
            devis(thresh1,thresh2) = calcDeviation(data2,thresholds(thresh1),thresholds(thresh2));
        end
    end
end

uniqMap = (uniq - min(min(uniq))) / ( max(max(uniq)) - min(min(uniq)) );
devisMap = (devis - min(min(devis))) / ( max(max(devis)) - min(min(devis)) );

for thresh1 = 1:1:length(thresholds)
    for thresh2 = 1:1:length(thresholds)
        if(thresholds(thresh1) < thresholds(thresh2))
            error(thresh1,thresh2) = (1-prob(thresh1,thresh2))^2 + (1-uniqMap(thresh1,thresh2))^2 + devisMap(thresh1,thresh2)^2;
        end
    end
end

[temp indexY] = min(error);
[temp indexX] = min(temp);
indexY = indexY(indexX);

thresh1Sel = thresholds(indexY);
disp(strcat("Threshold 1: ",num2str(thresh1Sel)));
thresh2Sel = thresholds(indexX);
disp(strcat("Threshold 2: ",num2str(thresh2Sel)));

%scaledUniq = interp1([0,max(max(uniq))],[0,1],uniq);
%scaledDevis = interp1([0,max(max(devis))],[0,1],devis);

%figure;
% colormap([1 0 0;0 0 1]);
% h1 = surf(thresholds,thresholds,prob,ones(length(thresholds)));
% hold on
% h2 = surf(thresholds,thresholds,scaledUniq,ones(length(thresholds))+2);
% xlabel("Threshold 2 (deg)")
% ylabel("Threshold 1 (deg)")
% zlabel("Value")
% title("Thresholds to Probability and Num of Unique Output Sequences")
% 
% legend([h1, h2], {'Probability (%)', strcat('Number of Uniqur Output Sequences (X',num2str(max(max(uniq))),')')});

figure;
subplot(2,2,1);
surf(thresholds,thresholds,prob);
hold on
plot3(thresh2Sel,thresh1Sel,prob(indexY,indexX),'rx');
hold off
xlabel("Threshold 2 (deg)")
ylabel("Threshold 1 (deg)")
zlabel("Probability (%)")
title("Thresholds to Probability")
view(180,90);
c = colorbar;
c.Label.String = 'Thresholds to Probability';
shading interp
xlim([minTreah maxTreah]) 
ylim([minTreah maxTreah])

subplot(2,2,2);
surf(thresholds,thresholds,uniq);
hold on
plot3(thresh2Sel,thresh1Sel,uniq(indexY,indexX),'rx');
hold off
xlabel("Threshold 2 (deg)")
ylabel("Threshold 1 (deg)")
zlabel("Num of Unique Output Sequences")
title({"Thresholds to Num of" ; "Unique Output Sequences"})
view(180,90);
c = colorbar;
c.Label.String = 'Num of Unique Output Sequences';
shading interp
xlim([minTreah maxTreah]) 
ylim([minTreah maxTreah])

subplot(2,2,3);
surf(thresholds,thresholds,devis);
hold on
plot3(thresh2Sel,thresh1Sel,devis(indexY,indexX),'rx');
hold off
xlabel("Threshold 2 (deg)")
ylabel("Threshold 1 (deg)")
zlabel("Standard Distrabution of Ouput Symbols")
title({"Thresholds to Standard" ; "Distrabution of Ouput Symbols"})
view(180,90);
c = colorbar;
c.Label.String = 'Standard Distrabution of Ouput Symbols';
shading interp
xlim([minTreah maxTreah]) 
ylim([minTreah maxTreah])

subplot(2,2,4);
surf(thresholds,thresholds,error);
hold on
plot3(thresh2Sel,thresh1Sel,error(indexY,indexX),'rx');
hold off
xlabel("Threshold 2 (deg)")
ylabel("Threshold 1 (deg)")
zlabel("Error")
title("Sum of Errors of Criteria")
view(180,90);
c = colorbar;
c.Label.String = 'Error';
shading interp
xlim([minTreah maxTreah]) 
ylim([minTreah maxTreah])

end

