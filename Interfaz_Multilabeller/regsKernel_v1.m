function [ FitFunction,fitresult,xData, yData, zData,values,minix,maxx ] = regsKernel_v1( yev,X ,indc,neval,numc,plot_d)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
% Gaussian Functions - MultiVariable Optimization

ft = fittype( 'poly33' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Robust = 'Bisquare';
syms x y;
for L=1:neval
    for i1=1:numc
        indx=find(yev(:,L)==i1);%Busca todos los valores correspodientes a cada clase por cada etiquetador
        mu=mean(X(indx,indc));%Calcula la media de cada clase por etiquetador
        covs=cov(X(indx,indc));%Calcula la covarianza de cada clase por etiquetador
        Sigmat=std(X(indx,indc));%Calcula la desviacion de cada clase por etiquetador
        for iy=1:size(covs,1)
         %   covs(iy,iy)=Sigmat(iy);
        end
        x1=X(indx,indc(1));%Vector de caracteristicas de la clase i1
        x2=X(indx,indc(2));%Vector de caracteristicas de la clase i1
        [X1,X2] = meshgrid(X(indx,indc(1)),X(indx,indc(2)));%Crea una malla con los valores de x1 y x2 
        %x=[0.2000    1.1891]
        F = mvnpdf([X1(:) X2(:)],mu,covs);%Calcula La funcion de densidad de probabilidad por filas
        F = reshape(F,length(X(indx,indc(2))),length(X(indx,indc(1))));%Regresa los datos en forma de malla
        [xData{i1}{L}, yData{i1}{L}, zData{i1}{L}] = prepareSurfaceData( X2, X1, F );%Prepara los datos X1 y X2 para ser adecuados dentro de F
        minix{i1}(L,:)=[min(xData{i1}{L}) min(yData{i1}{L}) min(zData{i1}{L})];%Selecciona el valor minimo para la clase iterada en X Y y Z
        maxx{i1}(L,:)=[max(xData{i1}{L}) max(yData{i1}{L})  min(yData{i1}{L})];%Selecciona el valor maximo para la clase iterada en X Y y Z

        [fitresult{i1}{L}, gof] = fit( [xData{i1}{L}, yData{i1}{L}], zData{i1}{L}, ft, opts );%Ajusta la superficie a una curva con los parametros establecidos
        %
        if plot_d==1
            %[fitresult, gof] = fit( [xData, yData], zData, ft, opts );
            
            % Plot fit with data.
            figure( 'Name', 'untitled fit 1' );
            h = plot( fitresult{i1}{L}, [xData{i1}{L}, yData{i1}{L}], zData{i1}{L} );
            legend( h, 'untitled fit 1', 'F vs. X1, X2', 'Location', 'NorthEast' );
            % Label axes
            xlabel X1
            ylabel X2
            zlabel F
            grid on
        end
        %
        Formula = formula(fitresult{i1}{L});
        names = coeffnames(fitresult{i1}{L});
        values{i1}{L} = coeffvalues(fitresult{i1}{L});
        for idx = 1:numel(names)
            param = names{idx};
            l = length(param);
            loc = regexp(Formula, param);
            while ~isempty(loc)
                Formula = [Formula(1:loc-1) num2str(values{i1}{L}(idx)) Formula(loc+l:end)];
                loc = regexp(Formula, param);
            end
        end
        FitFunction{i1}{L} = sym(Formula);  %%Matriz de ecuaciones 
    end
end

end

