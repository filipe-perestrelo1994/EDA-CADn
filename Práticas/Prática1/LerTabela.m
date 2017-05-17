function  LerTabela( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

figure(1)
M = csvread('Tabela2Pratica1.csv');
vgs = M(:,1);
id = M(:,2);
plot(vgs,id,'g');

N = csvread('TabelaPratica1.csv');
vgs2 = N(:,1);
id2 = N(:,2);
hold on
plot(vgs2,id2,'g');

hold off


figure(2)
Grande = csvread('Tabela3Pratica1_L2u_W4u.csv');
vgsGrande1 = Grande(:,1);
vdsGrande1 = Grande(:,2);
vgsGrande2 = Grande(:,3);
vdsGrande2 = Grande(:,4);
vgsGrande3 = Grande(:,5);
vdsGrande3 = Grande(:,6);
vgsGrande4 = Grande(:,7);
vdsGrande4 = Grande(:,8);
vgsGrande5 = Grande(:,9);
vdsGrande5 = Grande(:,10);
hold on
plot(vgsGrande1,vdsGrande1,'b');
plot(vgsGrande2,vdsGrande2,'b');
plot(vgsGrande3,vdsGrande3,'b');
plot(vgsGrande4,vdsGrande4,'b');
plot(vgsGrande5,vdsGrande5,'b');
hold off

Pequeno = csvread('Tabela3Pratica1_L400n_W800n.csv');
vgsPequeno1 = Pequeno(:,1);
vdsPequeno1 = Pequeno(:,2);
vgsPequeno2 = Pequeno(:,3);
vdsPequeno2 = Pequeno(:,4);
vgsPequeno3 = Pequeno(:,5);
vdsPequeno3 = Pequeno(:,6);
vgsPequeno4 = Pequeno(:,7);
vdsPequeno4 = Pequeno(:,8);
vgsPequeno5 = Pequeno(:,9);
vdsPequeno5 = Pequeno(:,10);
hold on
plot(vgsPequeno1,vdsPequeno1,'r');
plot(vgsPequeno2,vdsPequeno2,'r');
plot(vgsPequeno3,vdsPequeno3,'r');
plot(vgsPequeno4,vdsPequeno4,'r');
plot(vgsPequeno5,vdsPequeno5,'r');
hold off





vdsn=Pequeno(:,1);
npoints=length(vdsn)
vds2=npoints-3
vds1=npoints-23


Idn=Pequeno(:,2);
Id1=Pequeno(vds1,2)
Id2=Pequeno(vds2,2)
hold on
plot(vdsn,Idn);
hold off

lambda0=((Id1-Id2)/((Id2*vds1)-(Id1*vds2)))

vds3=vds1;
vds4=vds1;
vds5=vds1;

Id3=Id1;
Id4=Pequeno(vds4,4)
Id5=Pequeno(vds5,8)

Iz3=Id3/(1+(lambda0*vds3))
Iz4=Id4/(1+(lambda0*vds4))
Iz5=Id5/(1+(lambda0*vds5))


vgs3=Pequeno(vds4,5)
vgs4=Pequeno(vds4,7)
vgs5=Pequeno(vds5,9);


syms Vt0;

eq1=((log10(Iz3/Iz4)*log10((vgs4-Vt0)/(vgs5-Vt0)))-(log10(Iz4/Iz5)*log10((vgs3-Vt0)/(vgs4-Vt0)))==0);
S = vpasolve(eq1,Vt0,0:1.2)


n=log10(Iz3/Iz4)/(log((vgs3-Vt0)/(vgs4-Vt0)))



end

