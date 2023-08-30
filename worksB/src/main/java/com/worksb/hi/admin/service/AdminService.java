package com.worksb.hi.admin.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.project.service.FileDataVO;

public interface AdminService {
	//downloadList
	public List<FileDataVO> downloadList(int companyId,PagingVO pagingVO);
	//downloadlist의 갯수
	public int downloadCount(int companyId);
	
	//prjlist갯수
	public int prjcount(int companyId);
}
