function [P, vetorProducao] = calcularCoeficiente (VETEstrela, C, idadesRotacao, rotacaoOtima, idadeInicial, rotacao, producao, producaoInicial, idadeCorteInicial)
    anosHP = 0:C.HP;
    vetorReceita = calcularReceita(anosHP, idadesRotacao, producao, producaoInicial, C.precoMadeira, rotacaoOtima, idadeInicial, rotacao, idadeCorteInicial);
    
    [vetorCusto, vetorProducao] = calcularCusto(anosHP, C, idadesRotacao, producao, rotacaoOtima, idadeInicial, 1, rotacao, producaoInicial, idadeCorteInicial); 
    lucro = vetorReceita - vetorCusto;
    [~, c] = size(lucro);
    ultimoAno = c-1;
    anosHPatt = 0:ultimoAno;
    VPL = calcularVPL(lucro, C.taxaJuros, anosHPatt);
    VPLfinal =  sum(VPL(1,:));  
    
    VETfinal = VETEstrela/((1+C.taxaJuros)^ultimoAno);
    P = VPLfinal+VETfinal;
end