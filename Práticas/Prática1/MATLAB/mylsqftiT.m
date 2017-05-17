function K=mylsqftiT(xdata,ydata)
    %Função onde se faz ftting para descobrir vt e n
    Ki = [10,10]; % Starting guess
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata);
    figure
    p1=plot(xdata,ydata,'g');
    hold on
    newY= (1/K(2))*(xdata-K(1));
    p2=plot(xdata,newY,'r');
    title('Fitting de vt e n');
    xlabel('VGS para VDS = 1.2 V (V)');
    ylabel('Id/gm');
    legend([p1,p2],'Curva original','Curva aproximada');
    function F = myfun(x,xdata)
        F = (1/x(2))*(xdata-x(1));
    end    
end