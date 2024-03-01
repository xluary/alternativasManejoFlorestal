function VET = calcularVET(idadesRotacao, producao, C, rotacaoOtima)
    rotacao = 1;
    idadeInicial = 0;
    primeiroAnoHP = 0;

    anoUltimoCorte = sum(idadesRotacao(1,:));
    
    anosHP = primeiroAnoHP:anoUltimoCorte;
    producaoInicial = 0;
    idadeCorteInicial = 0;
    vetorReceita = calcularReceita(anosHP, idadesRotacao, producao, producaoInicial, C.precoMadeira, rotacaoOtima, idadeInicial, rotacao, idadeCorteInicial);
    
    vetorCusto = calcularCusto(anosHP, C, idadesRotacao, producao, rotacaoOtima, idadeInicial, 0, rotacao, producaoInicial, idadeCorteInicial); 

    
    
    lucro = vetorReceita - vetorCusto;
    VPL = calcularVPL(lucro, C.taxaJuros, anosHP);
    VPLfinal =  sum(VPL(1,:));
    RLT = VPLfinal*(1+C.taxaJuros)^anoUltimoCorte;
    VET = RLT/(((1+C.taxaJuros)^anoUltimoCorte)-1);
end





