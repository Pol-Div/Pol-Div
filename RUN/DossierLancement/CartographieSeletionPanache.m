InitialisationDessins
clear alpha
load ConversionVersImageImshow
DossierSauvegarde='../Dessins/Analyse';[a,b]=mkdir(DossierSauvegarde);
    DossierSauv=[DossierSauvegarde '/'];
fig2=[fig1(1:end-5) '4.jpg'];
I=imread(fig2);


for config=1:size(Point.DCO,2)
    Cas=find(Panache==config);
    DistribPanache(config)=size(Cas,2)/NbCas*100;
    for ind_K=1
        if(size(Cas,2)>=1)
                ConfDessin='Moyenne';
                    CartographieDessinConcentration
            end
        end
end
    

