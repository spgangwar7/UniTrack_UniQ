package com.digi.unitouch.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.digi.unitouch.model.Country;

public interface CountryRepo extends JpaRepository<Country, Integer>{

}
