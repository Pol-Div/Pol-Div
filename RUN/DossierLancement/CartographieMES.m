% InitialisationDessins
Rmask=Rmask_(:,:,1);
clear alpha
load ConversionVersImageImshow
DossierSauvegarde='../Dessins/Analyse';[a,b]=mkdir(DossierSauvegarde);
    DossierSauv=[DossierSauvegarde '/'];
fig2=[fig1(1:end-5) '4.jpg'];
I=imread(fig2);


Seuil=[0.015 0.2 2];NbEtape=8;
DCO_Min=-3;DCO_Max=5;
for config=1:size(Point.DCO,2)
    Cas=find(Panache==config);
    DistribPanache(config)=size(Cas,2)/NbCas*100;
    for ind_K=1
        if(size(Cas,2)>=1)
                ConfDessin='Moyenne';
                    CartographieDessinMES
            end
        end
end
   
%% Depot
Seuil=[100 400 1000];NbEtape=8;
DCO_Min=0;DCO_Max=8;
CartographieDepot
