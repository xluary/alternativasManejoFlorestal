function [vetorCusto, vetorProducao] = calcularCusto(anosHP, C, idadesRotacao, producao, rotacaoOtima, idadeInicial, alternativa, rotacao, producaoInicial, idadeCorteInicial)
    
    [~ , qRotacao] = size(idadesRotacao); 

    %custo de exploracao
    valor = producao .* C.custoExploracao;

    if producaoInicial == 0
        [vetor, ~, mapeamentoIdade] = gerarVetorColheita(anosHP, idadesRotacao, idadeInicial, rotacao, rotacaoOtima);
        [~,c] = size(vetor);
        vetorCusto = zeros(1,c);
        vetorProducao = zeros(1,c);
        for i = 1: qRotacao
            posicao = pegarPosicao(vetor, i);
            vetorProducao = adicionarAoVetor(2, vetorProducao, posicao, producao(1,i));
            vetorCusto = adicionarAoVetor(2, vetorCusto, posicao, valor(1,i));
        end
    else
         valorInicial = producaoInicial * C.custoExploracao;
         valor = [valor valorInicial];
         producao = [producao producaoInicial];
         [vetor, ~, mapeamentoIdade] = gerarVetorColheitaComInicial(anosHP,idadesRotacao, idadeInicial, rotacao, rotacaoOtima, idadeCorteInicial);
         [~,c] = size(vetor);
         vetorReceita = zeros(1,c);
         vetorProducao = zeros(1,c);
          for i = 1: qRotacao +1
            posicao = pegarPosicao(vetor, i);   
            vetorProducao = adicionarAoVetor(2, vetorProducao, posicao, producao(1,i));
            vetorCusto = adicionarAoVetor(2, vetorReceita, posicao, valor(1,i));
          end
    end
    %custo de implantacao
    if idadeInicial == 0
        vetorManutencao = 2:c;
        vetorCusto = adicionarAoVetor(2, vetorCusto, 1, C.custoImplantacao);
    else 
        vetorManutencao = 1:c;
    end

    if alternativa==1
       posicao = pegarPosicao(vetor, qRotacao);
       [~, qSegundaRotacao] = size(posicao);
       posicao = posicao(1: qSegundaRotacao-1);
       vetorCusto = adicionarAoVetor(2, vetorCusto, posicao, C.custoImplantacao);
    end
    

    %custo de manutenção
    custo = buscarCustoManutencao(C.custoManutencao, mapeamentoIdade);
    vetorCusto = adicionarAoVetor(1, vetorCusto, vetorManutencao, custo);

end