package com.component;

import org.springframework.stereotype.Component;

import com.dto.PlaceDTO;
import com.entity.PlaceEntity;

@Component
public class PlaceConvert {
	
	
	public PlaceDTO toDTO(PlaceEntity place) {
		PlaceDTO dto=new PlaceDTO();
		
		dto.setId(place.getId());
		dto.setName(place.getName());
		dto.setImage(place.getImage());
		dto.setVote(place.getVote());
	
		
		return dto;
	}
	
	public PlaceEntity toEntity(PlaceDTO place) {
		PlaceEntity entity=new PlaceEntity();
		
		entity.setId(place.getId());
		entity.setName(place.getName());
		entity.setImage(place.getImage());
		entity.setVote(place.getVote());
		
		return entity;
	}
	

}
