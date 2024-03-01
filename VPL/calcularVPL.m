function VPL = calcularVPL (lucro, taxaDesconto)
  [~, hp] = size(lucro);
  anoCorrente = 0;
  VPL = 0;
  for i = 1 : hp
    VPLano = (lucro(1, i))/(1+taxaDesconto)^anoCorrente;
    VPL = VPL + VPLano;
    anoCorrente=anoCorrente+1;
  end
end
