function producao = calcularProducao(idadeCorte, idade, prognose, area)
  if idadeCorte == idade
    prognoseIdade = prognose(1, idade);
    producao = prognoseIdade * area;
  else
    producao = 0;
  end
end
