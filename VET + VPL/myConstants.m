function C = myConstants()
 C.HP = 16;
 C.taxaJuros = 0.07;
 C.idadeMinimaCorte = 5;
 C.idadeMaxCorte = 7;
 C.precoMadeira=load("precoMadeira.txt");    
 C.custoManutencao = load("idadeCusto.txt");
 C.custoExploracao = 30;
 C.custoImplantacao = 4059.05;
 C.qRotacao = 2;
end