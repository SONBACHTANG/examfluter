package com.dto;

public class PlaceDTO {
	 
    private Long id;
   
    private String name;
    private double vote;
    private String image;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getVote() {
		return vote;
	}
	public void setVote(double vote) {
		this.vote = vote;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
   
		
}
