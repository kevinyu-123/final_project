package com.dine.root.food.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dine.root.food.dao.FoodDAO;
import com.dine.root.food.dto.FoodDTO;
import com.dine.root.food.dto.NationDTO;
import com.dine.root.food.dto.RecipeDTO;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	FoodDAO dao;
	@Autowired
	FileService bfs;
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath(); // 절대 경로
		System.out.println(path);
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "'; </script> "; // 즉 alert창 + 절대경로/url주소가 반납됨
		System.out.println(message);

		return message;
	}
	
	@Override
	public FoodDTO detail(String foodName) {
		FoodDTO dto = dao.detail(foodName);
		
		return dto;
	}

	@Override
	public String register2(MultipartHttpServletRequest mul, HttpServletRequest request) {
		FoodDTO dto = new FoodDTO();
		dto.setFoodName(mul.getParameter("foodName"));
		dto.setFoodComment(mul.getParameter("foodComment"));
		dto.setNation(mul.getParameter("nation"));
		dto.setIntro(mul.getParameter("intro"));
		dto.setCategory1(mul.getParameter("category1"));
		dto.setCategory2(mul.getParameter("category2"));
		
		MultipartFile file = mul.getFile("mainPic");
		dto.setMainPic(saveImg2(file));
		
		MultipartFile file2 = mul.getFile("subPic");
		dto.setSubPic(saveImg2(file2));	
		
		MultipartFile file3 = mul.getFile("mapPic");
		dto.setMapPic(saveImg2(file3));
		
		int result = 0;
		String msg, url;
		
		try {
			result =  dao.register(dto);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result == 1) {
			msg = "음식 정보가 성공적으로 저장되었습니다.";
			url = "/mypage";
		} else {
			msg = "글을 저장하는데 문제가 발생하였습니다.";
			url = "/foodRegForm";
		}
		
		return bfs.getMessage(request, msg, url);
	}

	private String saveImg2(MultipartFile file3) {
		
		String fileName = "";
		
		if (file3.getSize() != 0) {		
			
			SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
			
			Calendar calendar = Calendar.getInstance();
			
			fileName = fo.format(calendar.getTime());
			fileName += file3.getOriginalFilename();

			File saveFile = new File(IMAGE_REPO  + "/" +  fileName);		
			
			try {
				file3.transferTo(saveFile);		
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {	
			fileName = "nan";
		}
		
		return fileName;
	}

	@Override
	public int recipeInsert(RecipeDTO dto) {
		
		int result = 0;
		
		try {
			result = dao.recipeInsert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public RecipeDTO recipe(String foodName) {
		return dao.recipe(foodName);
	}

	@Override
	public NationDTO nation(String nation) {
		
		return dao.nation(nation);
	}

	@Override
	public List<FoodDTO> getFoodsByNation(String nation) {
		
		return dao.selectFoodsByNaton(nation);
	}

	@Override
	public String getFilePath(MultipartHttpServletRequest mul) {
		MultipartFile file = mul.getFile("nationPicture2");
	
		return saveImg2(file);
	}

	@Override
	public String nationEdit(MultipartHttpServletRequest mul, HttpServletRequest request) {
		NationDTO dto = new NationDTO();
		dto.setNation(mul.getParameter("nation"));
		dto.setAddress(mul.getParameter("address"));
		dto.setInfomation(mul.getParameter("infomation"));
		
		MultipartFile file = mul.getFile("imageFileName");
		if (file.getSize() != 0) {
			// 이미지 변경시
			dto.setNationPicture(bfs.saveFile(file)); // 수정하기에서 이미지를 바꾸면 바꾸는 이미지를 저장하구
			bfs.deleteImage(mul.getParameter("originFileName")); // 원래 있던 이미지를 삭제해라
		} else {
			dto.setNationPicture(mul.getParameter("orginFIleName"));
		}

		String msg, url;
		int result = 0;

		try {
			result = dao.nationEdit(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result == 1) {
			msg = "성공적으로 수정되었습니다";
			url = "/nation?nation=" + dto.getNation();
		} else {
			msg = "수정 중 문제가 발생하였습니다";
			url = "/nationEditForm?nation=" + dto.getNation();
		}
		String message = bfs.getMessage(request, msg, url);
		return message;
	}

	@Override
	public String nationDelete(String nation, String nationPicture, HttpServletRequest request) {
		int result = 0;
		
		try {
			result = dao.nationDelete(nation);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg = null, url = null;
		if (result == 1) {
			bfs.deleteImage(nationPicture);
			msg = "성공적으로 삭제 되었습니다";
			url = "/main";
		} else {
			msg = "삭제 중 문제가 발생하였습니다";
			url = "/";
		}
		String message = bfs.getMessage(request, msg, url);

		return message;
	}

	@Override
	public String foodEdit(MultipartHttpServletRequest mul, HttpServletRequest request) {
		FoodDTO dto = new FoodDTO();
		dto.setFoodName(mul.getParameter("foodName"));
		dto.setFoodComment(mul.getParameter("foodComment"));
		dto.setNation(mul.getParameter("nation"));
		dto.setIntro(mul.getParameter("intro"));
		dto.setCategory1(mul.getParameter("category1"));
		dto.setCategory2(mul.getParameter("category2"));
		
		MultipartFile file = mul.getFile("imageFileName");
		if (file.getSize() != 0) {
			// 이미지 변경시
			dto.setMainPic(bfs.saveFile(file));
			bfs.deleteImage(mul.getParameter("originFileName")); // 원래 있던 이미지를 삭제해라
		} else {
			dto.setMainPic(mul.getParameter("orginFIleName"));
		}
		
		MultipartFile file2 = mul.getFile("imageFileName2");
		if (file2.getSize() != 0) {
			// 이미지 변경시
			dto.setSubPic(bfs.saveFile(file2));
			bfs.deleteImage(mul.getParameter("originFileName2")); // 원래 있던 이미지를 삭제해라
		} else {
			dto.setSubPic(mul.getParameter("orginFIleName2"));
		}
		
		MultipartFile file3 = mul.getFile("imageFileName3");
		if (file3.getSize() != 0) {
			// 이미지 변경시
			dto.setMapPic(bfs.saveFile(file3));
			bfs.deleteImage(mul.getParameter("originFileName3")); // 원래 있던 이미지를 삭제해라
		} else {
			dto.setMapPic(mul.getParameter("orginFIleName3"));
		}
		
		String msg, url;
		int result = 0;

		try {
			result = dao.foodEdit(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result == 1) {
			msg = "성공적으로 수정되었습니다";
			url = "/food2?foodName=" + dto.getFoodName() + "&nation=" + dto.getNation();
		} else {
			msg = "수정 중 문제가 발생하였습니다";
			url = "/foodEditForm?foodName=" + dto.getFoodName();
		}
		String message = bfs.getMessage(request, msg, url);
		return message;
		
	}

	@Override
	public String foodDelete(String foodName, String mainPic, String subPic, String mapPic,
			HttpServletRequest request) {
		int result = 0;
		
		try {
			result = dao.foodDelete(foodName);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg = null, url = null;
		if (result == 1) {
			bfs.deleteImage(foodName);
			msg = "성공적으로 삭제 되었습니다";
			url = "/main";
		} else {
			msg = "삭제 중 문제가 발생하였습니다";
			url = "/";
		}
		String message = bfs.getMessage(request, msg, url);

		return message;
	}

	@Override
	public String recipeEdit(MultipartHttpServletRequest mul, HttpServletRequest request) {
		RecipeDTO dto = new RecipeDTO();
		dto.setFoodName(mul.getParameter("foodName"));
		dto.setCookTime(mul.getParameter("cookTime"));
		dto.setIngredients(mul.getParameter("ingredients"));
		dto.setRecipe(mul.getParameter("recipe"));
		dto.setYoutubeAddr("youtubeAddr");

		String msg, url;
		int result = 0;

		try {
			result = dao.recipeEdit(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result == 1) {
			msg = "성공적으로 수정되었습니다";
			url = "/main";
		} else {
			msg = "수정 중 문제가 발생하였습니다";
			url = "/nationRegForm";
		}
		String message = bfs.getMessage(request, msg, url);
		return message;
	}

	@Override
	public String nationInsert(MultipartHttpServletRequest mul, HttpServletRequest request) {
		NationDTO dto = new NationDTO();
		dto.setNation(mul.getParameter("nation"));
		dto.setAddress(mul.getParameter("address"));
		dto.setInfomation(mul.getParameter("infomation"));
		
		MultipartFile file = mul.getFile("nationPicture2");
		dto.setNationPicture(saveImg2(file));
		
		int result = 0;
		String msg, url;
		
		try {
			result =  dao.nationInsert(dto);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result == 1) {
			msg = "나라 정보가 성공적으로 저장되었습니다.";
			url = "/mypage";
		} else {
			msg = "글을 저장하는데 문제가 발생하였습니다.";
			url = "/nationRegForm";
		}
		return bfs.getMessage(request, msg, url);
	}
	
}
