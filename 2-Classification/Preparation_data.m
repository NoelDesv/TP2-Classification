function [ X,T,R_final ] = Preparation_data( R, Nb_classe )
%Filtre le nombre de classes voulues
R_final = R(R(:,3)==1,:);
for ii=2:Nb_classe
    R_tampon= R(R(:,3)==ii,:);
    R_final =[R_final;R_tampon];
end
X = R_final(:,1:2);
T = classes2oneofK(R_final(:,3));
end

