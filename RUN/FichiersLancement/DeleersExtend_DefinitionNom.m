TestAvion=false;
TpsEcrtEcran=1;
Test=0;
if Test==1
    Hisgrid='../FichiersSource/RHOMA200_06-31_mai_2008.nc';
    iT0Connexion=[1 209];%Année 2008
else
        Hisgrid='/Users/cristele/Documents/Palstique/Data/RHOMA_2008.nc'; 
    iT0Connexion=[1 2924];%705;%Année 2008
end
%  Hisname='../FichiersSource/RHOMA200_06-31_mai_2008.nc';
%  iT0Connexion=[1 209];%705;%Mai 2008
Hisname=Hisgrid;
Nom=['../FichiersSource/RHOMA200_06-31_mai_2008.nc'...
     ];
 
Titre=['Cassis'...
       ];
      
FichSauvegarde=[...
    'Cassis'
    ];

clear temp
for ind=1:size(FichSauvegarde,1)
    temp(ind,:)=['../DessinsEtSauvegarde/' FichSauvegarde(ind,:)];
end
FichSauvegarde=temp;

Hauteur=[0];

Nb_Houle=size(Hauteur,2);

nx=20;
Imin=52; Imax=82; Jmin=360; Jmax=380;
Model='Mars3D';dl=200; %m
%Model='Mars';dl=200; %m
dz=1;
dZ=[1 3 10 25 40 75]';
Z_=-[0;(cumsum(dZ))];Z=(Z_(1:end-1)+Z_(2:end))/2;
K=size(Z,1);

TempsSpinup=1;
dt=10;    %40=20*2 doit être bon... Mais ce serait mieux 60

MES = true;ConcMin=0.005;Nu=0;
Wch=0.066E-2;
    
    
