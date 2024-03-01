function producao = determinarProducao(talhaoID, idadesRotacao, rotacao, produtividade, P)
    producao = [];
    [l, ~] = size(produtividade);
    [~, c] = size(idadesRotacao);
    idadeAvalida = 1;
    for j = 1: c
        for i = 1: l
            idadeBuscada= idadesRotacao(1,idadeAvalida);
            rotacaoAtual = produtividade(i, P.Rotacao);
            idadeAtual = produtividade(i, P.Idade);
            talhao = produtividade(i,P.ID);
            if talhaoID == talhao && rotacaoAtual == rotacao && idadeAtual == idadeBuscada
                producao(1, end+1) = produtividade(i, end);
                idadeAvalida = idadeAvalida + 1;
                if rotacao >= c
                    rotacao = 1;
                else
                    rotacao = rotacao +1;
                end
                break;
            end
        end

    end
end