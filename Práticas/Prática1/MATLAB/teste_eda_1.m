%W = 4u L = 2u
%Id(vgs) e Id(Vds)
%Parâmetros do modelo
%Verificar a precisão do modelo: Definir funções que permitem gerar id(Vgs)
%e id(Vds,Vgs)
%Repetir com W=800n e L=400n
%Vt é Vt0 e lambda é lambda0
% (Id1/Id2) = (1+lambda*Vds1)/(1+lambda*Vds2)
function teste_eda_1(file1,file2)
%Função para representar as carcterísticas Id(Vds) para as duas dimensões
%do transistor

close all
clc
data = load(file1);

vgsx12 = data(:,1);
vgsy12 = data(:,2);
vgsx10 = data(:,3);
vgsy10 = data(:,4);
vgsx8 = data(:,5);
vgsy8 = data(:,6);
vgsx6 = data(:,7);
vgsy6 = data(:,8);
vgsx4 = data(:,9);
vgsy4 = data(:,10);

data2 = load(file2);
vgsx12_1 = data2(:,1);
vgsy12_1 = data2(:,2);
vgsx10_1 = data2(:,3);
vgsy10_1 = data2(:,4);
vgsx8_1 = data2(:,5);
vgsy8_1 = data2(:,6);
vgsx6_1 = data2(:,7);
vgsy6_1 = data2(:,8);
vgsx4_1 = data2(:,9);
vgsy4_1 = data2(:,10);

%
% L = 400 nm e W = 800 nm
% 
% vdsn=data(:,1);
% npoints=length(vdsn);
% vds1=npoints-3;
% vds2=npoints-23;
% vds6=npoints-40;
% 
% Idn=vgsy12;
% Id1=data(vds1,2)
% Id2=data(vds2,2)
% 
% lambda0 = (Id1-Id2)/((Id2*vds1)-(Id1*vds2));
% 
% L1 = 400 * 10^-9;
% W1 = 800 * 10^-9;
% vds3 = vds1;
% vds4 = vds1;
% vds5 = vds1;
% 
% Id3 = Id1;
% Id4=data(vds4,4);
% Id5=data(vds5,8);
% 
% Iz3 = Id3 /(1+(lambda0*vds3))
% Iz4 = Id4 /(1+(lambda0*vds4))
% Iz5 = Id5 /(1+(lambda0*vds5))
% 
% Vgs3 = 1.2;
% Vgs4 = 1;
% Vgs5 = 0.6;
% 
% syms Vt0
% equ = log10(Iz3/Iz4)*log10((Vgs4-Vt0)/(Vgs5-Vt0))-log10(Iz4/Iz5)*log10((Vgs3-Vt0)/(Vgs4-Vt0));
% vt0 = vpasolve(equ,Vt0,0:1.2)
% 
% n = log(Iz3/Iz4)/log((Vgs3-vt0)/(Vgs4-vt0))
% 
% B = (Iz3/((Vgs3-vt0)^n))*(0.5)
% 
% vds7 = vds6;
% Vgs6 = Vgs3;
% Vgs7 = 0.8;
% 
% ID6 = data(vds6,2)
% ID7 = data(vds7,6)
% 
% leff = 25 * 10^-8;
% 
% E6 = ID6 /(B*(W1/leff)*((Vgs6-vt0)^n)*(1+lambda0*vds6));
% E7 = ID7 /(B*(W1/leff)*((Vgs7-vt0)^n)*(1+lambda0*vds7));
% 
% Vdsat6 = vds6*(1+(1-E6)^0.5)/E6;
% Vdsat7 = vds7*(1+(1-E7)^0.5)/E7;
% 
% m = log10(Vdsat6/Vdsat7)/(log10((Vgs6-vt0)/(Vgs7-vt0)))
% K = Vdsat6/(Vgs6-vt0)^m


figure(1)
p1=plot(vgsx12,vgsy12,'g');
hold on
plot(vgsx10,vgsy10,'g')
plot(vgsx8,vgsy8,'g')
plot(vgsx6,vgsy6,'g')
plot(vgsx4,vgsy4,'g')

p2=plot(vgsx12_1,vgsy12_1,'r');
plot(vgsx10_1,vgsy10_1,'r')
plot(vgsx8_1,vgsy8_1,'r')
plot(vgsx6_1,vgsy6_1,'r')
plot(vgsx4_1,vgsy4_1,'r')
title('ID(VDS) para w=4u e l=2u e w=800n e l=400n');
xlabel('VDS(V)');
ylabel('ID(A)');
legend([p1,p2],'w=800n e l=400n','w=4u e l=2u');
hold off


end