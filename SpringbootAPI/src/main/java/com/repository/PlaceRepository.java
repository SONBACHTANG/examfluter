package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.PlaceEntity;
@Repository
public interface PlaceRepository extends JpaRepository<PlaceEntity, Long> {
	 

}
