function K=fitting_idsat(xdata,ydata,lambda)
    %Função para descobrir idsat por fitting
    Ki = [100]; % Starting guess
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata);
    newY= K(1)*(1+(lambda*xdata));
    function F = myfun(x,xdata)
        F = x(1)*(1+(lambda*xdata));
    end    
end