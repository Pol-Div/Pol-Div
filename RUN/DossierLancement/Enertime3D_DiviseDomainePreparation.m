%load cote.mat;load Masque.mat 
[Mx,Nx]=size(X);[Mx_,Nx_]=size(X_);
rmask_=Rmask;

RmaskZ=rmask_;
iTerre_z=find(Rmask==0);
Xz=lon;Yz=lat;Xz_=lon_;Yz_=lat_;
XXz_=reshape(Xz_,Mx_*Nx_,1);YYz_=reshape(Yz_,Mx_*Nx_,1);
rmask_=griddata(Xz,Yz,rmask,XXz_,YYz_,'nearest');
%XXzeta=[reshape(Xzeta,Mx*Nx,1);XX_zeta(iTerre)];YYzeta=[reshape(Yzeta,Mx*Nx,1);YY_zeta(iTerre)];
RR_rmaskZ=reshape(RmaskZ,Mx*Nx,1);
XXz=reshape(Xz,Mx*Nx,1);XXz=XXz(RR_rmaskZ==1);
YYz=reshape(Yz,Mx*Nx,1);YYz=YYz(RR_rmaskZ==1);
%XXz=[XXz;XXz_(iTerre_z)];YYz=[YYz;YYz_(iTerre_z)];


RmaskU_=Rmask(:,1:end-1).*Rmask(:,2:end);
iTerre_u=find(RmaskU_==0);
Xu=(lon(:,1:end-1)+lon(:,2:end))/2;Yu=(lat(:,1:end-1)+lat(:,2:end))/2;
Xu_=(lon_(:,1:end-1)+lon_(:,2:end))/2;Yu_=(lat_(:,1:end-1)+lat_(:,2:end))/2;
XXu_=reshape(Xu_,Mx_*(Nx_-1),1);YYu_=reshape(Yu_,Mx_*(Nx_-1),1);
% XXubar=[reshape(Xubar,Mx*(Nx-1),1);XX_ubar(iTerre_u)];YYubar=[reshape(Yubar,Mx*(Nx-1),1);YY_ubar(iTerre_u)];
%RR_rmaskU=reshape(rmask(:,2:end),Mx*(Nx-1),1);
RR_rmaskU=reshape(RmaskU_,Mx*(Nx-1),1);
XXu=reshape(Xu,Mx*(Nx-1),1);XXu=XXu(RR_rmaskU==1);
YYu=reshape(Yu,Mx*(Nx-1),1);YYu=YYu(RR_rmaskU==1);
%XXu=[XXu;XXu_(iTerre_u)];YYu=[YYu;YYu_(iTerre_u)];

RmaskV_=Rmask(1:end-1,:).*Rmask(2:end,:);
iTerre_v=find(RmaskV_==0);
Xv=(lon(1:end-1,:)+lon(2:end,:))/2;Yv=(lat(1:end-1,:)+lat(2:end,:))/2;
Xv_=(lon_(1:end-1,:)+lon_(2:end,:))/2;Yv_=(lat_(1:end-1,:)+lat_(2:end,:))/2;
XXv_=reshape(Xv_,(Mx_-1)*Nx_,1);YYv_=reshape(Yv_,(Mx_-1)*Nx_,1);
% XXubar=[reshape(Xubar,Mx*(Nx-1),1);XX_ubar(iTerre_u)];YYubar=[reshape(Yubar,Mx*(Nx-1),1);YY_ubar(iTerre_u)];
%RR_rmaskU=reshape(rmask(:,2:end),Mx*(Nx-1),1);
RR_rmaskV=reshape(RmaskV_,(Mx-1)*Nx,1);
XXv=reshape(Xv,(Mx-1)*Nx,1);XXv=XXv(RR_rmaskV==1);
YYv=reshape(Yv,(Mx-1)*Nx,1);YYv=YYv(RR_rmaskV==1);
%XXv=[XXv;XXv_(iTerre_v)];YYv=[YYv;YYv_(iTerre_v)];

ZZ=reshape(h,Mx*Nx,1);ZZ=ZZ(RR_rmaskZ==1);
   ZZ=[ZZ;0*XXz(iTerre_z)];
h_=griddata(XXz,YYz,ZZ,Xz_,Yz_);
%h_=max(1,h_).*Rmask;
h_(Rmask==1)=max(h_(Rmask==1),0.5);
%h=h_;
hh=h_;