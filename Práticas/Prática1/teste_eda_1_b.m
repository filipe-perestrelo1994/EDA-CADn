function lambda0 = teste_eda_1_b(file1,w,l)

close all
clc
data = load(file1);

if (w == 4*10^-6) && (l == 2*10^-6)
    vdsn=data(:,2);
else
    vdsn=data(:,1);
end

npoints=length(vdsn);
vds1=npoints-3;
vds2=npoints-23;
vds6=npoints-40;


if (w == 4*10^-6) && (l == 2*10^-6)
    Idn=data(:,4);
    Id1=data(vds1,4)
    Id2=data(vds2,4)
else
    Idn=data(:,2);
    Id1=data(vds1,2)
    Id2=data(vds2,2)
end

lambda0 = (Id1-Id2)/((Id2*vds1)-(Id1*vds2));

vds3 = vds1;
vds4 = vds1;
vds5 = vds1;

Id3 = Id1;

if (w == 4*10^-6) && (l == 2*10^-6)
    Id4=data(vds4,2);
else
    Id4=data(vds4,4);
end

Id5=data(vds5,8);

Iz3 = Id3 /(1+(lambda0*vds3))
Iz4 = Id4 /(1+(lambda0*vds4))
Iz5 = Id5 /(1+(lambda0*vds5))

Vgs3 = 1.2;
Vgs4 = 1;
Vgs5 = 0.6;

syms Vt0
equ = log10(Iz3/Iz4)*log10((Vgs4-Vt0)/(Vgs5-Vt0))-log10(Iz4/Iz5)*log10((Vgs3-Vt0)/(Vgs4-Vt0));
S = vpasolve(equ,Vt0,0:1.2)

n = log(Iz3/Iz4)/log((Vgs3-S)/(Vgs4-S))

B = (Iz3/((Vgs3-S)^n))*(0.5)

vds7 = vds6;
Vgs6 = Vgs3;
Vgs7 = 0.8;

if (w == 4*10^-6) && (l == 2*10^-6)
    ID6 = data(vds6,4)
else
    ID6 = data(vds6,2)
end
ID7 = data(vds7,6)

leff = 1;

E6 = ID6 /(B*(w/leff)*((Vgs6-S)^n)*(1+lambda0*vds6));
E7 = ID7 /(B*(w/leff)*((Vgs7-S)^n)*(1+lambda0*vds7));

Vdsat6 = vds6*(1+(1-E6)^0.5)/E6;
Vdsat7 = vds7*(1+(1-E7)^0.5)/E7;

m = log10(Vdsat6/Vdsat7)/(log10((Vgs6-S)/(Vgs7-S)))
K = Vdsat6/(Vgs6-S)^m

end