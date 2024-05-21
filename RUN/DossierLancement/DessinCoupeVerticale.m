    figure
    d=-Nmaille*du:du:Nmaille*du;d=d';
    ZZ=Z';dco_=dco';
    z=0:-1:Z(end);
    dco=griddata(d,ZZ,dco_,d,z);
    rr=-1*ones(size(dco));rr(isnan(dco))=NaN;
    rr(dco<Seuil(1))=-1;
    rr(dco>Seuil(1) & dco<Seuil(2))=1;
    rr(dco>Seuil(2) & dco<Seuil(3))=2;
    rr(dco>Seuil(3))=3;
        
    eval(['colormap jet(' num2str(NbEtape) ')'])


    pcolor(d,z,rr),shading interp
    caxis([DCO_Min DCO_Max])

    saveas(gcf,[DossierSauvegarde 'CoupeVerticale' num2str(config)],'png')
