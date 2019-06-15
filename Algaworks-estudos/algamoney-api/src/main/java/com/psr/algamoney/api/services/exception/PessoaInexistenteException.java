package com.psr.algamoney.api.services.exception;

public class PessoaInexistenteException extends RuntimeException implements PessoaException {

	private static final long serialVersionUID = 1L;

	@Override
	public String getMensagem() {
		return "mensagem.pessoa.inexistente";
	}
}
