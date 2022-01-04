package com.dine.root.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;


@PropertySource("classpath:application.properties")
@Configuration
public class MailConfig {
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	private static String username;
	private static String password;
	
	@Value("${jms.username}")
	public void setUsername(String value) {
		username = value;
	}
	
	@Value("${jms.password}")
	public void setPassword(String value) {
		password = value;
	}
	
	   @Bean
	   public static JavaMailSender mailSender() {
	   JavaMailSenderImpl jms = new JavaMailSenderImpl();
	   jms.setHost("smtp.gmail.com");
	   jms.setPort(587);
	   jms.setUsername(username);
	   jms.setPassword(password);
	   
	   Properties prop = new Properties();
	   prop.setProperty("mail.transport.protocol", "smtp");
	   prop.setProperty("mail.smtp.auth", "true"); 
	   prop.setProperty("mail.smtp.starttls.enable", "true");
	   
	   prop.setProperty("mail.debug", "true");
	   jms.setJavaMailProperties(prop);
	   
	   return jms;
	    }
}
