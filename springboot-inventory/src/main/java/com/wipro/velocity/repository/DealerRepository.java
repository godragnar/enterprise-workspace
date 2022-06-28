package com.wipro.velocity.repository;

import java.sql.Date;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wipro.velocity.model.Address;
import com.wipro.velocity.model.Dealer;

public interface DealerRepository extends JpaRepository<Dealer, Long> {

	public Dealer findByEmail(String email);
	
}
