package com.dine.root.common.aws.service;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;

import com.dine.root.common.aws.util.ImageUploadUtil;

@Configuration
@PropertySource("classpath:application.properties")
@Service("s3Service")
public class S3ServiceImpl implements S3Service{
	
	private static String bucket;

    @Value("${aws.bucket}")
	public void setBucket(String value) {
		bucket = value;	
    }
 
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
    
    @Override
    public void imagesUpload(String ssn_num, String folderName, MultipartFile[] file, AmazonS3 s3client) throws Exception {
        String bucketName = bucket;
        ImageUploadUtil.imagesUpload(ssn_num, folderName, file, s3client, bucketName);
    }
    

}

