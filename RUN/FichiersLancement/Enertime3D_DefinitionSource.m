NbSources=1;
% M_source=(M_source-1)*nx+1;N_source=(N_source-1)*nx+1;
% M_source=197;N_source=122;
% M_source=197;N_source=122;
% %M_source=(M_source-1)*nx+1;N_source=(N_source-1)*nx+1+2;
% %M_source=50;N_source=25;

% LonSource=5+32/60+24/3600;LonSource=5.539868;
% LatSource=43+12/60+30/3600;LatSource=43.208904;

%Cas 1:
%LonSource=5.539868;LatSource=43.208904;
%Cas 2:
LonSource=5.52984476591;LatSource=43.1972040068;
%Cas 3:
%LonSource=5.51357194491;LatSource=43.1619039778;

[M_source,N_source]=Enertime_TrouveCoordSource(lon_,lat_,...
                                               LonSource,LatSource)
h_source=1;    		     	% m
%Enertime_Debit=1500;         	% m3/h 
					% 1500 m3/h
					% 2300 m3/h
					% 3500 m3/h
Enertime_Debit=load('../FichiersSource/Debit2016.txt');
Enertime_Debit=Enertime_Debit/3600/24;         	% m3/s 

%Conc_Source=1983000;
%Conc_Source=180000;
%Conc_Source=415/1500; %en kg / m3
Conc_Source=15000; %en mg / m3
Conc_Domaine=0;
%T90=48*3600; % Entero en seconde
%T90=24*3600; % E. Coli
T90=100*24*3600; % MES

