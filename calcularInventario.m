function [receita, custoColheita, custoManutencaoTalhao] = calcularInventario (idade, prognoseTalhao, precoMadeira, area, idadeCusto)
  idadeCorte = idade;
  producao = calcularProducao(idadeCorte, idade, prognoseTalhao, area);
  custoColheita= calcularCustoColheita(producao);
  receita = calcularReceita(producao, (precoMadeira));
  custoManutencaoTalhao = calcularManutencao(area, idadeCusto);
end
