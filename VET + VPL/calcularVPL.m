function VPL = calcularVPL(lucro, taxa, anosHP) 
   [~, c] = size(anosHP);
    for i = 1:c
        VPL(1,i)=lucro(1,i)/((1+taxa)^anosHP(1,i));
    end
end




