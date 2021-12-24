package com.dine.root.common.aws.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public final class ImageUploadUtil {
    
    private static Logger logger = LoggerFactory.getLogger(ImageUploadUtil.class);
 
    public static void imagesUpload(String ssn_num, String folderName, MultipartFile[] file, AmazonS3 s3client, String bucketName) {
 
        ObjectMetadata omd = new ObjectMetadata();
        
        try {            
            // 사진 업로드
            for(int i=0; i<file.length; i++) {
                omd.setContentType(file[i].getContentType());
                omd.setContentLength(file[i].getSize());
                omd.setHeader("filename", file[i].getOriginalFilename());
                
                PutObjectRequest putObjectRequest = 
                        new PutObjectRequest(bucketName, folderName + "_" + ssn_num + "/" + folderName + ssn_num + "_" + System.currentTimeMillis(), file[i].getInputStream(), omd);
                
                putObjectRequest.setCannedAcl(CannedAccessControlList.Private);
                s3client.putObject(putObjectRequest);
                logger.info("======== Upload "+i+1+" completed !!!! =======");
            }
        
        } catch (AmazonServiceException ase) {
            logger.info("Caught an AmazonServiceException from PUT requests, rejected reasons:");
            logger.info("Error Message:    " + ase.getMessage());
            logger.info("HTTP Status Code: " + ase.getStatusCode());
            logger.info("AWS Error Code:   " + ase.getErrorCode());
            logger.info("Error Type:       " + ase.getErrorType());
            logger.info("Request ID:       " + ase.getRequestId());
        } catch (AmazonClientException ace) {
            logger.info("Caught an AmazonClientException: ");
            logger.info("Error Message: " + ace.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}


