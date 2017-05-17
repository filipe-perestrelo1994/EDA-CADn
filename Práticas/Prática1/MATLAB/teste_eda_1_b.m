function teste_eda_1_b(file1,w,l)

close all
clc
data = load(file1);

vdsn=data(:,1);

%Posições no vector de dados onde vamos buscar os valores de vds e id
npoints=length(vdsn)
vds1=npoints-3;
vds2=npoints-23;
vds6=5;

if (w == 4*10^-6) && (l == 2*10^-6)
    Id1=data(vds1,4)
    Id2=data(vds2,4)
else
    Id1=data(vds1,2)
    Id2=data(vds2,2)
end

if (w == 4*10^-6) && (l == 2*10^-6)
    VDS6 = data(vds6,3);
    VDS1 = data(vds1,3);
    VDS2 = data(vds2,3);
else
    VDS6 = data(vds6,1);
    VDS1 = data(vds1,1);
    VDS2 = data(vds2,1);
end
    
lambda0 = (Id1-Id2)/((Id2*VDS1)-(Id1*VDS2))

VDS3 = VDS1;
VDS4 = VDS1;
VDS5 = VDS1;

Id3 = Id1;

if (w == 4*10^-6) && (l == 2*10^-6)
    Id4=data(vds1,2);
else
    Id4=data(vds1,4);
end

Id5=data(vds1,8);

Iz3 = Id3 /(1+(lambda0*VDS3))
Iz4 = Id4 /(1+(lambda0*VDS4))
Iz5 = Id5 /(1+(lambda0*VDS5))

Vgs3 = 1.2;
Vgs4 = 1;
Vgs5 = 0.6;

syms Vt0
equ = log10(Iz3/Iz4)*log10((Vgs4-Vt0)/(Vgs5-Vt0))-log10(Iz4/Iz5)*log10((Vgs3-Vt0)/(Vgs4-Vt0));

% S = Vt0
S = vpasolve(equ,Vt0,0:1.2)

n = log10(Iz3/Iz4)/log10((Vgs3-S)/(Vgs4-S))

B = (Iz3/((Vgs3-S)^n))*(0.5)

VDS7 = VDS6;
Vgs6 = Vgs3;
Vgs7 = 0.8;

if (w == 4*10^-6) && (l == 2*10^-6)
    ID6 = data(vds6,4)
else
    ID6 = data(vds6,2)
end
ID7 = data(vds6,6)

%Neste caso, assume-se que o comprimento eficaz do transistor é o seu próprio
%comprimento
leff = l;

E6 = ID6 /(B*(w/leff)*((Vgs6-S)^n)*(1+lambda0*VDS6))
E7 = ID7 /(B*(w/leff)*((Vgs7-S)^n)*(1+lambda0*VDS7))

Vdsat6 = VDS6*(1+(sqrt(1-E6)))/E6
Vdsat7 = VDS7*(1+(sqrt(1-E7)))/E7

m = log(Vdsat6/Vdsat7)/(log((Vgs6-S)/(Vgs7-S)))
K = Vdsat6/(Vgs6-S)^m

VGS = 0.4:0.2:1.2;
VDS = 0:0.01:1.2;
%Ciclo para organizar e representar as características de Id para os 5
%valores de VGS
    for j=2:length(VGS)
        for i=1:length(VDS)
            p(i)=teste_eda_2(VGS(j),VDS(i),w,l,B,n,S,m,K,lambda0);
        end
        plot(VDS,p)
        hold on
    end
    title('ID(VDS) para VGS = 1.2 V, 1 V, 0.8V e 0.6 V');
    xlabel('VDS(V)');
    ylabel('ID(A)');
    hold off
%% 3ª parte %%
    %Extraem-se as carcterísticas Id(VGS)
    if (w == 4*10^-6) && (l == 2*10^-6)
        dados12 = xlsread('ID_vds_1.2_L4u_W2u.xlsx');
        dados08 = xlsread('ID_vds_0.8_L4u_W2u.xlsx');
    else
        dados12 = xlsread('ID_vds_1.2_L800n_W400n.xlsx');
        dados08 = xlsread('ID_vds_0.8_L800n_W400n.xlsx');
    end 
    
    VGS_12 = dados12(:,1);
    VGS_08 = dados08(:,1);
    ID_12 = dados12(:,2);
    ID_08 = dados08(:,2);
    figure;
    plot(VGS_12,ID_12);
    title('ID(VGS) para VDS = 1.2 V');
    xlabel('VGS(V)');
    ylabel('ID(A)');
    
    %Excluem-se valores de VGS<0.7, pelo facto de os id serem demasiado
    %pequenos para a escala de valores do Matlab
    ID_08 = ID_08(find(VGS_08>0.7));
    ID_12 = ID_12(find(VGS_12>0.7));
    VGS_12 = VGS_12(find(VGS_12>0.7));
    gm = diff(ID_12)./diff(VGS_12);
    %charac -> Característica Id/gm
    charac = ID_12(2:end)./gm;
    figure;
    plot(charac,'o')
    title('Característica Id/gm');
    val = mylsqftiT(VGS_12(2:end),charac);
    vt_3 = val(1)
    n_3 = val(2)
    lamb = fitting_lambda(double(ID_08),double(ID_12));
    lambda = lamb(1)
    b = fitting_B(VGS_12,ID_12,lambda,n_3,vt_3,w,l);
    B = b(1)
    
    %fitting de idsat e vdsat
    
    if (w == 4*10^-6) && (l == 2*10^-6)
        coef12= 3;
        coef10= 1;
    else
        coef12= 1;
        coef10= 3;
    end
    
    idsat_12 = fitting_idsat(data(end-15:end,coef12),data(end-15:end,(coef12+1)),lambda);
    idsat_10 = fitting_idsat(data(end-15:end,coef10),data(end-15:end,(coef10+1)),lambda);
    idsat_08 = fitting_idsat(data(end-15:end,5),data(end-15:end,6),lambda);
    idsat_06 = fitting_idsat(data(end-15:end,7),data(end-15:end,8),lambda);
    idsat_04 = fitting_idsat(data(end-15:end,9),data(end-15:end,10),lambda);
    
    vdsat_12 = fitting_vdsat(data(:,coef12),data(:,(coef12+1)),idsat_12,lambda);
    vdsat_10 = fitting_vdsat(data(:,coef10),data(:,(coef10+1)),idsat_10,lambda);
    vdsat_08 = fitting_vdsat(data(:,5),data(:,6),idsat_08,lambda);
    vdsat_06 = fitting_vdsat(data(:,7),data(:,8),idsat_06,lambda);
    vdsat_04 = fitting_vdsat(data(:,9),data(:,10),idsat_04,lambda);
    
    ydata = [vdsat_04 vdsat_06 vdsat_08 vdsat_10 vdsat_12]
    xdata = [0.4 0.6 0.8 1 1.2]
    Values = fitting_mk(xdata(2:end),ydata(2:end),vt_3);
    
    M=Values(1)
    K=Values(2)
end

