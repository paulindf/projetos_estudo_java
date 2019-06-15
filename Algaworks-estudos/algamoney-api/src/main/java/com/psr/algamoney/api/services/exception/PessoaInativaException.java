package com.psr.algamoney.api.services.exception;

public class PessoaInativaException extends RuntimeException implements PessoaException {

	private static final long serialVersionUID = 1L;

	@Override
	public String getMensagem() {
		return "mensagem.pessoa.inativa";
	}

}
