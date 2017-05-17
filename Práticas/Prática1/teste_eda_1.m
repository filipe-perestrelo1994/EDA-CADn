%W = 4u L = 2u
%Id(vgs) e Id(Vds)
%Parâmetros do modelo
%Verificar a precisão do modelo: Definir funções que permitem gerar id(Vgs)
%e id(Vds,Vgs)
%Repetir com W=800n e L=400n
%Vt é Vt0 e lambda é lambda0
% (Id1/Id2) = (1+lambda*Vds1)/(1+lambda*Vds2)
function lambda0 = teste_eda_1(file1,file2)

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

vdsn=vgsx12;
npoints=length(vdsn);
vds2=npoints-3;
vds1=npoints-23;

Idn=vgsy12;
Id1=data(vds1,2);
Id2=data(vds2,2);

lambda0 = (Id1-Id2)/((Id2*vds1)-(Id1*vds2));

figure(1)
plot(vgsx12,vgsy12,'g')
hold on
plot(vgsx10,vgsy10,'g')
plot(vgsx8,vgsy8,'g')
plot(vgsx6,vgsy6,'g')
plot(vgsx4,vgsy4,'g')

plot(vgsx12_1,vgsy12_1,'r')
plot(vgsx10_1,vgsy10_1,'r')
plot(vgsx8_1,vgsy8_1,'r')
plot(vgsx6_1,vgsy6_1,'r')
plot(vgsx4_1,vgsy4_1,'r')
hold off

end