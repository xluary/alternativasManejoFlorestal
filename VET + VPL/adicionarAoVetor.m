function vetor = adicionarAoVetor (escolha, vetor, posicao, valores)
    [~,c] = size(posicao);
    for i = 1: c
        espaco = posicao(1,i);
            if escolha == 1
                 vetor(1, espaco) = vetor(1, espaco) + valores(1, i);
            else
                 vetor(1,espaco) = vetor(1, espaco) + valores;
            end
    end
end