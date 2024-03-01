function data = gerarArquivoData (baseDeDados, qPrescricoes)

    [l, ~] = size(baseDeDados);

    colunas  = qPrescricoes;

    linhas=l/colunas;

    controleBaseDeDados = 1;
    for i = 1: linhas
        for j = 1: colunas
            field1 = "production";
            field2 = "VPL";
            value1 = baseDeDados(controleBaseDeDados, 1:16);
            value2 = baseDeDados(controleBaseDeDados, 17);
            data(i,j) = struct(field1, value1, field2, value2);
            controleBaseDeDados = controleBaseDeDados +1;
        endfor

    endfor
    mat_file = matfile('data.mat');
    save('data.mat', 'data');
end
