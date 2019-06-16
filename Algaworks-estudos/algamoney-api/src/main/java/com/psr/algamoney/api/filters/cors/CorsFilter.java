package com.psr.algamoney.api.filters.cors;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class CorsFilter implements Filter {

	private String origemPermitida = "http://localhost:8070"; // TODO: Configurar quando aplicação for para 
			
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		HttpServletRequest requisicao = (HttpServletRequest) request;
		HttpServletResponse resposta = (HttpServletResponse) response;
		
		resposta.setHeader("Access-Control-Allow-Origin", origemPermitida);
		resposta.setHeader("Access-Control-Allow-Credentials", "true");

		if (requisicao.getMethod().equals("OPTIONS") && 
				requisicao.getHeader("Origin").equals(origemPermitida)) {
			resposta.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE, PUT, OPTIONS");
			resposta.setHeader("Access-Control-Allow-Headers", "Authorization, Content-Type, Accept");
			resposta.setHeader("Access-Control-Max-Age", "3600");
			
			resposta.setStatus(HttpServletResponse.SC_OK);
		} else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
