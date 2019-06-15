package com.psr.algamoney.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psr.algamoney.api.model.Categoria;

public interface CategoriaRepository extends JpaRepository<Categoria, Long> {

}
