package com.psr.algamoney.api.resource;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;

import com.psr.algamoney.api.event.RecursoCriadoEvent;
import com.psr.algamoney.api.exceptionhandler.AlgaMoneyExceptionHandler.Erro;
import com.psr.algamoney.api.model.Lancamento;
import com.psr.algamoney.api.model.LancamentoFilter;
import com.psr.algamoney.api.services.LancamentoService;
import com.psr.algamoney.api.services.exception.PessoaException;
import com.psr.algamoney.api.services.exception.PessoaInativaException;
import com.psr.algamoney.api.services.exception.PessoaInexistenteException;

@RestController
@RequestMapping("/lancamentos")
public class LancamentoResource {

	@Autowired
	private LancamentoService lancamentoService;

	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private MessageSource messageSource;

	/*
	@GetMapping
	public List<Lancamento> listar() {
		return lancamentoService.listar();
	}
	*/

	@GetMapping
	public Page<Lancamento> pesquisar(LancamentoFilter filtro, Pageable pageable){
		return lancamentoService.filtrar(filtro, pageable);
	}
	
	@GetMapping("/{codigo}")
	public Lancamento buscar(@PathVariable Long codigo) {
		return lancamentoService.buscarById(codigo);
	}

	@PostMapping
	public ResponseEntity<Lancamento> adicionar(@Valid @RequestBody Lancamento lancamento,
			HttpServletResponse response) {

		Lancamento novoLancamento = lancamentoService.adicionar(lancamento);

		publisher.publishEvent(new RecursoCriadoEvent(this, response, novoLancamento.getCodigo()));

		return ResponseEntity.status(HttpStatus.CREATED).body(novoLancamento);
	}
	
	@DeleteMapping("/{codigo}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long codigo) {
		lancamentoService.remover(codigo);
	}
	

	@ExceptionHandler({PessoaInexistenteException.class, PessoaInativaException.class})
	public ResponseEntity<Object> handlePessoaInexistenteOuInativaException(PessoaException ex, WebRequest request){
		String mensagemUsuario = messageSource.getMessage(ex.getMensagem(), null, LocaleContextHolder.getLocale());
		String mensagemDesenvolvedor = ex.toString();
		
		List<Erro> erros = Arrays.asList(new Erro(mensagemUsuario, mensagemDesenvolvedor));
		
		return ResponseEntity.badRequest().body(erros);
	}
	

}
