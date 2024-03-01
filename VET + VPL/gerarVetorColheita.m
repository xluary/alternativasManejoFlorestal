function [vetor, idadeCorte, mapeamentoIdade] = gerarVetorColheita(anosHP,idadesRotacao, idade, rotacao, rotacaoOtima)
    [~, c] = size(idadesRotacao);
    [~, anosHPc] = size(anosHP);
    tempoTotalRotacao = sum(idadesRotacao);
    i = 1;
    idadeCorte = [];
    mapeamentoIdade = idade;
    while i < anosHPc % 2 a 12       
       i = i + 1 ;
       idade = idade + 1;  
       mapeamentoIdade(1, end+1) = idade;    
       if idade >= idadesRotacao(1, rotacao)
           vetor(1,i) = rotacao;
           idadeCorte(1, end+1) = idade;
           idade = 0;
           if rotacao >= c
                rotacao = 1;
                tempoRestante = anosHPc - i;
                if tempoRestante < tempoTotalRotacao
                    if tempoRestante >= rotacaoOtima(1,1)
                        adicionar = sum(idadesRotacao) - tempoRestante;
                        anosHPc = anosHPc + adicionar;
                    end 
                    if tempoRestante < rotacaoOtima(1,1)
                        break;
                    end
                end    
           else
                rotacao = rotacao + 1;
           end 

       end
    end
  
end