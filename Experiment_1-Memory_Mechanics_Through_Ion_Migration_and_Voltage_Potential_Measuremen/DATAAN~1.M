function currentAnalysis(Data)
% take the raw data and organise it against time titled by the input
% sequence that casued it
[dataLenght,inputs,dataNum] = size(Data);

close all
figCurrent = figure;
figShunt = figure;

for i = 1 : 1 : dataNum
    temp = Data(:,:,i);
    temp = temp(any(temp,2),:);
    n = find( temp < -1 | temp > 1, 1 );
    offset = temp(n,6);
    time = ((temp(:,6)-offset)/1000)+10;
    current = temp(:,3);
    shunt = temp(:,1);
    %shunt = smoothdata(shunt,'gaussian',20);
    
    %dy = diff(shunt)./diff(time);
    %plot(time(1:length(time)-1),dy);
    
    %offset = 9;
    
    %resistance = shunt./(current/1000);
    
    set(0,'CurrentFigure',figCurrent)
    subplot(dataNum,1,i);
    plot(time,current);
    xlim([0 420])
    ylim([-200 200])
    
    set(0,'CurrentFigure',figShunt)
    subplot(dataNum,1,i);
    plot(time,shunt);
    xlim([0 420])
    ylim([-18 18])
    
end
set(0,'CurrentFigure',figCurrent)
han=axes(figCurrent,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
xlabel(han,'Time (s)');
ylabel(han,'Current (mA)');
title("Gel Current Draw Over Time with Diffrent Stimulation Sequences");

set(0,'CurrentFigure',figShunt)
han=axes(figShunt,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
xlabel(han,'Time (s)');
ylabel(han,'Shunt Voltage Potential (V)');
title("Gel Potential Over Time with Diffrent Stimulation Sequences")
end

