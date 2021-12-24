package com.dine.root.common.aws.service;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;

public interface S3Service {
	
	public void imagesUpload(String ssn_num, String folderName, MultipartFile[] file, AmazonS3 s3client) throws Exception;

	
}
