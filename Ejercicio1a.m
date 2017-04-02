function[distmu_x1,distmu_x2] = Ejercicio1a()
    load('datosPruebas.mat');
    distmu_x1 = distanciaEuclidiana(x1,mu(:)');
    distmu_x2 = distanciaEuclidiana(x2,mu(:)');    
end

function[n] = distanciaEuclidiana(V,Y)
 n = sqrt(sum((V-Y).^2));
end