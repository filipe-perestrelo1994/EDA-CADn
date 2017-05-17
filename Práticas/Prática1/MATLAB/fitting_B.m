function K=fitting_B(xdata,ydata,lambda,n_3,vt,w,l)
    %Função onde se faz fitting para descobrir B
    Ki = [100]; % Starting guess
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata);
    figure
    p1=plot(xdata,ydata,'g');
    hold on
    newY= (w/l)*K(1)*(1+lambda*1.2)*((xdata-vt).^n_3);
    p2=plot(xdata,newY,'r');
    title('Fitting de B');
    xlabel('VGS para VDS=1.2 V (V)');
    ylabel('ID para VDS=1.2 V (A)');
    legend([p1,p2],'Curva original','Curva aproximada');
    function F = myfun(x,xdata)
        F = (w/l)*x(1)*(1+lambda*1.2)*((xdata-vt).^n_3);
    end    
end