package com.worksb.hi.news;

import java.net.URI;
import java.nio.charset.Charset;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
public class NewsApiController {
    
	   
    @GetMapping("news")
    public String naver(Model model) {


        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/news.json")
                .queryParam("query","속보")
                .queryParam("display", 10)
                .queryParam("start", 1)
                .queryParam("sort", "sim")
                .encode(Charset.forName("UTF-8"))
                .build()
                .toUri();


        RestTemplate restTemplate = new RestTemplate();
		
        // 헤더 추가 위해
        RequestEntity<Void> req = RequestEntity
                .get(uri)
                .header("X-Naver-Client-Id", "4uDJD6ylZk6VbUxwYvjw")
                .header("X-Naver-Client-Secret", "5tuE1sO5JD")
                .build();

        ResponseEntity<String> result = restTemplate.exchange(req, String.class);
        
        String news = result.getBody();
        model.addAttribute("news", news);
        
        URI economicUri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/news.json")
                .queryParam("query","경제")
                .queryParam("display", 10)
                .queryParam("start", 1)
                .queryParam("sort", "sim")
                .encode(Charset.forName("UTF-8"))
                .build()
                .toUri();


        restTemplate = new RestTemplate();
		
        // 헤더 추가 위해
        req = RequestEntity
                .get(economicUri)
                .header("X-Naver-Client-Id", "4uDJD6ylZk6VbUxwYvjw")
                .header("X-Naver-Client-Secret", "5tuE1sO5JD")
                .build();

        result = restTemplate.exchange(req, String.class);
        
        String economic = result.getBody();
        model.addAttribute("economicNews", economic);
        
        
        return "mypage/news";
    }
   


}