function  x=mylsqftiT()
xdata = [0.9 1.5 13.8 19.8 24.1 28.2 35.2 60.3 74.6 81.3];
ydata = [455.2 428.6 124.1 67.3 43.2 28.1 13.1 -0.4 -1.3 -1.5];
Ki = [100; -1] % Starting guess

[K,resnorm] = lsqcurvefit(@myfun,Ki,xdata,ydata)
plot(xdata,ydata,'+');
hold on
newY=K(1)*exp(K(2)*xdata);
plot(xdata, newY,'r');
end
function F = myfun(x,xdata)
F = x(1)*exp(x(2)*xdata); 


end

