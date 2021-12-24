package com.dine.root.common.aws.util;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.S3ObjectSummary;

public final class ImageDownloadUtil {
    private static Logger logger = LoggerFactory.getLogger(ImageDownloadUtil.class);
 
    public static List<String> getImagesList(AmazonS3 s3Client, String bucketName, String last_nm, String frst_nm, String ssn_num) throws Exception {
        
        List<String> ImageList = new ArrayList<String>();
        
        ListObjectsRequest listObjectsRequest = new ListObjectsRequest();
        listObjectsRequest.setBucketName(bucketName);
        listObjectsRequest.setPrefix(last_nm + "_" + frst_nm + "_" + ssn_num);
        
        ObjectListing objects = s3Client.listObjects(listObjectsRequest);
        
        do {
            objects = s3Client.listObjects(listObjectsRequest);
            
            for(S3ObjectSummary objectSummary : objects.getObjectSummaries()) {
                logger.info("keyname : " + objectSummary.getKey());
                ImageList.add(objectSummary.getKey());
            }
            
            listObjectsRequest.setMarker(objects.getNextMarker());
        } while(objects.isTruncated());
        
        return ImageList;
    }
}


