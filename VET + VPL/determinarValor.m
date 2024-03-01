function valores = determinarValor (valor, vetor)
    valores =[];
    [~, c] = size(vetor);
    [~, q] = size(valor);
    for i = 1: c
        for j = 1 : q
            if vetor(1,i) == j
                valores(1, end+1) = valor(1, j);
            end   
        end
    end
end