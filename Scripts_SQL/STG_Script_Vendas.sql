/* 
 * Creation of the STAGING AREA for use in the demo ETL solution (with SSIS),
 * so as to demonstrate error-debugging techniques in ETL tasks.
 */
USE [STG_VENDAS_FEV];
GO

/* Remove the database, if it already exists, so it's safe to create it! */
DROP DATABASE IF EXISTS [STG_VENDAS_FEV];
GO

CREATE DATABASE [STG_VENDAS_FEV];
GO

USE [STG_VENDAS_FEV];
GO

/* the STAGING AREA Dimension table for: CLIENTE */
CREATE TABLE stg_dim_cliente
(
	bk_cliente				NVARCHAR(20)	PRIMARY KEY,
	nome_cliente			NVARCHAR(100)	NOT NULL,
	seguimento				NVARCHAR(25)	NOT NULL,
	pais					NVARCHAR(30)	NOT NULL,
	estado					NVARCHAR(30)	NOT NULL,
	cidade					NVARCHAR(100)	NOT NULL,
	mercado					NVARCHAR(100)	NOT NULL,
	regiao					NVARCHAR(100)	NOT NULL
);

/* the STAGING AREA Dimension table for: Pedido */
CREATE TABLE stg_dim_pedido
(
	bk_pedido				NVARCHAR(25)	PRIMARY KEY,
	modo_de_envio			NVARCHAR(20)	NOT NULL,
	prioridade				NVARCHAR(25)	NOT NULL,
	
	);


/* the STAGING AREA Dimension table for: PRODUCTO */
CREATE TABLE stg_dim_producto 
(
	bk_producto				NVARCHAR(25)	PRIMARY KEY,
	poducto_descricao		NVARCHAR(255)	NOT NULL,
	categoria				NVARCHAR(50)	NOT NULL,
	subucategoria			NVARCHAR(30)	NOT NULL,
	
);

/* the STAGING AREA Dimension table for: DATE (Sales Date) */
CREATE TABLE stg_dim_date 
(
	sk_intelligent_key		INT				NOT NULL,
	bk_date_key				DATE			PRIMARY KEY,
	day_number				INT				NOT NULL,
	month_number			INT				NOT NULL,
	month_name				NVARCHAR(30)	NOT NULL,
	year_number				INT				NOT NULL
);

/* the STAGING AREA Fact table for: VENDA */
CREATE TABLE stg_fact_venda
(
	fk_cliente				NVARCHAR(20)	NOT NULL,
	fk_pedido				NVARCHAR(25)	NOT NULL,
	fk_producto				NVARCHAR(25)	NOT NULL,
	fk_date					DATE			NOT NULL,
	quantidade				INT				NOT NULL,
	custo_envio				DECIMAL(18,4)	NOT NULL,
	valor_venda				DECIMAL(18,4)	NOT NULL
	CONSTRAINT pk_stg_fact_sales			PRIMARY KEY
	(
		fk_cliente		ASC,
		fk_pedido		ASC,
		fk_producto		ASC,
		fk_date			ASC
	)
);
