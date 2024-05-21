TauxMax=0.75;
%% Fond d'écran
lonC=(-P(2).lon+lon)*echX+P(2).X;latC=(-P(2).lat+lat)*echY+P(2).Y;
AxesC=[(-P(2).lon+Axes(1))*echX+P(2).X (-P(2).lon+Axes(2))*echX+P(2).X...
    (-P(2).lat+Axes(4))*echY+P(2).Y (-P(2).lat+Axes(3))*echY+P(2).Y];

%% Variable
    if size(Cas,2)>1
        if strcmp(ConfDessin,'Moyenne');
            Dco=nanmean(squeeze(DCO(:,:,ind_K,Cas)),3);
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
saveName=[DossierSauv 'DessinCas_' num2str(config) '_' ConfDessin];
figure,hold on

rr=-1*ones(size(Rmask));rr(Rmask==0)=NaN;
rr(Dco>Seuil(1) & Dco<Seuil(2))=1;
rr(Dco>Seuil(2) & Dco<Seuil(3))=2;
rr(Dco>Seuil(3))=3;

pcolorCentre(lon_,lat_,rr);
shading flat,caxis([DCO_Min DCO_Max])
eval(['colormap jet(' num2str(NbEtape) ')'])

plot(LonSource_,LatSource_,'*w','MarkerSize',5,'LineWidth',2), axis equal

axis([5.505 5.553 43.16 43.22])

if(BolDesEchantillonage==1)
    DessinEchantillonnage
end

if(BolSauvegarde==1)
    saveas(gcf,saveName,'jpg')
end
if(BolSauvegarde==2)
    saveas(gcf,saveName,'fig')
end


%% Cartographie
saveName=[DossierSauv 'CartographieCas_' num2str(config) '_' ConfDessin];
figure,s=imshow(I); alpha(1);hold on

rr=-1*ones(size(Rmask));rr(Rmask==0)=NaN;
rr(Dco<Seuil(1))=NaN;
rr(Dco>Seuil(1) & Dco<Seuil(2))=1;
rr(Dco>Seuil(2) & Dco<Seuil(3))=2;
rr(Dco>Seuil(3))=3;
pcolorCentre(lonC,latC,rr);
shading flat,caxis([DCO_Min DCO_Max])

clear alpha,alpha(1);alpha(s,1);

eval(['colormap jet(' num2str(NbEtape) ')'])

if(BolSauvegarde==1)
    saveas(gcf,saveName,'jpg')
end
if(BolSauvegarde==2)
    saveas(gcf,saveName,'fig')
end

