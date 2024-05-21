Nmaille=200;

config=2%:size(Point.DCO,2)-1
clear dco
    du=sqrt(2)*dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source+ind,1),size(Dco,1));
        jj = min(max(N_source+ind,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

config=6%:size(Point.DCO,2)-1
clear dco
    du=sqrt(2)*dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source-ind,1),size(Dco,1));
        jj = min(max(N_source-ind,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

%%
config=4%:size(Point.DCO,2)-1
clear dco
    du=sqrt(2)*dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source-ind,1),size(Dco,1));
        jj = min(max(N_source+ind,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

config=8%:size(Point.DCO,2)-1
clear dco
    du=sqrt(2)*dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source-ind,1),size(Dco,1));
        jj = min(max(N_source+ind,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

%%
%%
config=1%:size(Point.DCO,2)-1
clear dco
    du=dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source,1),size(Dco,1));
        jj = min(max(N_source+ind,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

config=5%:size(Point.DCO,2)-1
clear dco
    du=dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source,1),size(Dco,1));
        jj = min(max(N_source+ind,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

config=3%:size(Point.DCO,2)-1
clear dco
    du=dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source-ind,1),size(Dco,1));
        jj = min(max(N_source,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

config=7%:size(Point.DCO,2)-1
clear dco
    du=dl;
    Cas=find(Panache==config);
    Dco=nanmean(squeeze(DCO(:,:,:,Cas)),4);
    index=0;
    for ind=-Nmaille:Nmaille;
        ii = min(max(M_source-ind,1),size(Dco,1));
        jj = min(max(N_source,1),size(Dco,2));
            index=index+1;
            dco(index,:)=Dco(ii,jj,:)./Rmask_(ii,jj,:);
    end

DessinCoupeVerticale

