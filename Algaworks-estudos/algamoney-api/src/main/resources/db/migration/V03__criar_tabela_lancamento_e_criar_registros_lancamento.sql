CREATE TABLE lancamento (
	codigo BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	codigo_categoria BIGINT(20) NOT NULL,
    codigo_pessoa BIGINT(20) NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	data_vencimento DATETIME NOT NULL,
	data_pagamento DATETIME NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	observacao VARCHAR(100) NULL,
	tipo_lancamento VARCHAR(45) NOT NULL,
	INDEX FK_LANCAMENTO_CATEGORIA_idx (codigo_categoria ASC) VISIBLE,
	CONSTRAINT FK_LANCAMENTO_CATEGORIA FOREIGN KEY (codigo_categoria) REFERENCES categoria (codigo),
    CONSTRAINT FK_LANCAMENTO_PESSOA FOREIGN KEY (codigo_pessoa) REFERENCES pessoa (codigo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into lancamento (
	codigo_categoria
	, codigo_pessoa
	, descricao
	, data_vencimento
	, data_pagamento
	, valor
	, observacao
	, tipo_lancamento
)select
	a.codigo_categoria
	,a.codigo_pessoa
	,concat(a.descricao, ' ', cast((row_number() over (partition by a.codigo_pessoa order by rand())) as char(3))) as descricao
	,a.data_vencimento
	,a.data_pagamento
	,a.valor
	,concat(a.observacao, ' ', cast((row_number() over (partition by a.codigo_pessoa order by rand())) as char(3))) as observacao
	,a.tipo
from
	(
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
		union
		select
			(select codigo from categoria order by rand() limit 1) as codigo_categoria
			, (select codigo from pessoa order by rand() limit 1) as codigo_pessoa
			, 'Descrição' as descricao
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_vencimento
			, concat(year(curdate()),'-',floor(1+rand()*12),'-',floor(1+rand()*28)) as data_pagamento
			, abs(cast((floor(1+rand()*1292.7) - floor(1+rand()*292.674))/1.7 as decimal(10,2))) as valor
			, 'Observação' as observacao
			, (select a.tipo from (select 'Receita' as tipo union select 'Despesa') a order by rand() limit 1) as tipo
	) a
order by
	rand()
;