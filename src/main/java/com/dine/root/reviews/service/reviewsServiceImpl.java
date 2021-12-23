package com.dine.root.reviews.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.dine.root.rest.dto.restDTO;
import com.dine.root.reviews.dao.reviewsDAO;
import com.dine.root.reviews.dto.reviewsDTO;


@Service
public class reviewsServiceImpl implements reviewsService{
	@Qualifier("reviewsDAO")
	@Autowired reviewsDAO dao;
	@Override
	public int reviewsUploadProcess(List<MultipartFile> multipartFile,HttpServletRequest request) {	
		// TODO Auto-generated method stub
		reviewsDTO dto = new reviewsDTO();
		
		dto.setMemId(request.getParameter("memId"));
		dto.setRate(Integer.parseInt(request.getParameter("rate")));
		dto.setReview(request.getParameter("content"));
		SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		Date date = new Date();
        long timeInMilliSeconds = date.getTime();
        java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
		dto.setRevDate(date1);
		String setDTOFileName = "";

		if(multipartFile.size() != 0) {
			for(MultipartFile file : multipartFile) {
				String sysFileName = fo.format(calendar.getTime());
				sysFileName += file.getOriginalFilename();
				System.out.println("사진 " + sysFileName);
				
				if(request.getParameter("restId")!=null) {
					dto.setRestId(Integer.parseInt(request.getParameter("restId")));
					File saveFile = new File(restReviewsImg + "/"+dto.getRestId()+"/"+dto.getMemId()+"/"+ dto.getRevDate()+"/"+ sysFileName);
					try {
						if(saveFile.mkdirs()) {
							file.transferTo(saveFile);
							setDTOFileName += sysFileName + "&";
							dto.setImgs(setDTOFileName);
						}
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else if(request.getParameter("foodName")!=null) {
					dto.setFoodName(request.getParameter("foodName"));
					File saveFile = new File(foodReviewsImg + "/"+dto.getRestId()+"/"+dto.getMemId()+"/"+ dto.getRevDate()+"/"+ sysFileName);
					try {
						if(saveFile.mkdirs()) {
							file.transferTo(saveFile);
							setDTOFileName += sysFileName + "&";
							dto.setImgs(setDTOFileName);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}else {
			dto.setImgs("non");
		}
		
		int check = dao.insertReview(dto);
		
		if(check == 1) {
			System.out.println("rest db성공");
			if(dto.getFoodName()!=null) {
				dao.updateFoodRate(dto.getFoodName(),dto.getRate());
				dao.updateFoodRateAvr(dto.getFoodName());
			}else
				System.out.println(dto.getRate());
				dao.updateRestRate(dto.getRestId(),dto.getRate());
				dao.updateRestRateAvr(dto.getRestId());
		}else {
			System.out.println("실패");
			}
		
		System.out.println("멤버아이디 : " + dto.getMemId());
		System.out.println("음식점아이디 : " + dto.getRestId());
		System.out.println("음식 이름 : " + dto.getFoodName());
		System.out.println("별점 : " + dto.getRate());
		System.out.println("리뷰 : " + dto.getReview());
		System.out.println("사진 : " + dto.getImgs());
		System.out.println("저장날짜 : " + dto.getRevDate());
		return check;
	}

	@Override
	public void infoRest(Model model,int restId) {
		// TODO Auto-generated method stub
		try {
			restDTO dto = dao.infoRest(restId);
			model.addAttribute("restDTO",dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
