function [Id,Idsat]= teste_eda_2(vgs,vds,w,l,B,n,vt,m,K,lambda0)
%Função para determinar o id para cada vds e vgs
Idsat = (w/l)*B*((vgs-vt)^n);
Vdsat = K*(vgs-vt)^m;
    if vds >= Vdsat
        Id=Idsat*(1+lambda0*vds);
    else
        Id=Idsat*(1+lambda0*vds)*(2-(vds/Vdsat))*(vds/Vdsat);
    end
end