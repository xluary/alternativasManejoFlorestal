clear all;
close all;
clc;

%imports
load("talhoes.txt");
load("idadeCusto.txt");
load("precoMadeira.txt");
load("prognose.txt");

%constantes
hp = 16;
idadesCorte = [5, 6, 7];
taxaDesconto = 0.08;


matrizCombinacao = combinarIdadesCortes(idadesCorte);
[qPrescricao, ~] = size(matrizCombinacao);
qTalhoes = talhoes(end,1);
% ##geração da base de dados
% ##passo 1 = calcular a produção no hp
% ##passo 2 = calcular as receitas com base na producao
% ##passo 3 = calcular o custo de colheita
% ##passo 4 = calcular o custo de manutenção
% ##passo 5 = calcular o lucro
% ##passo 6 = calcular o VPL com base no lucro
% ##informações necessárias ao final
% ##.producao
% ##.VPL
linhaBD = 1;
BD = [];

for i = 1: qTalhoes
    idadeInicial = talhoes(i, 2);
    area = talhoes (i, 3);
    prognoseTalhao = prognose(i, 2:end);
    for j = 1: qPrescricao
        idade = idadeInicial;
        combinacao = matrizCombinacao(j, :);
        producaoTalhao = zeros(1, hp);
        receitaTalhao = zeros(1, hp+1);

        custoColheitaTalhao = zeros(1, hp+1);
        custoManutencaoTalhao = zeros(1, hp+1);

        corte = 1;
        for k = 1: hp
            idadeCorte = verificarIdadeCorte (combinacao(1, corte), idadeInicial, idadesCorte, corte, prognoseTalhao, area);
            producao = calcularProducao(idadeCorte, idade, prognoseTalhao, area);
            custoManutencaoTalhao (1, k) = calcularManutencao(area, idadeCusto (idade+1, 2));
            if producao ~= 0
                producaoTalhao(1,k) = producao;
                receitaTalhao(1, k) = calcularReceita(producao, precoMadeira(idade + 1, 2));
                custoColheitaTalhao(1, k)= calcularCustoColheita(producao);

                idade = 0;
                corte=corte +1;
            end

            idade= idade+1;
        end
        [receita, custoColheita, custoManutencao]  = calcularInventario (idade, prognoseTalhao, precoMadeira(idade + 1, 2), area, idadeCusto(idade+1, 2));

        custoColheitaTalhao(1, hp+1)= calcularCustoColheita(producao);
        receitaTalhao(1, hp+1) = receita;
        custoColheitaTalhao(1, hp+1) = custoColheita;
        custoManutencaoTalhao (1, hp+1) = custoManutencao;
        lucro = receitaTalhao - (custoColheitaTalhao + custoManutencaoTalhao);
        VPL = calcularVPL (lucro, taxaDesconto);
        BD(linhaBD, 1: hp) = producaoTalhao;
        BD (linhaBD, hp+1) = VPL;
        linhaBD=linhaBD + 1;
    end
    disp("Talhao: "), disp(i);
end

writematrix(BD, 'BD.txt');
