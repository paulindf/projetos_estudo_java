package com.psr.algamoney.api.token;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.catalina.util.ParameterMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@PropertySource("classpath:token-cookies.properties")
@Component
@Order(Ordered.HIGHEST_PRECEDENCE) //Prioridade alta
public class RefreshTokenCookiePreProcessor implements Filter {
	
	@Value("${nome.refresh.token}")
	private String nomeCookieRefreshToken;
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest requisicao = (HttpServletRequest)request;

		if (requisicao.getRequestURI().equals("/oauth/token")
				&& requisicao.getParameter("grant_type").equals("refresh_token")
				&& requisicao.getCookies() != null) {
			for (Cookie cookie : requisicao.getCookies()) {
				//Procurando pelo Cookie que tem o valor do refresh_token
				if (cookie.getName().equals(this.nomeCookieRefreshToken)) {
					
					//a idéia aqui é substituir uma requisição por outra
					//já que a requisição original não é possível de alterar
					requisicao = new MeuServletRequestWrapper(requisicao, cookie.getValue());
				}
			}
		}
		
		chain.doFilter(requisicao, response);
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException { }

	@Override
	public void destroy() { }
	
	static class MeuServletRequestWrapper extends HttpServletRequestWrapper{
			
		private final String refreshToken;
		
		public MeuServletRequestWrapper(HttpServletRequest request, String refreshToken) {
			super(request);
			
			this.refreshToken = refreshToken;
		}
		
		@Override
		public Map<String, String[]> getParameterMap() {
			ParameterMap<String, String[]> map = new ParameterMap<>(getRequest().getParameterMap());
			
			map.put("refresh_token", new String[] { this.refreshToken});
			
			map.setLocked(true);
			
			return map;
		}
	}

	public String getNomeCookieRefreshToken() {
		return nomeCookieRefreshToken;
	}
	
}
