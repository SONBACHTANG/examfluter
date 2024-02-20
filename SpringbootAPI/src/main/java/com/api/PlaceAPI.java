package com.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dto.PlaceDTO;
import com.service.IPlaceService;

@CrossOrigin
@RestController
public class PlaceAPI {
	
	@Autowired 
	private IPlaceService Service;
	
	
	 
	  
	  @GetMapping("/getAllPlace")
	    public List<PlaceDTO> getAllPlace() {
	        return Service.findAll();
	    }

}
