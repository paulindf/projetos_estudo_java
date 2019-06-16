package com.psr.algamoney.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.psr.algamoney.api.model.Usuario;
import com.psr.algamoney.api.repository.UsuarioRepository;

public class UsuarioService {
	
	@Autowired
	private UsuarioRepository repositorio;
	
	public List<Usuario> findAll(){
		return this.repositorio.findAll();
	}
}
