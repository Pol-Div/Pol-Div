%% Phase 1
Xu_=(lon(:,1:end-1)+lon(:,2:end))/2;
Yu_=(lat(:,1:end-1)+lat(:,2:end))/2;
ubar1_=griddata(Xu_,Yu_,ubar1(:,1:end-1),lon,lat);

X_vbar=(lon(1:end-1,:)+lon(2:end,:))/2;
Y_vbar=(lat(1:end-1,:)+lat(2:end,:))/2;
vbar1_=griddata(X_vbar,Y_vbar,vbar1(1:end-1,:),lon,lat);

%% Phase 2
Xu_=(lon(:,1:end-1)+lon(:,2:end))/2;
Yu_=(lat(:,1:end-1)+lat(:,2:end))/2;
ubar1_=griddata(Xu_,Yu_,ubar1(:,1:end-1),lon_,lat_);


X_vbar=(lon(1:end-1,:)+lon(2:end,:))/2;
Y_vbar=(lat(1:end-1,:)+lat(2:end,:))/2;
vbar1_=griddata(X_vbar,Y_vbar,vbar1(1:end-1,:),X_(1:end-1,:),Y_(1:end-1,:));


%% Phase 3
load cote.mat;load Masque.mat 
[Mx,Nx]=size(X);[Mx_,Nx_]=size(X_);

iTerre_z=find(Rmask==0);
Xz=lon;Yz=lat;Xz_=lon_;Yz_=lat_;
XXz_=reshape(Xz_,Mx_*Nx_,1);YYz_=reshape(Yz_,Mx_*Nx_,1);
%XXzeta=[reshape(Xzeta,Mx*Nx,1);XX_zeta(iTerre)];YYzeta=[reshape(Yzeta,Mx*Nx,1);YY_zeta(iTerre)];
RR_rmaskZ=reshape(RmaskZ,Mx*Nx,1);
XXz=reshape(Xz,Mx*Nx,1);XXz=XXz(RR_rmaskZ==1);
YYz=reshape(Yz,Mx*Nx,1);YYz=YYz(RR_rmaskZ==1);
XXz=[XXz;XXz_(iTerre_z)];YYz=[YYz;YYz_(iTerre_z)];


iTerre_u=find(Rmask(:,2:end)==0);
Xu=(lon(:,1:end-1)+lon(:,2:end))/2;Yu=(lat(:,1:end-1)+lat(:,2:end))/2;
Xu_=(lon_(:,1:end-1)+lon_(:,2:end))/2;Yu_=(lat_(:,1:end-1)+lat_(:,2:end))/2;
XXu_=reshape(Xu_,Mx_*(Nx_-1),1);YYu_=reshape(Yu_,Mx_*(Nx_-1),1);
% XXubar=[reshape(Xubar,Mx*(Nx-1),1);XX_ubar(iTerre_u)];YYubar=[reshape(Yubar,Mx*(Nx-1),1);YY_ubar(iTerre_u)];
%RR_rmaskU=reshape(rmask(:,2:end),Mx*(Nx-1),1);
RR_rmaskU=reshape(RmaskU,Mx*(Nx-1),1);
XXu=reshape(Xu,Mx*(Nx-1),1);XXu=XXu(RR_rmaskU==1);
YYu=reshape(Yu,Mx*(Nx-1),1);YYu=YYu(RR_rmaskU==1);
XXu=[XXu;XXu_(iTerre_u)];YYu=[YYu;YYu_(iTerre_u)];

iTerre_v=find(Rmask(2:end,:)==0);
Xv=(lon(1:end-1,:)+lon(2:end,:))/2;Yv=(lat(1:end-1,:)+lat(2:end,:))/2;
Xv_=(lon_(1:end-1,:)+lon_(2:end,:))/2;Yv_=(lat_(1:end-1,:)+lat_(2:end,:))/2;
XXv_=reshape(Xv_,(Mx_-1)*Nx_,1);YYv_=reshape(Yv_,(Mx_-1)*Nx_,1);
% XXubar=[reshape(Xubar,Mx*(Nx-1),1);XX_ubar(iTerre_u)];YYubar=[reshape(Yubar,Mx*(Nx-1),1);YY_ubar(iTerre_u)];
%RR_rmaskU=reshape(rmask(:,2:end),Mx*(Nx-1),1);
RR_rmaskV=reshape(RmaskV,(Mx-1)*Nx,1);
XXv=reshape(Xv,(Mx-1)*Nx,1);XXv=XXv(RR_rmaskV==1);
YYv=reshape(Yv,(Mx-1)*Nx,1);YYv=YYv(RR_rmaskV==1);
XXv=[XXv;XXv_(iTerre_v)];YYv=[YYv;YYv_(iTerre_v)];


% [XXzeta,I_PetitMaillage]=sort(XXzeta);YYzeta=YYzeta(I_PetitMaillage);
% ii_PetitMaillage=find(diff(XXzeta)~=0 | diff(YYzeta)~=0);
% XXzeta=XXzeta(ii_PetitMaillage);YYzeta=YYzeta(ii_PetitMaillage);

zeta1(zeta1==99)=0;
ZZ=reshape(zeta1,Mx*Nx,1);ZZ=ZZ(RR_rmaskZ==1);
   ZZ=[ZZ;0*XX_zeta(iTerre_z)];
    %ZZ=[reshape(zeta1,Mx*Nx,1);0*XX_zeta(iTerre_z)];%ZZ=ZZ(I_PetitMaillage);ZZ=ZZ(ii_PetitMaillage);
Zeta1=griddata(XXz,YYz,ZZ,X_zeta,Y_zeta);
Zeta1(Rmask==0)=NaN;pcolor(lon_,lat_,Zeta1)

% ZZ=[reshape(ubar1(:,1:end-1),Mx*(Nx-1),1);0*XX_ubar(iTerre_u)];%ZZ=ZZ(I_PetitMaillage);ZZ=ZZ(ii_PetitMaillage);
ZZ=reshape(ubar1(:,1:end-1),Mx*(Nx-1),1);ZZ=ZZ(RR_rmaskU==1);
   ZZ=[ZZ;0*XXu_(iTerre_u)];
Ubar1=griddata(XXu,YYu,ZZ,Xu_,Yu_);
Ubar1(Rmask(:,2:end)==0)=NaN;pcolor(Xu_,Yu_,Ubar1)

ZZ=reshape(vbar1(1:end-1,:),(Mx-1)*Nx,1);ZZ=ZZ(RR_rmaskV==1);
   ZZ=[ZZ;0*XXv_(iTerre_v)];
Vbar1=griddata(XXv,YYv,ZZ,Xv_,Yv_);
Vbar1(Rmask(2:end,:)==0)=NaN;pcolor(Xv_,Yv_,Vbar1)

quiver(lon_(2:end-1,2:end-1),lat_(2:end-1,2:end-1),...
       (Ubar1(2:end-1,1:end-1)+Ubar1(2:end-1,2:end))/2, ...
       (Vbar1(1:end-1,2:end-1)+Vbar1(2:end,2:end-1))/2,...
       2)


% XXzeta=[reshape(Xzeta,Mx*Nx,1)];YYzeta=[reshape(Yzeta,Mx*Nx,1)];
% ZZ=[reshape(zeta1,Mx*Nx,1)];%ZZ=ZZ(I_PetitMaillage);ZZ=ZZ(ii_PetitMaillage);
% Zeta1=griddata(XXzeta,YYzeta,ZZ,X_zeta,Y_zeta);
% pcolor(lon_,lat_,Zeta1)


