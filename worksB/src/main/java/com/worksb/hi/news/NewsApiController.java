package com.worksb.hi.news;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.net.URI;
import java.nio.charset.Charset;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

public class NewsApiController {
    
	   
    @GetMapping("/naver")
    public String naver() {

        // String query = "갈비집";
        // String encode = Base64.getEncoder().encodeToString(query.getBytes(StandardCharsets.UTF_8));

        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/local.json")
                .queryParam("query","중국집")
                .queryParam("display", 10)
                .queryParam("start", 1)
                .queryParam("sort", "random")
                .encode(Charset.forName("UTF-8"))
                .build()
                .toUri();

//        log.info("uri : {}", uri);

        RestTemplate restTemplate = new RestTemplate();
		
        // 헤더 추가 위해
        RequestEntity<Void> req = RequestEntity
                .get(uri)
                .header("X-Naver-Client-Id", "RZPgllftwhnJ8xRtXmxk")
                .header("X-Naver-Client-Secret", "r1123123112")
                .build();

        ResponseEntity<String> result = restTemplate.exchange(req, String.class);

        return result.getBody();
    }
   


}