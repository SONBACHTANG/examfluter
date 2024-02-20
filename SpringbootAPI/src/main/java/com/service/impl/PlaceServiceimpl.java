package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.component.PlaceConvert;
import com.dto.PlaceDTO;
import com.entity.PlaceEntity;
import com.repository.PlaceRepository;
import com.service.IPlaceService;
@Service

public class PlaceServiceimpl implements IPlaceService {

	
	
	@Autowired
	private PlaceRepository Repository;
	
	@Autowired
	private PlaceConvert Convert;
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<PlaceDTO> findAll() {
		List<PlaceDTO> dtos=new ArrayList<PlaceDTO>();
		List<PlaceEntity> entities= Repository.findAll();
		for(PlaceEntity item:entities) {
			PlaceDTO	dto=Convert.toDTO(item);
			dtos.add(dto);
		}
		return dtos;
	}

	@Override
	@Transactional
	public PlaceDTO save(PlaceDTO customDTO) {
		PlaceEntity entity =Convert.toEntity(customDTO);
		Repository.save(entity);
		
		return null;
	}

	@Override
	public PlaceDTO update() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	

}
