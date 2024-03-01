function matrizCombinacao = combinarIdadesCortes(C)
    
    q = C.idadeMaxCorte - C.idadeMinimaCorte;
    qCombinacao = q*q;
    i = 1;
    vetor = [];
    vetorSoma = zeros(1, C.qRotacao);
    for j = 1: C.qRotacao
        vetor(1, end+1) = C.idadeMinimaCorte;
    end
    while i <= qCombinacao 
        vetorIdade = vetor + vetorSoma;
        matrizCombinacao(i,:) = vetorIdade ;
        vetorSoma(1,end) = vetorSoma(1,end)+1;
        for j = 1 : C.qRotacao
            if vetorSoma(1,j) >= q
                vetorSoma(1,j) = 0;
                vetorSoma(1, j-1) = vetorSoma(1, j-1) + 1;
            end
        end
        i = i + 1;
    end
    
end
