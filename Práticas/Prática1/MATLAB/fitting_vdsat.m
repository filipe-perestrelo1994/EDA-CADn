function K=fitting_vdsat(xdata,ydata,idsat,lambda)
    %função para descobrir vdsat por fitting
    Ki = [0.0002]; % Starting guess
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata);
    function [F] = myfun(x,xdata)
        if(xdata>x(1))
            F=idsat*(1+lambda*xdata);
        else
            F=idsat*(1+lambda*xdata).*(2-(xdata/x(1))).*(xdata/x(1));
        end
    end    
end