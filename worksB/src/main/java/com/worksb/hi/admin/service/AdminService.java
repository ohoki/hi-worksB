package com.worksb.hi.admin.service;

import java.util.List;

import com.worksb.hi.project.service.FileDataVO;

public interface AdminService {
	//downloadList
	public List<FileDataVO> downloadList(int companyId);
}
