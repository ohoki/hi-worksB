package com.worksb.hi.mypage.web;

import java.net.URI;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.worksb.hi.mypage.service.LunchService;
import com.worksb.hi.mypage.service.LunchVO;

@Controller
public class MyPageController {
    
	@Autowired
	LunchService lunchService;
	
	@SuppressWarnings("unchecked")
	@GetMapping("lunch")
	public String lunch(Model model) {
		List<String> cateList = lunchService.selectLunchCate();
		List<LunchVO> list = lunchService.selectLunchList();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		List<String> menuList = new ArrayList();
		for(int i=0;i<cateList.size();i++) {
			jsonObj.put("name", cateList.get(i));
			for(int j=0;j<list.size();j++) {
				if(list.get(j).getLunchCategory().equals(cateList.get(i))) {
					menuList.add(list.get(j).getLunchMenu());
				}
				jsonObj.put("menu", menuList);
				if(menuList.size()==9) {
					jsonArr.add(jsonObj);
					jsonObj = new JSONObject();
					menuList = new ArrayList();
					break;
				}
			}
		};
		model.addAttribute("lunchList",jsonArr);
		return "mypage/lunch";
	};
	
	   
    @GetMapping("/naverNews")
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
        //경제
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
        
        //사회
        URI socialUri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/news.json")
                .queryParam("query","사회")
                .queryParam("display", 10)
                .queryParam("start", 1)
                .queryParam("sort", "sim")
                .encode(Charset.forName("UTF-8"))
                .build()
                .toUri();


        restTemplate = new RestTemplate();
		
        // 헤더 추가 위해
        req = RequestEntity
                .get(socialUri)
                .header("X-Naver-Client-Id", "4uDJD6ylZk6VbUxwYvjw")
                .header("X-Naver-Client-Secret", "5tuE1sO5JD")
                .build();

        result = restTemplate.exchange(req, String.class);
        
        String social = result.getBody();
        model.addAttribute("socialNews", social);
        
        //정치
        URI politicUri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/news.json")
                .queryParam("query","정치")
                .queryParam("display", 10)
                .queryParam("start", 1)
                .queryParam("sort", "sim")
                .encode(Charset.forName("UTF-8"))
                .build()
                .toUri();


        restTemplate = new RestTemplate();
		
        // 헤더 추가 위해
        req = RequestEntity
                .get(politicUri)
                .header("X-Naver-Client-Id", "4uDJD6ylZk6VbUxwYvjw")
                .header("X-Naver-Client-Secret", "5tuE1sO5JD")
                .build();

        result = restTemplate.exchange(req, String.class);
        
        String politic = result.getBody();
        model.addAttribute("politicNews", politic);
        
        return "mypage/news";
    }
   


}