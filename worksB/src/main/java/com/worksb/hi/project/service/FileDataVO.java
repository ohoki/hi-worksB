package com.worksb.hi.project.service;




import java.util.Date;

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
	private Date fileRegdate;
	private String fileSize;
	private Integer boardId;
	private String realFilePath;
	private Integer fileId;
	private Integer projectId;
	//이름출력을 위함
	private String memberName;
	
	//접근제한을 위한 필드
	private String memberId;
	private String manager;
}
