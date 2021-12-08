package com.dine.root.reviews.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dine.root.reviews.dto.foodReviewsDTO;

@Service
public class reviewsServiceImpl implements reviewsService{

	@Override
	public void uploadProcess(MultipartHttpServletRequest m) {
		// TODO Auto-generated method stub
		foodReviewsDTO dto = new foodReviewsDTO();
		dto.setMemId(m.getParameter("memId"));
		dto.setRestId(Integer.parseInt(m.getParameter("restId")));
		dto.setRate(m.getParameter("rate"));
		dto.setReview(m.getParameter("content"));

		List<MultipartFile> files = m.getFiles("restImgs");
		SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		
		Date date = new Date();
        long timeInMilliSeconds = date.getTime();
        java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
		dto.setRevDate(date1);
		
		String setDTOFileName = "";
		if(files.size() != 0) {
			for(int i=0; i<files.size(); i++) {
				String sysFileName = fo.format(calendar.getTime());
				sysFileName += files.get(i).getOriginalFilename();
				System.out.println("사진 " + sysFileName);
				File saveFile = new File(IMAGE_REPO + "/"+dto.getRestId()+"/"+dto.getMemId()+"/"+ dto.getRevDate()+"/"+ sysFileName);
				try {
					if(saveFile.mkdirs()) {
						files.get(i).transferTo(saveFile);
						setDTOFileName += sysFileName + "&";
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else {
			dto.setImgs("non");
		}
		System.out.println("멤버아이디 : " + dto.getMemId());
		System.out.println("음식점아이디 : " + dto.getRestId());
		System.out.println("별점 : " + dto.getRate());
		System.out.println("리뷰 : " + dto.getReview());
		System.out.println("사진 : " + setDTOFileName);
		System.out.println("저장날짜 : " + dto.getRevDate());
	}
}
