function x=optimizacao()

%xdata -> vgs
%ydata -> Id/gm


Vds=1.2;
leff=l;
W=w;

Idsat=(W/leff)*B*(Vgs-Vt)^n
Vdsat=K*(Vgs-Vt)
Id=Idsat(1+lambda*Vds)
gm=(W/leff)*B*n*(Vgs-Vt)^(n-1)*(1+lambda*Vds)
%(Idsat/gm) = n*(Vgs-Vt)

xdata=Vgs;
ydata=n*(Vgs-Vt);



end

function F= funcao(x,xdata)

F=n*(x(1)-xdata)

end


