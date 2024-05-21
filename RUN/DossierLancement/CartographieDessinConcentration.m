TauxMax=0.75;
%% Fond d'écran
figure,s=imshow(I), alpha(1);hold on
lonC=(-P(2).lon+lon)*echX+P(2).X;latC=(-P(2).lat+lat)*echY+P(2).Y;
AxesC=[(-P(2).lon+Axes(1))*echX+P(2).X (-P(2).lon+Axes(2))*echX+P(2).X...
    (-P(2).lat+Axes(4))*echY+P(2).Y (-P(2).lat+Axes(3))*echY+P(2).Y];

%% Variable
    if size(Cas,2)>1
        if strcmp(ConfDessin,'Moyenne');
            Dco=nanmean(squeeze(DCO(:,:,ind_K,Cas)),3);
            max(max(Dco))
            Dco(Dco<Seuil1)=NaN;
        elseif strcmp(ConfDessin,'Maximum');
            Dco=squeeze(max(permute(DCO(:,:,ind_K,Cas),[4 3 1 2])));
            Dco(Dco<Seuil1)=NaN;
        elseif strcmp(ConfDessin,'Std');
            Dco=squeeze(std(permute(DCO(:,:,ind_K,Cas),[4 3 1 2])));
        elseif strcmp(ConfDessin,'FreqMax');
            DcoMax=squeeze(max(permute(DCO(:,:,ind_K,Cas),[4 3 1 2])));
            Dco_=ones(size(DCO));Dco_(DCO<DcoMax*TauxMax)=NaN;
            II=sum((1-isnan(Dco_)),4);II(II<=0)=NaN;
            Taux=II./size(Dco_,4)*100;Taux(DcoMax<Seuil1)=NaN;Dco=Taux;
        end
    else
        Dco=squeeze(DCO(:,:,ind_K,Cas));
    end
        
%% Dessin
%figure,
LonC=lon_;LatC=lat_;
pcolorCentre(lonC,latC,Dco.*mask);
shading flat,caxis([DCO_Min DCO_Max]),%axis equal,colorbar,
%clear alpha,alpha(.4);alpha(s,1);

if strcmp(ConfDessin,'FreqMax');
    eval(['colormap parula(' num2str(10) ')'])
    caxis([0 3])
else
    eval(['colormap cool(' num2str(NbEtape) ')'])
end
axis(AxesC)
title(['Config n° : ' num2str(config) ' - '...
   num2str(round(DistribPanache(config))) ' % des cas'])
plot(LonSource_,LatSource_,'*r','MarkerSize',5,'LineWidth',2), axis equal

%% Sauvegarde
saveName=[DossierSauv 'Cas_' num2str(config) '_' ConfDessin];

if(BolDesEchantillonage==1)
    DessinEchantillonnage
end
%plot(Point.Lon,Point.Lat,'.k')
if(BolSauvegarde==1)
    saveas(gcf,saveName,'jpg')
end
if(BolSauvegarde==2)
    saveas(gcf,saveName,'fig')
end

