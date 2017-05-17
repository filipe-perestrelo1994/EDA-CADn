function [ output_args ] = Id_Vgs( input_args )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

M = csvread('Id(Vgs)_4u_2u.csv');

vgs=M(:,1);
Id=M(:,2);

figure(1)
plot(vgs,Id,'b'); %modelo w=4u e L=2u 
xlabel('Vgs[V]')
ylabel('Id [A]')
grid on


Ut=0.025;

figure(2)
coefficients = polyfit(vgs(1:end-20),sqrt(Id(1:end-20)),1);
plot(vgs,sqrt(Id))
slope = coefficients(1);
slope = abs(slope);
Is = (2*slope*Ut)^2

figure(3)

M = csvread('Vs(Vg)_4u_2u.csv');
Vg=M(:,1);
Vp=M(:,2);
plot(Vg,Vp)

coefficients2 = polyfit(Vg,Vp,1);
Vt0=-(Vp(1)/coefficients2(1))

end


