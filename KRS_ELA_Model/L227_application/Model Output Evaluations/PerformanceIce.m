% Remi Bouyssou - ELA MyLake
% Performance of the ice prediction by the model compared to observed data
%% Performance of the ice breaking simulation

yrbrobs=datenum(datestr(BreakObs(:,1),'yyyy'),'yyyy');
yrbrsim=datenum(datestr(Break(:,1),'yyyy'),'yyyy');

obs=[yrbrobs BreakObs(:,2)];
sim=[yrbrsim Break(:,2)];

[v,loc_obs,loc_sim] = intersect(obs(:,1),sim(:,1)); % returns the matched datum v, and the index for obs and sim vector
Matched = [v obs(loc_obs,2) sim(loc_sim,2)]; % creates a matrix with dates, obs, sim. 

 %  calculating RMSE:SD(obs), NS and r
    rmse= sqrt(nansum((Matched(:,2)-Matched(:,3))).^2)/numel(Matched(:,3))
    sd = nanstd(Matched(:,2));
    rmse_sd_ratio = rmse/sd;
    diff=Matched(:,3)-Matched(:,2);
    diffmeanflow=Matched(:,2)-(nanmean(Matched(:,2)));
    ns= 1-(nansum(diff.^2))/(nansum(diffmeanflow.^2));
    pearson = nancorr(Matched(:,2),Matched(:,3)); % fn call
    
    %storing
    performanceBreaking(1,1)= rmse;
    performanceBreaking(2,1)= rmse_sd_ratio;
    performanceBreaking(3,1)= ns;
    performanceBreaking(4,1)= pearson;
    
 
    clear diff diffmean sd rmse rmse_sd_ratio ns pearson
    

%% Performance of the ice freezing simulation

yrbrobs=datenum(datestr(FreezeObs(:,1),'yyyy'),'yyyy');
yrbrsim=datenum(datestr(Freeze(:,1),'yyyy'),'yyyy');

obs=[yrbrobs FreezeObs(:,2)];
sim=[yrbrsim Freeze(:,2)];

[v,loc_obs,loc_sim] = intersect(obs(:,1),sim(:,1)); % returns the matched datum v, and the index for obs and sim vector
Matched = [v obs(loc_obs,2) sim(loc_sim,2)]; % creates a matrix with dates, obs, sim. 

 %  calculating RMSE:SD(obs), NS and r
    rmse= sqrt(nansum((Matched(:,2)-Matched(:,3))).^2)/numel(Matched(:,3))
    sd = nanstd(Matched(:,2));
    rmse_sd_ratio = rmse/sd;
    diff=Matched(:,3)-Matched(:,2);
    diffmeanflow=Matched(:,2)-(nanmean(Matched(:,2)));
    ns= 1-(nansum(diff.^2))/(nansum(diffmeanflow.^2));
    pearson = nancorr(Matched(:,2),Matched(:,3)); % fn call
    
    %storing
    performanceFreezing(1,1)= rmse;
    performanceFreezing(2,1)= rmse_sd_ratio;
    performanceFreezing(3,1)= ns;
    performanceFreezing(4,1)= pearson;
    
    
 
    clear diff diffmean sd rmse rmse_sd_ratio ns pearson
    