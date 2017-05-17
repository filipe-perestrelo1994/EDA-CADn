function K=fitting_m(xdata,ydata,vt,lambda,w,l,B,n)
    Ki = [100,-1]; % Starting guess
    [K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata);
    figure
    plot(xdata,ydata,'g');
    hold on
    newY = ((w/l)*B*((xdata-vt).^n)).*(1+lambda*(K(1)*(xdata-vt).^K(2)));
    plot(xdata,newY,'r')
    function F = myfun(x,xdata)
        F = ((w/l)*B*((xdata-vt).^n)).*(1+(lambda*(x(1)*((xdata-vt).^x(2)))));
    end    
end