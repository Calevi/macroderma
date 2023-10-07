package com.codingdojo.joaquin.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


import com.codingdojo.joaquin.modelos.Producto;

public interface RepositorioProductos extends CrudRepository<Producto, Long>{
	
	List<Producto> findAll();
	
	
}
