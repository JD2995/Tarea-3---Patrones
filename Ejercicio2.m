function Ejercicio2()
    load('datosPruebas.mat');
    covarianza = sigma(:,:);   %Punto1
    autovectores = eigValVec(covarianza);   %Punto 2
    [mediaSustraida,med] = mediaProbabilistica(X);
    Uprima = projectionMatriz(mediaSustraida,autovectores);
    disp(distanciaEuclidiana(x1,med));
    disp(distanciaEuclidiana(x2,med));
    x1 = x1-med;
    x2 = x2-med;
    med = mean(Uprima);
    x1prima = projectionVector(x1',autovectores)';
    x2prima = projectionVector(x2',autovectores)';
    figure();
    graficarPuntos(Uprima);
    graficarPunto(x1prima,'.r');
    graficarPunto(x2prima,'.g');
    graficarPunto(med,'.y');
    covarianzaPrima = cov(Uprima);
    disp(distanciaEuclidiana(x1prima,med));
    disp(distanciaEuclidiana(x2prima,med));
    %-----------Inicio de ejercicio 3-----------
    covarianzaPrima = covarianzaPrima;  %calculada anteriormente
    desv = [covarianzaPrima(1,1),covarianzaPrima(2,2)];    %desviacion estandar de la covarianza
    Uprima(:,1) = Uprima(:,1)/desv(1);  %Normalizacion segun std de dimension x
    Uprima(:,1) = Uprima(:,1)/desv(2);  %Normalizacion segun std de dimension y
    x1prima = x1prima./desv;
    x2prima = x2prima./desv;
    med = med./desv;
    figure();
    graficarPuntos(Uprima);
    graficarPunto(x1prima,'.r');
    graficarPunto(x2prima,'.g');
    graficarPunto(med,'.y');
    
end

function [eigVectors, eigValues ] = eigValVec(MatCov)
   [eigVectors, eigValues] = eig(MatCov);
   eigValues = sum(eigValues);
end

function [resultado,med] = mediaProbabilistica(Matrix)
   med = median(Matrix);
   resultado = [Matrix(:,1) - med(1)];
   resultado = [resultado,Matrix(:,2) - med(2)];
end

function proy = projectionMatriz(MatrixProy, Matrix)
   MatrixProy = MatrixProy';
   proy = [];
   maxI = length(MatrixProy(1,:));
   while 0 < maxI
       proyVector = projectionVector(MatrixProy(:,1), Matrix);
       proy = [proy proyVector];
       MatrixProy = MatrixProy(:, 2:length(MatrixProy(1,:)));
       maxI = maxI - 1;
   end
   proy = proy';
end

function proy = projectionVector(vector, Matrix)
   coeficienteProy1 = Matrix*inv(Matrix'*Matrix)*Matrix';
   proy = coeficienteProy1 * vector;
end

function graficarPuntos(X)
    plot(X(:,1),X(:,2),'.','markersize',15)
    hold on;
end

function graficarPunto(punto,color)
    plot(punto(1),punto(2),color,'markersize',15)
    hold on;
end

function[n] = distanciaEuclidiana(V,Y)
 n = sqrt(sum((V-Y).^2));
end