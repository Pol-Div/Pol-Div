%% Dessin Concentration
load('Domaine.mat')
load('ConcDomaine.mat')
load('CoteGrandDomaine.mat')

ConcMoy = nanmean(ConcDomaine,3);
Var=ConcMoy(:,:,1);
pcolor(lon_,lat_,Var./Rmask),shading flat
Seuil=[0.015 0.2 2]

rr=-1*ones(size(Rmask));rr(Rmask==0)=NaN;
rr(Var>Seuil(1) & Var<Seuil(2))=1;
rr(Var>Seuil(2) & Var<Seuil(3))=2;
rr(Var>Seuil(3))=3;
pcolor(lon_,lat_,rr),shading flat, colormap jet(8)
colorbar, caxis([-3 5])
axis equal


%% Dessin Depot
load('DepotDomaine.mat')
Seuil=[100 400 1000]
Var=DepotDomaine(:,:,end)/size(DepotDomaine,3)*365*8;

rr=-1*ones(size(Rmask));rr(Rmask==0)=NaN;
rr(Var>Seuil(1) & Var<Seuil(2))=1;
rr(Var>Seuil(2) & Var<Seuil(3))=2;
rr(Var>Seuil(3))=3;
figure,pcolor(lon_,lat_,rr),shading flat, colormap jet(8)
colorbar, caxis([-3 5])
axis equal
