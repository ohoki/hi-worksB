package com.worksb.hi.company.service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class ResTemplateConfig {
	@Bean
	public RestTemplate resTemplate() {
		return new RestTemplate();
	}
	

}
