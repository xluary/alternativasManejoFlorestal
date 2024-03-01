clear all;
close all;
clc;

%Criação de struct data para a nova base de dados

baseDeDados = load("BD.txt");
linhas = 416; %numero de talhoes
colunas = 4; %numero de prescrições
controleBaseDeDados = 1;
for i = 1: linhas
    for j = 1: colunas
        field1 = "production";
        field2 = "VPL";
        value1 = baseDeDados(controleBaseDeDados, 1:16);
        value2 = baseDeDados(controleBaseDeDados, 17);
        data(i,j) = struct(field1, value1, field2, value2);
        controleBaseDeDados = controleBaseDeDados +1;
    end
    j
end
mat_file = matfile('data2.mat');
save('data2.mat', 'data');