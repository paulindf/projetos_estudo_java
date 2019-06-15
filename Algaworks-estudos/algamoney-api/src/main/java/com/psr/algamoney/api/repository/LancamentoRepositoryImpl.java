package com.psr.algamoney.api.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import com.psr.algamoney.api.model.Lancamento;
import com.psr.algamoney.api.model.LancamentoFilter;
import com.psr.algamoney.api.model.Lancamento_;

public class LancamentoRepositoryImpl implements LancamentoRepositoryQuery {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public Page<Lancamento> filtrar(LancamentoFilter filtro, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Lancamento> criteria = builder.createQuery(Lancamento.class);
		Root<Lancamento> root = criteria.from(Lancamento.class);
		
		Predicate[] predicates = criarRestricoes(filtro, builder, root);
		criteria.where(predicates);
		
		TypedQuery<Lancamento> query = manager.createQuery(criteria);
		
		adicionarRestricoesPaginacao(query, pageable);
		
		return new PageImpl<Lancamento>(query.getResultList(), pageable, total(filtro));
	}

	private Long total(LancamentoFilter filtro) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<Lancamento> root = criteria.from(Lancamento.class);
		
		Predicate[] predicates = criarRestricoes(filtro, builder, root);
		criteria.where(predicates);
		
		criteria.select(builder.count(root));
				
		return manager.createQuery(criteria).getSingleResult();
	}

	private void adicionarRestricoesPaginacao(TypedQuery<Lancamento> query, Pageable pageable) {
		int paginaAtual = pageable.getPageNumber();
		int size = pageable.getPageSize();
		int primeiroRegistro = paginaAtual * size;
		
		query.setFirstResult(primeiroRegistro);
	}

	private Predicate[] criarRestricoes(LancamentoFilter filtro, CriteriaBuilder builder, Root<Lancamento> root) {
		List<Predicate> predicados = new ArrayList<>();

		if (!StringUtils.isEmpty(filtro.getDescricao())) {
			String parametro = "%" + filtro.getDescricao().toLowerCase() + "%";

			predicados.add(builder.like(builder.lower(root.get(Lancamento_.descricao)), parametro));
		}

		if (filtro.getDataVencimentoDe() != null && filtro.getDataVencimentoAte() != null) {
			predicados.add(builder.between(root.get(Lancamento_.dataVencimento), filtro.getDataVencimentoDe(),
					filtro.getDataVencimentoAte()));
		} else {
			if (filtro.getDataVencimentoDe() != null) {

				predicados.add(builder.greaterThanOrEqualTo(root.get(Lancamento_.dataVencimento),
						filtro.getDataVencimentoDe()));
			}

			if (filtro.getDataVencimentoAte() != null) {
				predicados.add(
						builder.lessThanOrEqualTo(root.get(Lancamento_.dataVencimento), filtro.getDataVencimentoAte()));
			}
		}

		if (filtro.getTipoLancamento() != null) {
			//Predicate p = builder.conjunction();
			
			//p = builder.and(p, builder.equal(Lancamento_.tipoLancamento.getName()), filtro.getTipoLancamento().name());
			
		}

		return predicados.toArray(new Predicate[predicados.size()]);
	}
	
}
