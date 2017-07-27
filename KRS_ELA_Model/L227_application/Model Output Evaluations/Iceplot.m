% Remi Bouyssou - ELA MyLake
% Ice plot
% Make graphs of lake freezing and breaking ice dates compared to observed data

IceDate=His(7,:);
B=[datenum(m_start):datenum(m_stop)];
C=[B;IceDate]'; % matrix date and ice on or off
j=1; % initialize for matrix ice off
k=1; % initialize for ice on
for i=1:length(C)-1
    if C(i,2)~=C(i+1,2) && C(i,2)==1 && str2num(datestr(C(i,1),'mm'))<6 && str2num(datestr(C(i,1),'mm'))>3.5 % conditions for break-up
        D(j,1)=C(i+1,1); %new colums = date breakup
        j=j+1; %next line
    elseif C(i,2)~=C(i+1,2) && C(i,2)==0 && str2num(datestr(C(i,1),'mm'))>9% conditions for freezing
        E(k,1)=C(i+1,1); % new colums = date freezing
        k=k+1; % next line for next date
    end
end
YearFr=datenum(datestr(E,'yyyy'),'yyyy'); %Take the datenum of the 1st january of the year
YearBr=datenum(datestr(D,'yyyy'),'yyyy');
DayFr=E-YearFr; %the x day of the year
DayBr=D-YearBr;
Break=[D DayBr];
Freeze=[E DayFr];

%dlmwrite('TestIceBr.txt',Break,'\t');
%dlmwrite('TestIceFr.txt',Freeze,'\t');

load /Users/krsalkgu/Documents/MATLAB/KRS_ELA_Model/L227_application/Observations/L239ice.txt
Datestrbreak=num2str(L239ice(:,2));
BreakDate=datenum(Datestrbreak,'yyyymmdd');
Datestrfreeze=num2str(L239ice(:,3));
FreezeDate=datenum(Datestrfreeze,'yyyymmdd');

YBr=datenum(datestr(BreakDate,'yyyy'),'yyyy');
YFr=datenum(datestr(FreezeDate,'yyyy'),'yyyy');
DayBreak=BreakDate-YBr;
DayFreeze=FreezeDate-YFr;
BreakObs=[BreakDate DayBreak];
FreezeObs=[FreezeDate DayFreeze];

figure
subplot(2,1,2)
plot(FreezeObs(:,1),FreezeObs(:,2),'b');
hold on;
plot(Freeze(:,1),Freeze(:,2),'b--');
datetick('y','mmm');
datetick('x','yyyy');
xlabel('Year')
ylabel('Freezing date')
title('Plot of the ice freezing date') 

subplot(2,1,1)
plot(BreakObs(:,1),BreakObs(:,2),'r');
hold on;
plot(Break(:,1),Break(:,2),'r--');
datetick('y','mmm');
datetick('x','yyyy');
xlabel('Year')
ylabel('Breaking date')
title('Plot of the ice breaking date') 
