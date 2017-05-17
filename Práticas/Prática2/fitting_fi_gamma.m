function K = fitting_fi_gamma(xdata,ydata,Vt0)
    Ki = [0.5,0.4,Vt0]; % Starting guess
    min=[0 0 0.3];
    max=[1.2 1.2 0.6];
    option.TolFun=1e-12;
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata,min,max,option);
    figure
    p1=plot(xdata,ydata,'g');
    hold on
    Vg = xdata-K(3)+K(1)+K(2)*sqrt(K(1));
    newY= Vg-K(1)-K(2)*(sqrt(Vg+((0.5*K(2))^2))-(0.5*K(2)));
    p2=plot(xdata,newY,'r');
    title('Fitting de fi e gamma');
    legend([p1,p2],'Curva original','Curva aproximada');
    function F = myfun(x,xdata)
        Vg_linha = xdata-x(3)+x(1)+x(2)*sqrt(x(1));
        F = Vg_linha-x(1)-x(2)*(sqrt(Vg_linha+((0.5*x(2))^2))-(0.5*x(2)));
    end
end