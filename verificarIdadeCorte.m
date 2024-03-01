function idadeCorte = verificarIdadeCorte  (combinacao, idadeInicial, idadesCorte, corte, prognoseTalhao, area)
      idadeCorte = combinacao;

      maximo = max(idadesCorte);
      minimo = min(idadesCorte);

      if idadeInicial == 0
        producaoInicial = 0;
      else
        producaoInicial = prognoseTalhao(1,idadeInicial)*area;
      end


      if corte == 1 && idadeInicial >  maximo && producaoInicial > 3383  %se for maior do que 7 corte em 3 anos
             idadeCorte = idadeInicial + combinacao -  minimo;
      elseif corte == 1 && idadeInicial > combinacao %se for maior do que cinco, corta naquele ano
             idadeCorte = idadeInicial;
      end
end
