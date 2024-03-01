# Geração de base de dados de manejo florestal

A base contida nesse arquivo foi gerada experimentalmente. 
As regras utilizadas para a geração dessas alternativas foram adaptadas do trabalho de Rodrigues e Moreira, 1898 (arquivo cap01.pdf)

As alterações realizada foram em relação aos valores de custos e receitas: 
<ou>
  <li>o trabalho de referência foram empregados valores fixos de manuteção, neste trabalho consideramos valores diferentes de acordo com a idade do talhão (que já incluem a reforma) </li>
  <li>o trabalho de referência foi empregado o valor 1 dólar por m³ ssc de custo de exploração, adotamos 30 reais </li>
   <li>o trabalho de referência foi empregado o valor 1,95 dólar por m³ ssc de de preço de venda da madeira, adotamos um valor variável</li>
</ou>

Obs: esses valores podem ser encontrados na Documentação_Base_de_dados.pdf, na pasta VPL, ou nos arquivos preçoMadeira e idadeCusto.

Para a execução do código é necessario preencher os arquivos:
<ul>
<li>talhoes - na coluna 1 deve conter a identificação dos talhões, na 2 a idade no início do horizonte de planejamento e na 3, a área e na coluna 4, a rotação atual do talhão (neste caso 1 ou 2) </li>
<li>produtividade - na coluna 1 deve conter a identificação dos talhões, na segunda a rotação, na terceira a idade de corte, e na quarta a estimativa de produção naquela idade </li>
</ul>

Por exemplo: 
| 1 | 1 | 5 | 196   |
|---|---|---|-------|
| 1 | 1 | 6 | 224   |
| 1 | 1 | 7 | 247   |
| 1 | 2 | 5 | 156,6 |

Para a geração do arquivo de produtividade foi empregada a fórmula apresentada na Documentação_Base_de_dados.pdf, com um desconto de 20% de produução para cada rotação além da primeira. 
Ou seja, se aos 5 anos um talhão produzia na primeira rotação 196 m³ de madeira, na segunda produzirá 156,8

Obs: O código para Octave.


