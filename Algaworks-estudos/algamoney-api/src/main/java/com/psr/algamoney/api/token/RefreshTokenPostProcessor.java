package com.psr.algamoney.api.token;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

@ControllerAdvice
public class RefreshTokenPostProcessor implements ResponseBodyAdvice<OAuth2AccessToken> {
	
	@Value("${nome.refresh.token}")
	private String nomeCookieRefreshToken;
	
	@Override
	public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
		return returnType.getMethod().getName().equals("postAccessToken");
	}

	@Override
	public OAuth2AccessToken beforeBodyWrite(OAuth2AccessToken body, MethodParameter returnType,
			MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType,
			ServerHttpRequest request, ServerHttpResponse response) {

		HttpServletRequest requisicao = ((ServletServerHttpRequest) request).getServletRequest();
		HttpServletResponse resposta = ((ServletServerHttpResponse) response).getServletResponse();

		String refreshToken = body.getRefreshToken().getValue();

		adicionaRefreshTokenCookie(refreshToken, requisicao, resposta);
		DefaultOAuth2AccessToken token = (DefaultOAuth2AccessToken)body;
		
		removerRefreshTokenBody(token);

		return body;
	}

	private void removerRefreshTokenBody(DefaultOAuth2AccessToken token) {
		token.setRefreshToken(null);
	}

	private void adicionaRefreshTokenCookie(String refreshToken, HttpServletRequest requisicao,
			HttpServletResponse resposta) {
		
		Cookie cookie = new Cookie(nomeCookieRefreshToken, refreshToken);
		cookie.setHttpOnly(true);
		cookie.setSecure(false); // TODO: Mudar para true quando for para produção
		cookie.setPath(requisicao.getContextPath() + "/oauth/token");
		cookie.setMaxAge(30 * 24);
		
		resposta.addCookie(cookie);
	}

}
