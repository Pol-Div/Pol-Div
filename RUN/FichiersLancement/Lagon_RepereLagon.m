%% Profondeur :
H=hh;
H(rmask_==0)=NaN;
%H(H<100)=NaN;

Ocean=((H>100).*rmask_);
Lagon=((1-Ocean).*rmask_);
Littoral=(1-rmask_);
