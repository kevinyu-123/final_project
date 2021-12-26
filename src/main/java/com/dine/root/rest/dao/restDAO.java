package com.dine.root.rest.dao;

import java.util.ArrayList;

import com.dine.root.rest.dto.menuDTO;
import com.dine.root.rest.dto.restDTO;
import com.dine.root.reviews.dto.reviewsDTO;

public interface restDAO {
	public restDTO infoRest(int id);
	public ArrayList<menuDTO> infoMenu(int id);
	public ArrayList<reviewsDTO> infoReviews(int id);
}
