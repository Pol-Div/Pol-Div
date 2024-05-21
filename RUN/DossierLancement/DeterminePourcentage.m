for config=1:size(Point.DCO,2)
    Cas=find(Panache==config);
    DistribPanache(config)=size(Cas,2)/NbCas*100;
end