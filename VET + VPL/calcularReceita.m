function vetorReceita = calcularReceita (anosHP, idadesRotacao, producao, producaoInicial, precoMadeira, rotacaoOtima, idadeInicial, rotacao, idadeCorteInicial)

    [~ , qRotacao] = size(idadesRotacao);  

    if producaoInicial == 0
              
        [vetor, idade] = gerarVetorColheita(anosHP, idadesRotacao, idadeInicial, rotacao, rotacaoOtima);
        preco = buscarNoTXT(idadesRotacao, precoMadeira);       
        valor = producao .* preco;
        [~,c] = size(vetor);
        vetorReceita = zeros(1,c);
        for i = 1: qRotacao
            posicao = pegarPosicao(vetor, i);   
            vetorReceita = adicionarAoVetor(2, vetorReceita, posicao, valor(1,i));
        end
    else
         [vetor, idade] = gerarVetorColheitaComInicial(anosHP,idadesRotacao, idadeInicial, rotacao, rotacaoOtima, idadeCorteInicial);
         producao = [producaoInicial producao ];
         idade = [idadesRotacao idadeCorteInicial];
         preco = buscarNoTXT(idade, precoMadeira);   
         valor = producao .* preco;
        
          [~,c] = size(vetor);
          vetorReceita = zeros(1,c);

          for i = 1: qRotacao +1
            posicao = pegarPosicao(vetor, i);   
            vetorReceita = adicionarAoVetor(2, vetorReceita, posicao, valor(1,i));
          end
    end
end

