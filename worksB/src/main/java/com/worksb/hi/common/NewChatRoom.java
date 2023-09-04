package com.worksb.hi.common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class NewChatRoom {
	private final TokenService tokenService;
    private final RestTemplate restTemplate;

    @Autowired
    public NewChatRoom(RestTemplate restTemplate, TokenService tokenService) {
        this.restTemplate = restTemplate;
        this.tokenService = tokenService;
    }
    public String sendHttpPostRequest(String roomName) {
        String apiUrl = "https://vchatcloud.com/openapi/v1/rooms";
        String apiKey = "HzCAAD-VCzR84-MnLKSz-FzXY6J-20230901171107";
        String authToken = tokenService.getAuthToken(); 
        int maxUser = 10;

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.add("api_key", apiKey);
        headers.add("X-AUTH-TOKEN", authToken);
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        // 요청 본문 데이터 설정
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("maxUser", String.valueOf(maxUser));
        body.add("roomName", roomName);

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);

        // HTTP POST 요청 보내기
        ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);
        String response = responseEntity.getBody();

        // 응답 처리
        System.out.println("API 호출 결과: " + response);
        return response;
    }
}
