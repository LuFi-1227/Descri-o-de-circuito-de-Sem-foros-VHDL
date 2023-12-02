# Descri-o-de-circuito-de-Sem-foros-VHDL
Projeto apresentado na disciplina de Sistemas Digitais no 2° semestre do ano de 2023.

# Como usar o projeto?
## Rode no terminal os seguintes comandos linha a linha:
```
ghdl -s ArquiteturaSemSis.vhd
ghdl -s ArquiteturaSemSis_tb.vhd
ghdl -a ArquiteturaSemSis.vhd
ghdl -a ArquiteturaSemSis_TB.vhd
ghdl -e systema
ghdl -r systema --vcd=ArquiteturaSemSis_TB.vcd
gtkwave ArquiteturaSemSis_TB.vcd
```

## Tags do GHDL:
-s -> Testa o arquivo em busca de erros de sintaxe;
-a -> Compila o arquivo e o coloca em um arquivo .cd;
-e -> Procura no arquivo .cd a entidade e o funcionamento da mesma em busca de rodar o código;
-r -> Cria um arquivo .vcd que contém o funcionamento do projeto como descrito;

## Observações:
- O comando gtkwave exibe o que está no arquivo .vcd;
- Se o código entrar em uma especie de loop, digite ctrl + c e rode a próxima linha de código.
