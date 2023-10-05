package com.codingdojo.joaquin.repositorios;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.joaquin.modelos.Usuario;



public interface RepositorioUsuarios extends CrudRepository<Usuario, Long> {

	Usuario findByEmail(String email);
}
