package com.dine.root.rest.dao;

import java.util.ArrayList;

import com.dine.root.rest.dto.menuDTO;
import com.dine.root.rest.dto.restDTO;

public interface restDAO {
	public restDTO infoRest(int id);
	public ArrayList<menuDTO> infoMenu(int id);
}
