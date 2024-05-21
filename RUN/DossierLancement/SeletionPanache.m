InitialisationDessins

% Categorie='Entero';
% Categorie='DCO';
% Categorie='Coli';
       

%DCO=ConcDomaine/100*415/1500*1000;
% 
LectureConcentration
% 
% load Vent
% % TauX=interp1(t_sauv(3:3:end)',TauX,t_sauv);
% % TauY=interp1(t_sauv(3:3:end)',TauY,t_sauv);
%        rhoA=1.225;Cd=1.6E-3;
%        Intensite=sqrt(sqrt(TauX.^2+TauY.^2)/Cd/rhoA);
%        angle_=atan(TauY./TauX)*180/pi-1/2*(sign(TauX)-1)*180;
%        angle=mod((-angle_+270),360);
%        Tvent=t_sauv;
% 
% if Zoom==1
%     Axes=[5.538 5.542 43.2075 43.211];
% else
%     Axes=[min(min(lon_(26:end,51:end))) max(max(lon_(26:end,51:end)))...
%         min(min(lat_(26:end,51:end))) max(max(lat_(26:end,51:end)))];
%     Axes=[min(min(lon_(26:end,51:end))) 5.75...
%         min(min(lat_(26:end,51:end))) max(max(lat_(26:end,51:end)))];
% end
% mask=rmask_./rmask_;
% 
SegmentationPanorama  

if exist([PanacheSelec '.mat'])
    load([PanacheSelec '.mat'])
else
    ind_K=1;
    for Cas=1:size(DCO,4);%NbPoints;
      Point.DCO(Cas,:)=griddata(lon_,lat_,DCO(:,:,ind_K,Cas),Point.Lon,Point.Lat);
      [temp,Panache(Cas)]=max(Point.DCO(Cas,:));
    end
    save(PanacheSelec,'Point','Panache')
end
            
NbCas=size(DCO,4);


for config=1:size(Point.DCO,2)
    Cas=find(Panache==config);
    DistribPanache(config)=size(Cas,2)/NbCas*100;
    for ind_K=1
        if(size(Cas,2)>=1)
%         figure(5*config-4+ind_K-1),clf,
%             pcolor((lon_(26:end,51:end)+lon_(26:end,50:end-1))/2,...
%                 (lat_(26:end,51:end)+lat_(25:end-1,51:end))/2.,...
%                  max(squeeze(DCO(26:end,51:end,ind_K,Cas)),3)...
%                  .*mask(26:end,51:end) ...
%                  ),
%             axis equal,shading flat,colorbar,caxis([DCO_Min DCO_Max]),
%                         axis(Axes)
%                         title(['Config n° : ' num2str(config) ' - '...
%                             num2str(round(DistribPanache(config))) ' % des cas'])
%             hold on,plot(LonSource_,LatSource_,'*r',...
%                 'MarkerSize',5,'LineWidth',2), axis equal
%             if(BolDesEchantillonage==1)
%                 DessinEchantillonnage
%             end
%             %plot(Point.Lon,Point.Lat,'.k')
%             colormap(hsvf)
%             if(BolSauvegarde==1)
%                 saveName=[DossierSauv 'Cas_' num2str(config) '_Moyenne1'];
%                 saveas(gcf,saveName,'png')
%             end
%             if(BolSauvegarde==2)
%                 saveName=[DossierSauv 'Cas_' num2str(config) '_Moyenne1'];
%                 saveas(gcf,saveName,'fig')
%             end
                ConfDessin='Std';
                    DessinConcentration
                ConfDessin='Moyenne';
                    DessinConcentration
                ConfDessin='Maximum';
                    DessinConcentration
                ConfDessin='FreqMax';
                    DessinConcentration
            end
        end
    
    %DepassementSeuil
    

    figure(5*config-3),clf,it=8;di=4;
    if(size(Cas,2)>=1)
        it=min(it,size(Cas,2));
        
        DessinVitesses
        
        if(BolSauvegarde==1)
            saveName=[DossierSauv 'Cas_' num2str(config) '_Vitesse'];
            saveas(gcf,saveName,'png')
        end
        if(BolSauvegarde==2)
            saveName=[DossierSauv 'Cas_' num2str(config) 'Vitesse'];
            saveas(gcf,saveName,'fig')
        end
    end
            %      figure(5*config-1),clf
%         Mstd=permute(squeeze(DCO(26:end,51:end,1,:)),[3 1 2]);
%         pcolor((lon_(26:end,51:end)+lon_(26:end,50:end-1))/2,...
%             (lat_(26:end,51:end)+lat_(25:end-1,51:end))/2.,...
%              squeeze(std(Mstd,1)))
%         axis equal,shading flat,colorbar,caxis([DCO_Min DCO_Max]),
%                     axis(Axes)
%         hold on,plot(LonSource_,LatSource_,'*r',...
%             'MarkerSize',5,'LineWidth',2), axis equal
%         plot(Point.Lon,Point.Lat,'.k')
%         if(BolSauvegarde==1)
%             saveName=[Dossier 'Cas_' num2str(config) '_Std'];
%             saveas(gcf,saveName,'jpg')
%         end

%         subplot(2,1,1)
%          plot((t_sauv-t_sauv(1))'/24/3600,TauX,'k')
%          hold on, plot((t_sauv(Cas)-t_sauv(1))'/24/3600,TauX(Cas),'*r',...
%                     'MarkerSize',5,'LineWidth',2)
%         subplot(2,1,2)
%          plot((t_sauv-t_sauv(1))'/24/3600,TauY,'k')
%          hold on, plot((t_sauv(Cas)-t_sauv(1))'/24/3600,TauY(Cas),'*r',...
%                     'MarkerSize',5,'LineWidth',2)
     figure(5*config),clf
        subplot(2,1,1)
         plot(Tvent/24/3600,...
                        Intensite,'k')
         hold on, plot(Tvent(Cas)/24/3600,...
                        Intensite(Cas),'*r',...
                        'MarkerSize',5,'LineWidth',2)
        subplot(2,1,2)
         plot(Tvent/24/3600,...
                    angle,'k')
         hold on, plot(Tvent(Cas)/24/3600,...
                 angle(Cas)....
                    ,'*r',...
                    'MarkerSize',5,'LineWidth',2)
    if(size(Cas,2)>=1)
         hold on, plot(Tvent(Cas(it))/24/3600,...
                 angle(Cas(it))....
                    ,'*g',...
                    'MarkerSize',5,'LineWidth',2)
    end
        if(BolSauvegarde==1)
            saveName=[DossierSauv 'Cas_' num2str(config) '_Vent'];
            saveas(gcf,saveName,'png')
        end
        if(BolSauvegarde==2)
            saveName=[DossierSauv 'Cas_' num2str(config) '_Vent'];
            saveas(gcf,saveName,'fig')
        end
%     for ii=1:size(Cas,2)
%         figure(2),clf,
%             pcolor(lon_(26:end,51:end),lat_(26:end,51:end),...
%                  mean(squeeze(DCO(26:end,51:end,ind_K,Cas(ii))),3)),
%             axis equal,shading flat,colorbar,caxis([0 25]),
%                         axis(Axes)
%             hold on,plot(LonSource_,LatSource_,'*r',...
%                 'MarkerSize',5,'LineWidth',2), axis equal
%             plot(Point.Lon,Point.Lat,'.k')
%         figure(3),clf,
%             plot(Point.DCO(Cas(ii),:))
%             pause
%     end
end
