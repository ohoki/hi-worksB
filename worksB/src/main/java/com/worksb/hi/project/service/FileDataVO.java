package com.worksb.hi.project.service;




import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FileDataVO {
//	Name           Null?    Type          
//			-------------- -------- ------------- 
//			BOARD_TYPE     NOT NULL VARCHAR2(20)  
//			FILE_NAME      NOT NULL VARCHAR2(100) 
//			FIE_PATH       NOT NULL VARCHAR2(200) 
//			FILE_TYPE      NOT NULL VARCHAR2(40)  
//			FILE_REGDATE   NOT NULL DATE          
//			FILE_SIZE      NOT NULL VARCHAR2(20)  
//			BOARD_ID       NOT NULL NUMBER        
//			REAL_FILE_PATH NOT NULL VARCHAR2(200) 
//			FILE_ID        NOT NULL NUMBER        
//			PROJECT_ID     NOT NULL NUMBER       
	private String boardType;
	private String fileName;
	private String filePath;
	private String fileType;
	@DateTimeFormat(pattern = "YY/MM/dd")
	@JsonFormat(pattern = "yy/MM/dd")
	private Date fileRegdate;
	private long fileSize;
	private Integer boardId;
	private String realFilePath;
	private Integer fileId;
	private Integer projectId;
	//이름출력을 위함
	private String memberName;
	
	//접근제한을 위한 필드
	private String memberId;
	private String manager;
	
	//jsp에서 용량출력할 때는 string형식
	private String convertedSize;
	
	//file을 바이트타입으로 변환한 것
	private byte[] fileContent;
	
	//downloadlist
	private int companyId;
	//다운로드리스트테이블의 프라이머리키
	int downloadId;
	

}
