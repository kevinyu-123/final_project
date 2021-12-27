package com.dine.root.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileConfig {
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		 CommonsMultipartResolver mr = new CommonsMultipartResolver();
		 mr.setMaxUploadSize(52428800);		// 파일 크기 50MB까지 설정.
		 mr.setDefaultEncoding("utf-8");		// 인코딩을  utf-8로 하겠다.
		 return mr;
	}
}
