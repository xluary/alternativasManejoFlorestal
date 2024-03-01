function preco = buscarNoTXT(idade, precoMadeira)
    [ ~ , q] = size(idade);
    preco = [];
    for i = 1: q
        preco(1, end+1) = precoMadeira(idade(1, i),2); 
    end
end