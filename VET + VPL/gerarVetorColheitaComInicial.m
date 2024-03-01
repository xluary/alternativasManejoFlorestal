function [vetor, idadeCorte, mapeamentoIdade] = gerarVetorColheitaComInicial(anosHP,idadesRotacao, idade, rotacao, rotacaoOtima, idadeCorteInicial)
    [~, c] = size(idadesRotacao);
    [~, anosHPc] = size(anosHP);
    tempoTotalRotacao = sum(idadesRotacao);
    i = 1;
    mapeamentoIdade = [];
    idadeCorte = [];
    while i < anosHPc
        mapeamentoIdade(1, end+1) = idade;
        
        if idade >= idadeCorteInicial
           vetor(1,i) = c+1;
           idadeCorte(1, end+1) = idade;
           idade = 0;
           break;
        end
        idade = idade + 1;
        i = i +1;
    end

    
    while i < anosHPc % 2 a 12
         
       if idade >= idadesRotacao(1, rotacao)
           idadeCorte(1, end+1) = idade;
           vetor(1,i) = rotacao;
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
       i = i + 1 ;
       idade = idade + 1;
       mapeamentoIdade(1, end+1) = idade;
    end
end