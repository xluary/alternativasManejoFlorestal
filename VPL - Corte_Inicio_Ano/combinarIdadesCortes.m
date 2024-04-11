function matrizCombinacao = combinarIdadesCortes(idadesCorte)
    controle = 0;
    for i = idadesCorte(1):idadesCorte(end)
       for j = idadesCorte(1):idadesCorte(end)
           for l = idadesCorte(1):idadesCorte(end)
               for u = idadesCorte(1):idadesCorte(end)
                 controle=controle +1;
                 combinacao = [i,j,l,u];
                 matrizCombinacao(controle,:) = combinacao;
               end
           end
       end
    end
end
