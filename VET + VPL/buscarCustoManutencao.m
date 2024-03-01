function custo = buscarCustoManutencao(custoManutencao, idade)
    [~, l] = size(idade);
    [q, ~] = size(custoManutencao);
    custo = [];
    for i = 1 : l
        idadeAno = idade(1, i);
        for j = 1 : q
            idadeTabela = custoManutencao(j,1);
            if idadeAno > 0
                if idadeTabela == idadeAno
                    custo(1, end+1) = custoManutencao(j, 2);
                    break;
                end
            else
                break;
            end

        end

    end
end