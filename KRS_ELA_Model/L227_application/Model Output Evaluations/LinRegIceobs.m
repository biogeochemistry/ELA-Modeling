% Remi Bouyssou - ELA MyLake
% Plot the observation of ice-on and ice-off and the linear regression

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


pBr=polyfit(BreakObs(:,1),BreakObs(:,2),1);
curveBr=polyval(pBr,BreakObs(:,1));
pFr=polyfit(FreezeObs(:,1),FreezeObs(:,2),1);
curveFr=polyval(pFr,FreezeObs(:,1));


figure
subplot(2,1,2)
plot(FreezeObs(:,1),FreezeObs(:,2),'b.','markersize',15);
hold on;
plot(FreezeObs(:,1),curveFr)
datetick('y','mmm');
datetick('x','yyyy');
xlabel('Year')
ylabel('Freezing date')
title('Plot of the ice freezing date') 

subplot(2,1,1)
plot(BreakObs(:,1),BreakObs(:,2),'r.','markersize',15);
hold on;
plot(BreakObs(:,1),curveBr)
datetick('y','mmm');
datetick('x','yyyy');
xlabel('Year')
ylabel('Breaking date')
title('Plot of the ice breaking date') 