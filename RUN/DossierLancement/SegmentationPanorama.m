d=200; %m
NbPoints=8;
Dalpha=360/NbPoints;
LatSource_=lat_(M_source,N_source);LonSource_=lon_(M_source,N_source);

indPt=0;
for alpha=0:Dalpha:360
    indPt=indPt+1;
    [Point.Lon(indPt),Point.Lat(indPt)]=DetPosAvecDist(LonSource_,LatSource_,alpha,d);
end

  
hold on,plot(LonSource_,LatSource_,'*r',...
    'MarkerSize',5,'LineWidth',2), axis equal
plot(Point.Lon,Point.Lat,'.k')
plot(Point.Lon(1),Point.Lat(1),'og')
plot(Point.Lon(2),Point.Lat(2),'oc')

% hold on,
% for indPt=1:size(Point.M,2)
% plot(Point.Lon(indPt),Point.Lat(indPt),col(indPt,:),...
%     'MarkerSize',5,'LineWidth',2), axis equal
% end
