SegmentationPanorama  

if exist([PanacheSelec '.mat'])
    load([PanacheSelec '.mat'])
else
    ind_K=1;
    for Cas=1:size(DCO,4);%NbPoints;
      Point.DCO(Cas,:)=griddata(lon_,lat_,DCO(:,:,ind_K,Cas),Point.Lon,Point.Lat);
      [~,Panache(Cas)]=max(Point.DCO(Cas,:));
    end
    save(PanacheSelec,'Point','Panache')
end
            
NbCas=size(DCO,4);
