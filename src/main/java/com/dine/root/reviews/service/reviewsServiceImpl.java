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
	public int reviewsUploadNonFile(HttpServletRequest request) {
		reviewsDTO dto = new reviewsDTO();
		dto.setMemId(request.getParameter("memId"));
		dto.setRate(Integer.parseInt(request.getParameter("rate")));
		dto.setReview(request.getParameter("content"));
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
		java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
		dto.setRevDate(date1);
		dto.setImgs("non");
		dto.setRestId(Integer.parseInt(request.getParameter("restId")));
		dto.setFoodName(request.getParameter("foodName"));
		int check = 0;
		if(request.getParameter("restId")==null) {
			check = dao.insertFoodReview(dto);
		}else {
			check = dao.insertRestReview(dto);
		}
		System.out.println(check);
		int restRateCheck=0;
		int rateAvrCheck=0;
		if(check == 1) {
			System.out.println("rest db성공");
			if(dto.getFoodName().equals("non")) {
				System.out.println(dto.getRate());
				System.out.println(dto.getRestId());
				int restId = dto.getRestId(); int rate = dto.getRate();
				restRateCheck= dao.updateRestRate(restId,rate);
				System.out.println("restRate 저장완료");
				rateAvrCheck = dao.updateRestRateAvr(restId);
				System.out.println("restavr 저장완료");

			}else {
				dao.updateFoodRate(dto.getFoodName(),dto.getRate());
				dao.updateFoodRateAvr(dto.getFoodName());
			}
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
	public int reviewsUploadProcess(List<MultipartFile> multipartFile,HttpServletRequest request) {	
		// TODO Auto-generated method stub
		reviewsDTO dto = new reviewsDTO();
		String memName = request.getParameter("memId");
		// 멤버 이름으로 mem_id를 찾아서 dto에 저장시켜야 하는데 출력은 그럼 다시 멤버를 찾아야하는것보다 로그인 세션에서 id값을 전달해주는 좋다
		dto.setMemId(request.getParameter("memId"));
		System.out.println("멤버아이디 : "+dto.getMemId());
		dto.setRate(Integer.parseInt(request.getParameter("rate")));
		dto.setReview(request.getParameter("content"));
		SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
		java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
		dto.setRevDate(date1);
		String setDTOFileName = "";


		for(MultipartFile file : multipartFile) {
			String sysFileName = fo.format(calendar.getTime());
			sysFileName += file.getOriginalFilename();
			System.out.println("사진 " + sysFileName);
			System.out.println(request.getParameter("restId"));
			System.out.println(request.getParameter("foodName"));

			if(request.getParameter("foodName").equals("non")) {
				dto.setFoodName(request.getParameter("foodName"));
				dto.setRestId(Integer.parseInt(request.getParameter("restId")));
				File saveFile = new File(restReviewsImg + "/"+dto.getRestId()+"/"+ dto.getRevDate()+"/"+ sysFileName);
				System.out.println(saveFile.getAbsolutePath());
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
			}else if(request.getParameter("restId").equals("0")) {
				dto.setRestId(0);
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
		int check = 0;
		if(dto.getRestId()==0) {
			check = dao.insertFoodReview(dto);
		}else {
			check = dao.insertRestReview(dto);
		}
		System.out.println(check);
		int restRateCheck=0;
		int rateAvrCheck=0;
		if(check == 1) {
			System.out.println("rest db성공");
			if(dto.getFoodName().equals("non")) {
				System.out.println(dto.getRate());
				System.out.println(dto.getRestId());
				int restId = dto.getRestId(); int rate = dto.getRate();
				restRateCheck= dao.updateRestRate(restId,rate);
				System.out.println("restRate 저장완료");
				rateAvrCheck = dao.updateRestRateAvr(restId);
				System.out.println("restavr 저장완료");

			}else {
				dao.updateFoodRate(dto.getFoodName(),dto.getRate());
				dao.updateFoodRateAvr(dto.getFoodName());
			}
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
