package com.dine.root.common.aws.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.dine.root.common.aws.service.S3Service;
import com.dine.root.common.aws.service.S3ServiceImpl;
import com.dine.root.common.aws.util.ImageDownloadUtil;

@Configuration
@PropertySource("classpath:application.properties")
@Controller
public class S3Controller {
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	@Autowired
	private S3Service s3Service;
	
	private static String accessKey;
	private static String secretKey;
	private static String bucket;
	
	@Value("${aws.accessKey}")
	public void setAccesskey(String value) {
		accessKey = value;
	}
	@Value("${aws.secretKey}")
	public void setSecretKey(String value) {
		secretKey = value;
	}
	@Value("${aws.bucket}")
	public void setBucket(String value) {
		bucket = value;
	}
	private Logger logger = LoggerFactory.getLogger(S3ServiceImpl.class); 
	
	@GetMapping("test")
	public String test() {
		return "file/testfile";
	}
	
    @RequestMapping(value="uploadImages.do", method= {RequestMethod.POST, RequestMethod.GET} )
    public @ResponseBody String initUpload(@RequestParam("files") MultipartFile[] files, 
    @RequestParam("ssn_num") String ssn_num, @RequestParam String frst_nm, @RequestParam String last_nm, HttpServletRequest request) throws Exception {
 
        try{
        	AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
    		ClientConfiguration clientConfig = new ClientConfiguration();
    		clientConfig.setProtocol(Protocol.HTTP);
    		AmazonS3 s3client = AmazonS3ClientBuilder
    				.standard()
    				.withCredentials(new AWSStaticCredentialsProvider(credentials))
    				.withRegion(Regions.AP_NORTHEAST_2)
    				.build();
            
            logger.info("ssn_num : " + ssn_num);
            logger.info("first_name : " + frst_nm);
            logger.info("last_name  : " + last_nm);
 
            s3Service.imagesUpload(ssn_num, last_nm + "_" + frst_nm, files, s3client);
                        
            System.out.println("---------------- START UPLOAD FILE ----------------");
            
            return "completed! select another files you want";
        } catch(Exception e) {
            e.printStackTrace();
        } 
        
        return "completed! select another files you want";
    }
    @RequestMapping(value="image.do")
    public String initImage(@RequestParam String ssn_num, @RequestParam String frst_nm, @RequestParam String last_nm, ModelMap model) throws Exception {
    
        System.out.println("image.do");
        
        String bucketName = bucket;
        
        List<String> ImageList = new ArrayList<>();
        
        // 버킷 열어서 검사해야 함
        
        try{
        	AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
    		ClientConfiguration clientConfig = new ClientConfiguration();
    		clientConfig.setProtocol(Protocol.HTTP);
    		 AmazonS3 s3client = AmazonS3ClientBuilder
    				.standard()
    				.withCredentials(new AWSStaticCredentialsProvider(credentials))
    				.withRegion(Regions.AP_NORTHEAST_2)
    				.build();
            
            logger.info("bucketName : " + bucketName);
            
            ImageList = ImageDownloadUtil.getImagesList(s3client, bucketName, last_nm, frst_nm, ssn_num);
 
        } catch(Exception e) {
            e.printStackTrace();
        } 
        
        
        model.addAttribute("frst_nm", frst_nm);
        model.addAttribute("last_nm", last_nm);
        model.addAttribute("ssn_num", ssn_num); 
        
        model.addAttribute("imageList", ImageList);
        
        return "file/show";
    }




 
}
