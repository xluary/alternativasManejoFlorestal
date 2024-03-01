function posicao = pegarPosicao (vetor,  valor)
[~,c] = size(vetor);
posicao =  [];
    for i = 1 : c
      
        if vetor(i) == valor
          posicao(1, end+1) = i;
        end 

    end
end

