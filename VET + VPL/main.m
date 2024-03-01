clear all;
close all;
clc;

produtividade =load("produtividade.txt");    
talhoes = load("talhoes.txt");
T = myConstantsTalhoes();
P = myConstantsProducao();
C = myConstants();
idadesCorte = combinarIdadesCortes(C);
[qCombinacao, ~] = size(idadesCorte);
[qTalhoes,~] = size(talhoes);
rotacao = 1;
VPL = [];
BD = zeros(qTalhoes,C.HP);
controleVPL = 1;
for j = 1: qTalhoes
    idade = talhoes(j, T.Idade);
    id = talhoes(j, T.ID);
    vetList = [];
    for i = 1 : qCombinacao
        idadesRotacao = idadesCorte(i,:); 
        producao = determinarProducao(id, idadesRotacao, rotacao, produtividade, P);
        rotacaoOtima = idadesRotacao;
        VET = calcularVET(idadesRotacao, producao, C, rotacaoOtima);
        vetList(i,:) = VET;
    end   
    [VETEstrela, posicaoIdadeRotacao] = max(vetList);
    rotacaoOtima = idadesCorte(posicaoIdadeRotacao, :);
    contadorIdade = 0;
    rotacao = talhoes(j, T.Rotacao);
    for k = 1: qCombinacao
        idadesRotacao = idadesCorte(k,:);
        idadePrimeiroAno = idade + 1;
        producaoInicial = 0;
        if idadePrimeiroAno > idadesRotacao(1,1)            
          
            idadeCorte = idadePrimeiroAno + contadorIdade;
            producaoInicial = determinarProducao(id, idadeCorte, rotacao, produtividade, P);

           if idadeCorte >= C.idadeMaxCorte
                contadorIdade = 0;
           else
                contadorIdade = contadorIdade + 1;
           end
     
        end
        producao = determinarProducao(id, idadesRotacao, rotacao, produtividade, P);
        
        [Pcoeficiente, vetorProducao] = calcularCoeficiente (VETEstrela, C, idadesRotacao, rotacaoOtima, idade, rotacao, producao, producaoInicial, idadeCorte);
        VPL = Pcoeficiente*talhoes(j,T.Area);
        
        [~, qAno] = size(vetorProducao);
        controle = 1;
        for z = 1: C.HP
            if controle <= qAno
                BD(controleVPL,z) = vetorProducao(1,z);
            else
                BD(controleVPL,z) = 0;
            end
            controle = controle+1;
        end
        BD(controleVPL,z+1) = VPL;
        VPL(controleVPL,:) = VPL;
        controleVPL = controleVPL + 1;
    end
  
end




 



