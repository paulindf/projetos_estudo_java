package com.psr.algamoney.api.services;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.psr.algamoney.api.model.Pessoa;
import com.psr.algamoney.api.repository.PessoaRepository;

@Service
public class PessoaService {

	@Autowired
	PessoaRepository pessoaRepository;
	
	public Pessoa atualizar(Long codigo, Pessoa pessoa) {
		Pessoa pessoaAlterada = getPessoaPeloCodigo(codigo);
		
		BeanUtils.copyProperties(pessoa, pessoaAlterada, "codigo");
		
		return pessoaRepository.save(pessoaAlterada);
	}


	public void atualizarStatus(Long codigo, Boolean ativo) {
		Pessoa pessoa = getPessoaPeloCodigo(codigo);
		
		pessoa.setAtivo(ativo);
		
		pessoaRepository.save(pessoa);
	}
	
	private Pessoa getPessoaPeloCodigo(Long codigo) {
		Pessoa pessoa = pessoaRepository.findOne(codigo);
		
		if (pessoa == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return pessoa;
	}
}
