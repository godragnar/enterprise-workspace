package com.wipro.velocity.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.wipro.velocity.model.Product;

public interface ProductRepository extends MongoRepository<Product, String> {

	
	//Custom Method to find products based on madien field
	List<Product> findByMadein(String madein);
	
	
}
