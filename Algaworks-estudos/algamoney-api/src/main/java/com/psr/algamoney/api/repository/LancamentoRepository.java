package com.psr.algamoney.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psr.algamoney.api.model.Lancamento;

public interface LancamentoRepository extends JpaRepository<Lancamento, Long>, LancamentoRepositoryQuery {

}
