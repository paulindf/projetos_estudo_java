package com.psr.algamoney.api.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.psr.algamoney.api.model.Lancamento;
import com.psr.algamoney.api.model.LancamentoFilter;

public interface LancamentoRepositoryQuery {

	public Page<Lancamento> filtrar(LancamentoFilter filtro, Pageable pageable);
	
}
