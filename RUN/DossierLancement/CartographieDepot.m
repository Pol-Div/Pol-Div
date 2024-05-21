TauxMax=0.75;
%% Fond d'écran
lonC=(-P(2).lon+lon)*echX+P(2).X;latC=(-P(2).lat+lat)*echY+P(2).Y;
AxesC=[(-P(2).lon+Axes(1))*echX+P(2).X (-P(2).lon+Axes(2))*echX+P(2).X...
    (-P(2).lat+Axes(4))*echY+P(2).Y (-P(2).lat+Axes(3))*echY+P(2).Y];

%% Variable
Dco=squeeze(DepotDomaine(:,:,end));

%% Dessin
saveName=[DossierSauv 'Depot'];
figure,hold on

rr=-1*ones(size(Rmask));rr(Rmask==0)=NaN;
rr(Dco>Seuil(1) & Dco<Seuil(2))=4;
rr(Dco>Seuil(2) & Dco<Seuil(3))=5;
rr(Dco>Seuil(3))=6;

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
saveName=[DossierSauv 'CartographieDepot'];
figure,s=imshow(I); alpha(1);hold on

rr=-1*ones(size(Rmask));rr(Rmask==0)=NaN;
rr(Dco<Seuil(1))=NaN;
rr(Dco>Seuil(1) & Dco<Seuil(2))=4;
rr(Dco>Seuil(2) & Dco<Seuil(3))=5;
rr(Dco>Seuil(3))=6;
pcolorCentre(lonC,latC,rr);
shading flat,caxis([DCO_Min DCO_Max])

clear alpha,alpha(0.4);alpha(s,1);

eval(['colormap jet(' num2str(NbEtape) ')'])

if(BolSauvegarde==1)
    saveas(gcf,saveName,'jpg')
end
if(BolSauvegarde==2)
    saveas(gcf,saveName,'fig')
end

