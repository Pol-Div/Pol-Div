DossierCrop=[DossierSauvegarde '/Crop']
[a,b]=mkdir(DossierCrop);
aa=dir(DossierSauvegarde);% aa=dir;
axe=[350 138  680-138 750-350  ];
% 
ii= 1
for ii= 1 : size(aa,1)
    if size(aa(ii).name,2)>4
        if strcmp(aa(ii).name(end-2:end),'jpg')
            I=imread([DossierSauvegarde '/' aa(ii).name]);
            I2 = imcrop(I,axe);imshow(I2)
            imwrite(I2,[DossierCrop '/' aa(ii).name])
            figure(2),imshow(I2)
            figure(1),imshow(I);
        end
    end
end