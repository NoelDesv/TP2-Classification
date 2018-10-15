function plotdecr(W,minx,maxx,miny,maxy,nbp,tit)
%Calcul du pas
pas=(maxx-minx)/(-1+sqrt(nbp))
disp(pas)
indice=1;

for ii=0:(maxx-minx)/pas
    for jj=0:(maxy-miny)/pas
    indice=indice+1;
    X(indice,1)=minx+ii*pas;
    X(indice,2)=miny+jj*pas;
    end
end
C=predcls(X,W);
indice=1;
figure;
hold on
for ii=0:(maxx-minx)/pas
    for jj=0:(maxy-miny)/pas
    indice=indice+1;
    if(C(indice)==1)
        scatter(X(indice,1),X(indice,2),'r');
    end
    if(C(indice)==2)
        scatter(X(indice,1),X(indice,2),'g');
    end
    if(C(indice)==3)
        scatter(X(indice,1),X(indice,2),'y');
    end
    if(C(indice)==4)
        scatter(X(indice,1),X(indice,2),'k');
    end
    end
end

end

