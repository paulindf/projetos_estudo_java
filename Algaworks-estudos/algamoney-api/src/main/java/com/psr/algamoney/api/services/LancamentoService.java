package com.psr.algamoney.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.psr.algamoney.api.model.Lancamento;
import com.psr.algamoney.api.model.LancamentoFilter;
import com.psr.algamoney.api.model.Pessoa;
import com.psr.algamoney.api.repository.LancamentoRepository;
import com.psr.algamoney.api.repository.PessoaRepository;
import com.psr.algamoney.api.services.exception.PessoaInativaException;
import com.psr.algamoney.api.services.exception.PessoaInexistenteException;

@Service
public class LancamentoService {

	@Autowired
	private LancamentoRepository lancamentoRepository;
	
	@Autowired
	private PessoaRepository pessoaRepository;
	
	public List<Lancamento> listar(){
		return lancamentoRepository.findAll();
	}
	
	public Lancamento adicionar(Lancamento lancamento) {
		Pessoa pessoa = pessoaRepository.findOne(lancamento.getPessoa().getCodigo());
		
		if (pessoa == null) {
			throw new PessoaInexistenteException();
		}else if (!pessoa.isAtivo()) {
			throw new PessoaInativaException();
		}
		
		return lancamentoRepository.save(lancamento);
	}

	public Lancamento buscarById(Long codigo) {
		return lancamentoRepository.findOne(codigo);
	}

	public Page<Lancamento> filtrar(LancamentoFilter filtro, Pageable pageable) {
		return lancamentoRepository.filtrar(filtro, pageable);
	}

	public void remover(Long codigo) {
		lancamentoRepository.delete(codigo);
	}
	
	
}
