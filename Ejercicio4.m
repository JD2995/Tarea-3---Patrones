function Ejercicio4()
    load('datosPruebas.mat');
    disp(calcularDistanciaMahalanobis(x1',mu(:,:)',sigma(:,:)));
    disp(calcularDistanciaMahalanobis(x2',mu(:,:)',sigma(:,:)));
end

function dist = calcularDistanciaMahalanobis(v1,v2,covarianza)
    dist = sqrt((v1-v2)'*inv(covarianza)*(v1-v2));
end