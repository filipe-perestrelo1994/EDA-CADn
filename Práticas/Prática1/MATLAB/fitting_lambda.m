function K=fitting_lambda(xdata,ydata)
    %Função onde se faz fitting para descobrir lambda
    Ki = [100]; % Starting guess
    ydata=ydata*1e5;
    xdata=xdata*1e5;
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata);
    figure
    p1=plot(xdata,ydata,'g');
    hold on
    newY= xdata*((1+(K(1)*1.2))/(1+(K(1)*0.8)));
    p2=plot(xdata,newY,'r');
    title('Fitting de lambda');
    xlabel('ID para VDS=0.8 V (A)');
    ylabel('ID para VDS=1.2 V (A)');
    legend([p1,p2],'Curva original','Curva aproximada');
    function F = myfun(x,xdata)
        F = xdata*((1+(x(1)*1.2))/(1+(x(1)*0.8)));
    end    
end