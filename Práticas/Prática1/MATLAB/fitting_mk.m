function K=fitting_mk(xdata,ydata,vt)
    %Função para descobrir m e k por fitting
    Ki = [1,1]; % Starting guess
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata);
    figure
    p1=plot(xdata,ydata,'g');
    hold on
    newY = K(1)*((xdata-vt).^K(2));
    p2=plot(xdata,newY,'r');
    title('Fitting de m e K');
    xlabel('VDSAT(V)');
    ylabel('VGS (V)');
    legend([p1,p2],'Curva original','Curva aproximada');
    function F = myfun(x,xdata)
        F = x(1).*((xdata-vt).^x(2));
    end    
end