function vetor = vetorColheita(anosHP,idadesRotacao, idade, rotacao)
    [~, c] = size(idadesRotacao);
    [~, anosHPc] = size(anosHP);

    primeiroCorte = idadesRotacao(1,rotacao) - idade;
    for i = 1 : anosHPc
        if anosHP(i) >= primeiroCorte
            vetor(1, 1) = i;
            break;
        end
    end
    
   
    for j = 2: c
        vetor(1,j) = vetor(1,1) + idadesRotacao(1,j);
    end  

end
