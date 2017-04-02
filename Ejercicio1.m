function Ejercicio1()
    load('datosPruebas.mat');
    figure();
    graficarPuntos(X);
    graficarPunto(x1,'.r');
    graficarPunto(x2,'.g');
    graficarPunto(mu(:),'.y');
end

function graficarPuntos(X)
    plot(X(:,1),X(:,2),'.','markersize',15)
    hold on;
end

function graficarPunto(punto,color)
    plot(punto(1),punto(2),color,'markersize',15)
    hold on;
end