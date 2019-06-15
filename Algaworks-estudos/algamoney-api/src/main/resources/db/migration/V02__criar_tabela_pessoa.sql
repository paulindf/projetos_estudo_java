CREATE TABLE pessoa (
    codigo BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    endereco_logradouro VARCHAR(200) NOT NULL,
    endereco_numero VARCHAR(10) NOT NULL,
    endereco_complemento VARCHAR(50) NULL,
    endereco_bairro VARCHAR(80) NULL,
    endereco_cep VARCHAR(9) NOT NULL,
    endereco_cidade VARCHAR(80) NOT NULL,
    endereco_estado VARCHAR(2) NOT NULL,
    ativo BIT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into pessoa (
	nome
	, endereco_logradouro
	, endereco_numero
	, endereco_complemento
	, endereco_bairro
	, endereco_cep
	, endereco_cidade
	, endereco_estado
	, ativo
)
select
	'Paulo da Silva Rita' as nome
	, 'QN 01 Conjunto 12' as endereco_logradouro
	, (select valor from (select '1' as valor union select '27' as valor union select '029' as valor union select '408' as valor union select '164' as valor) a order by rand() limit 1) as endereco_numero
	, (select valor from (select 'Casa' as valor union select 'Apartamento' as valor union select 'Loja' as valor) a order by rand() limit 1) as endereco_complemento
	, (select valor from (select 'Riacho Fundo' as valor union select 'Guará' as valor union select 'Ceilândia' as valor) a order by rand() limit 1) as endereco_bairro
	, (select valor from (select '72201-524' as valor union select '74125-854' as valor union select '15484-951' as valor) a order by rand() limit 1) as endereco_cep
	, (select valor from (select 'Brasília' as valor union select 'Patos' as valor) a order by rand() limit 1) as endereco_cidade
	, (select valor from (select 'DF' as valor union select 'MG' as valor) a order by rand() limit 1) as endereco_estado
	, (select valor from (select true as valor union select false as valor) a order by rand() limit 1) as ativo
union
select
	'Sarah Rejane Khalil Rita' as nome
	, 'QN0 12 AE C BLOCO D' as endereco_logradouro
	, (select valor from (select '1' as valor union select '27' as valor union select '029' as valor union select '408' as valor union select '164' as valor) a order by rand() limit 1) as endereco_numero
	, (select valor from (select 'Casa' as valor union select 'Apartamento' as valor union select 'Loja' as valor) a order by rand() limit 1) as endereco_complemento
	, (select valor from (select 'Riacho Fundo' as valor union select 'Guará' as valor union select 'Ceilândia' as valor) a order by rand() limit 1) as endereco_bairro
	, (select valor from (select '72201-524' as valor union select '74125-854' as valor union select '15484-951' as valor) a order by rand() limit 1) as endereco_cep
	, (select valor from (select 'Brasília' as valor union select 'Patos' as valor) a order by rand() limit 1) as endereco_cidade
	, (select valor from (select 'DF' as valor union select 'MG' as valor) a order by rand() limit 1) as endereco_estado
	, (select valor from (select true as valor union select false as valor) a order by rand() limit 1) as ativo
union
select
	'Ana Esther Khalil Rita' as nome
	, 'CLS 08 Lotes 1/2 Bloco' as endereco_logradouro
	, (select valor from (select '1' as valor union select '27' as valor union select '029' as valor union select '408' as valor union select '164' as valor) a order by rand() limit 1) as endereco_numero
	, (select valor from (select 'Casa' as valor union select 'Apartamento' as valor union select 'Loja' as valor) a order by rand() limit 1) as endereco_complemento
	, (select valor from (select 'Riacho Fundo' as valor union select 'Guará' as valor union select 'Ceilândia' as valor) a order by rand() limit 1) as endereco_bairro
	, (select valor from (select '72201-524' as valor union select '74125-854' as valor union select '15484-951' as valor) a order by rand() limit 1) as endereco_cep
	, (select valor from (select 'Brasília' as valor union select 'Patos' as valor) a order by rand() limit 1) as endereco_cidade
	, (select valor from (select 'DF' as valor union select 'MG' as valor) a order by rand() limit 1) as endereco_estado
	, (select valor from (select true as valor union select false as valor) a order by rand() limit 1) as ativo
union
select
	'Maria Luíza Khalil Rita' as nome
	, 'CLS 08 Lotes 1/2 Bloco' as endereco_logradouro
	, (select valor from (select '1' as valor union select '27' as valor union select '029' as valor union select '408' as valor union select '164' as valor) a order by rand() limit 1) as endereco_numero
	, (select valor from (select 'Casa' as valor union select 'Apartamento' as valor union select 'Loja' as valor) a order by rand() limit 1) as endereco_complemento
	, (select valor from (select 'Riacho Fundo' as valor union select 'Guará' as valor union select 'Ceilândia' as valor) a order by rand() limit 1) as endereco_bairro
	, (select valor from (select '72201-524' as valor union select '74125-854' as valor union select '15484-951' as valor) a order by rand() limit 1) as endereco_cep
	, (select valor from (select 'Brasília' as valor union select 'Patos' as valor) a order by rand() limit 1) as endereco_cidade
	, (select valor from (select 'DF' as valor union select 'MG' as valor) a order by rand() limit 1) as endereco_estado
	, (select valor from (select true as valor union select false as valor) a order by rand() limit 1) as ativo
union
select
	'Carlos Antônio da Silva Rita' as nome
	, 'QN 01 Conjunto 12 Casa' as endereco_logradouro
	, (select valor from (select '1' as valor union select '27' as valor union select '029' as valor union select '408' as valor union select '164' as valor) a order by rand() limit 1) as endereco_numero
	, (select valor from (select 'Casa' as valor union select 'Apartamento' as valor union select 'Loja' as valor) a order by rand() limit 1) as endereco_complemento
	, (select valor from (select 'Riacho Fundo' as valor union select 'Guará' as valor union select 'Ceilândia' as valor) a order by rand() limit 1) as endereco_bairro
	, (select valor from (select '72201-524' as valor union select '74125-854' as valor union select '15484-951' as valor) a order by rand() limit 1) as endereco_cep
	, (select valor from (select 'Brasília' as valor union select 'Patos' as valor) a order by rand() limit 1) as endereco_cidade
	, (select valor from (select 'DF' as valor union select 'MG' as valor) a order by rand() limit 1) as endereco_estado
	, (select valor from (select true as valor union select false as valor) a order by rand() limit 1) as ativo