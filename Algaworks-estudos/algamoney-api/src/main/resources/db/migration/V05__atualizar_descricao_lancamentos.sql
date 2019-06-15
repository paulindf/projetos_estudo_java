with tipos_lancamento as (
	select 'Água' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Compras' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Restaurante' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Faculdade' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Plano de Saúde' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Telefone' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Plano Móvel' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Jantar' as descricao, 'Despesa' as tipo_lancamento
	union
	select 'Rendimento' as descricao, 'Receita' as tipo_lancamento
	union
	select 'Proventos' as descricao, 'Receita' as tipo_lancamento
	union
	select 'Depósito identificado' as descricao, 'Receita' as tipo_lancamento
	union
	select 'Recebimento de dívida' as descricao, 'Receita' as tipo_lancamento
	union
	select 'Prolabore' as descricao, 'Receita' as tipo_lancamento
)

update
	lancamento
set
	lancamento.descricao = (select a.descricao from tipos_lancamento a where lower(a.tipo_lancamento) = lower(lancamento.tipo_lancamento) order by rand() limit 1)
;