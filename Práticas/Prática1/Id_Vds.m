function [ output_args ] = Id_Vds( input_args )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

M = csvread('Tabela3Pratica1_L2u_W4u_Matlab.csv')

vgs1=M(:,1);
Id1=M(:,2);
vgs2=M(:,3);
Id2=M(:,4);
vgs3=M(:,5);
Id3=M(:,6);
vgs4=M(:,7);
Id4=M(:,8);
vgs5=M(:,9);
Id5=M(:,10);
hold on
plot(vgs1,Id1,'g');
plot(vgs2,Id2,'m');
plot(vgs3,Id3,'r');
plot(vgs4,Id4,'y');
plot(vgs5,Id5,'b');
hold off

N = csvread('Tabela3Pratica1_L400n_W800n_Matlab.csv')

vdsn=N(:,1);
npoints=length(vdsn)
vds2=npoints-3
vds1=npoints-10

Idn=N(:,2);
Id1=N(vds1,2)
Id2=N(vds2,2)
hold on
plot(vdsn,Idn);
hold off

end

