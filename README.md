# Analize_de_vendas

# Objectivo do Projecto

O objectivo deste projecto é desenvolver uma solução completa de Business Intelligence (BI), aplicando as principais etapas de uma solucação BI.
Desde a definição e entedimento do problema, processo de ETL e Visualização de dados.

# Ferramentas utilizadas

ETL: SQL Server Integration Service (SSIS)

Staging Area / Data Warehouse: SQL Server 2018

IDE: Visual Studio 2019

Visualização: Power BI Desktop

# Fases do Projecto

•	1 Entender o problema do negócio

•	2 Perguntas de negócio

•	3 Coleta de dados

•	4 Modelagem de Negocio

•	5 Extração, Transformação e Carga dos Dados para Staging Area

•	6 Armazenamento em Data warehouse usando SSIS

•	6 Carga dos Dados para o Power BI

•	7 Criação de Realatórios e/ou Dashbords

•	8 Análise dos dados no Power BI

•	9 Conclusão

# Entender o Problema de Negócio

A partir dos dados de venda de uma empresa de venda ratalhista nos é forncido um conjinto de dados desdes seus productos, pedidos, clientes, vendas
que foram gerados a partir do sue sistema OLTP, com necessidade de uma profunda análise e construção de uma sistema OLAP para facilitar o prcesso 
de tomada de decisão usando as ferramentas de BI.

# Perguntas do Negócio

Pergunta 1 – Qual o valor total vendido?

Pergunta 2 - Quantas vendas foram realizadas por categoria de produto? 

Pergunta 3 - Quantas vendas foram realizadas por país considerando a prioridade de entrega?

Pergunta 4 - Qual foi a média de venda categoria de produto? 

Pergunta 5 - Qual foi o total de valor venda considerando cada modo de envio dos pedidos? Use um gráfico de cascata. 

Pergunta 6 - Quais mercados tiveram o maior custo médio de envio dos produtos vendidos? Use um gráfico treemap. 

Pergunta 7 -  A empresa tem como objetivo (meta) manter uma média de 350 para o valor de venda todos os meses. 
Mostre um indicador (KPI – Key Performance Indicator) com o valor médio de venda. A empresa ficou abaixo ou acima da meta no mês de Abril/2014? 

Pergunta 8 -Considere que o lucro é equivalente a: valor venda - custo envio. Qual categoria de produto apresentou maior lucro médio. 

Pergunta 9 - Qual foi o comportamento da margem de lucro ao longo do tempo? Considere a margem de lucro como o lucro dividido pelo valor venda

pergunta 10 - Que interferência tiveram os mercados para a sustentabilidade da Empresa.?

# Modelagem do projecto

A modelagem consiste na ilustração gráfica do funcionamemnto de qualque sistema de informação, para facilitar o seu entendido e funcionamento
por parte de quem alheio ao sistema e ajuda na manuntenção do mesmo para futuras escalabidade.
A imagem abaixo ilustra o funcionamento desde projecto em particular.

![modelagem_analise_vendas](https://user-images.githubusercontent.com/80399273/218474813-e7056f0d-212e-4134-b177-145fe77b4b61.png)

# Modelagem do Data Warehouse

A modelagem do DW deste projecto seguiu o padrão conhecido como "modelo em estrela ou star schema" baseado em dimensões e factos, um modelo de fácil 
percepção e escalávelm como se pode observar na imagem abaixo:

![Modelagem_DW](https://user-images.githubusercontent.com/80399273/219516681-169a615e-687a-4e2a-98e2-e23b9917ebd5.jpg)

#  ETL dos Dados para Staging Area usanso SSIS

Staging Area, serve como uma área de preparação (intermediária) antes de armazenar em DW, tem ainda como finalidade proteger o DW que erros nos dados. 
De forma geral é na SA onde ocorre maior parte das transformações para posteriormente fazer carregamendo em DW

![full all stg are table](https://user-images.githubusercontent.com/80399273/219901896-98ac5da5-bc7f-4d04-91cb-e4d32f2de0fd.png)

##Load stg_dim_cliente

![Load_stg_dim_cliente](https://user-images.githubusercontent.com/80399273/219901950-36f6013d-7834-475f-ac56-460473e29fe1.png)

##Load stg_dim_producto

![load_stg_dim_producto](https://user-images.githubusercontent.com/80399273/219901993-5ff6e214-8382-4044-9921-63f180a0099f.png)

Load stg_dim_pedido

![load_stg_dim_pedido](https://user-images.githubusercontent.com/80399273/219902016-f29437a2-b5a6-4f5b-b333-2fe3f2bcded5.png)

Load stg_dim_date

![load_stg_dim_date](https://user-images.githubusercontent.com/80399273/219902048-e53fcdd4-112f-431d-b28b-ea68a26c90fd.png)

Load stg_dim_venda

![load_stg_dim_vendas](https://user-images.githubusercontent.com/80399273/219902091-5a784dd3-9b90-43c4-8c11-f4182a678431.png)





