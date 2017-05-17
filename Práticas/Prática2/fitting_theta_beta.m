function K = fitting_theta_beta(xdata,ydata,gamma,fi,w,l,Ut,Vp_new)
    Ki = [0.1,0.1]; % Starting guess
    min=[0 -1];
    max=[1e-3 0];
    option.TolFun=1e-12;
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata,min,max,option);
    figure
    p1=plot(xdata,ydata,'g');
    hold on
    newY = 2*(Ut^2)*xdata.*(K(1)./(1+(K(2)*Vp_new)))*(w/l);
    p2=plot(xdata,newY,'r');
    title('Fitting de theta e beta');
    xlabel('n');
    ylabel('Is');
    legend([p1,p2],'Curva original','Curva aproximada');
    function F = myfun(x,xdata)
        F = 2*(Ut^2)*xdata.*(x(1)./(1+(x(2)*Vp_new)))*(w/l);
    end
end