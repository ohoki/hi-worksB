package com.worksb.hi.common;

import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class TokenService {

    private final RestTemplate restTemplate;

    public TokenService() {
        this.restTemplate = new RestTemplate();
    }

    public String getAuthToken() {
        String tokenUrl = "https://vchatcloud.com/openapi/token";
        
        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", MediaType.APPLICATION_JSON_VALUE);
        
        // GET 요청 보내기
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(tokenUrl, String.class);
        
        // 응답에서 X-AUTH-TOKEN 추출
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        List<String> authTokens = responseHeaders.get("X-AUTH-TOKEN");
        
        if (authTokens != null && !authTokens.isEmpty()) {
        	System.out.println(authTokens);
            // 첫 번째 토큰을 반환
            return authTokens.get(0);
        } else {
            // 토큰을 찾을 수 없는 경우 예외 처리
            throw new RuntimeException("X-AUTH-TOKEN not found in the response");
        }
    }
}
