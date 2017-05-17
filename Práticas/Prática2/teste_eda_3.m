%If -> Tem a ver com a tensão na source
%Ir -> Tem a ver com a tensão no dreno
%Ut -> Tensão térmica
%n -> valor variável
%Vp -> Tensão de pintch-off
%Vg-Vt-nVs ~= Vgs-Vt
function teste_eda_3(filename,filename2,filename3)
    clc
    close all
    Id = csvread(filename);
    
    figure;
    plot(Id(:,1),Id(:,2))
    title('Id(Vgs)');
    grid on;
    Ut = 0.025;
    coefficients = polyfit(Id(1:end-20,1), sqrt(Id(1:end-20,2)), 1);
    figure;
    plot(Id(:,1),sqrt(Id(:,2)));
    slope = coefficients(1)
    slope = abs(slope);
    Is = (2*slope*Ut)^2
    Id = Is *(log(2)^2)
    
    Vp = csvread(filename2);
    
    figure;
    plot(Vp(:,1),Vp(:,2));
    title('Vp(Vg)');
    grid on;
    coefficients = polyfit(Vp(:,1), Vp(:,2), 1);
    Vt0 = -(Vp(1,2)/coefficients(1))
    fi_e_gamma = fitting_fi_gamma(Vp(:,1),Vp(:,2),Vt0);
    fi = fi_e_gamma(1)
    gamma = fi_e_gamma(2)
    vtnew=fi_e_gamma(3)
    
    Id_Vg = csvread(filename3);
    
    Is = Id_Vg(:,2)/(log(1+exp((Vp(:,2)-0)/(2*Ut))).^2);
    w = 4*10^-6;
    l = 2*10^-6;
    beta_e_theta = fitting_theta_beta(Vp(:,2),Is,gamma,fi,w,l,Ut);
    beta = beta_e_theta(1)
    theta = beta_e_theta(2)
    
    
    
end