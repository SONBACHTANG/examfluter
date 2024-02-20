package com.service;

import java.util.List;

import com.dto.PlaceDTO;


public interface IPlaceService {

	List<PlaceDTO> findAll();
	PlaceDTO save( PlaceDTO customDTO);
	PlaceDTO update();
}
