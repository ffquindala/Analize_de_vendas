/* 
 * Creation of the Data Warehouse for use in the demo ETL solution (with SSIS),
 * so as to demonstrate error-debugging techniques in ETL tasks.
 */


/* Remove the database, if it already exists, so it's safe to create it! */
DROP DATABASE IF EXISTS [DW_VENDAS_FEV];
GO

CREATE DATABASE [DW_VENDAS_FEV];
GO

USE [DW_VENDAS_FEV];
GO

/* the DW AREA Dimension table for: CLIENTE */

CREATE TABLE dim_cliente
(
	sk_cliente		INT IDENTITY (1, 1) PRIMARY KEY,
	bk_cliente		NVARCHAR(20)	NOT NULL,
	nome_cliente	NVARCHAR(100)	NOT NULL,
	seguimento		NVARCHAR(25)	NOT NULL,
	pais			NVARCHAR(30)	NOT NULL,
	estado			NVARCHAR(30)	NOT NULL,
	cidade			NVARCHAR(100)	NOT NULL,
	mercado			NVARCHAR(100)	NOT NULL,
	regiao			NVARCHAR(100)	NOT NULL
);

/* the DW AREA Dimension table for: Pedido */
CREATE TABLE dim_pedido
(
	sk_pedido     INT IDENTITY (1,1) PRIMARY KEY,
	bk_pedido	  NVARCHAR(25) NOT NULL,
	modo_de_envio NVARCHAR(20) NOT NULL,
	prioridade	  NVARCHAR(25) NOT NULL,
	
	);
/* the DW AREA Dimension table for: PRODUCTO */
CREATE TABLE dim_producto 
(
	sk_producto INT IDENTITY (1,1) PRIMARY KEY,
	bk_producto		   NVARCHAR(25)  NOT NULL,
	poducto_descricao  NVARCHAR(255) NOT NULL,
	categoria		   NVARCHAR(50)	 NOT NULL,
	subucategoria	   NVARCHAR(30)	 NOT NULL,
	
);

/* the DW AREA Dimension table for: DATE (Sales Date) */
CREATE TABLE dim_date 
(	sk_date INT IDENTITY (1,1 ) PRIMARY KEY,
	sk_intelligent_key		INT				NOT NULL,
	bk_date_key				DATE			NOT NULL,
	day_number				INT				NOT NULL,
	month_number			INT				NOT NULL,
	month_name				NVARCHAR(30)	NOT NULL,
	year_number				INT				NOT NULL
);

/* the DW AREA Fact table for: VENDA */
CREATE TABLE fact_venda
(
	fk_cliente	INT FOREIGN KEY REFERENCES dim_cliente (sk_cliente)   NOT NULL,
	fk_pedido	INT FOREIGN KEY REFERENCES dim_pedido (sk_pedido)     NOT NULL,
	fk_producto	INT FOREIGN KEY REFERENCES dim_producto (sk_producto) NOT NULL,
	fk_date		INT FOREIGN KEY REFERENCES dim_date (sk_date) NOT NULL,
	quantidade	INT				NOT NULL,
	custo_envio	DECIMAL(18,4)	NOT NULL,
	valor_venda	DECIMAL(18,4)	NOT NULL

	CONSTRAINT pk_dim_fact_sales PRIMARY KEY
	(
		fk_cliente		ASC,
		fk_pedido		ASC,
		fk_producto		ASC,
		fk_date			ASC
	)
);
