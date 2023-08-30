package com.worksb.hi.admin.mapper;

import java.util.List;

import com.worksb.hi.project.service.FileDataVO;

public interface AdminMapper {
	//downloadList
	public List<FileDataVO> downloadList(int companyId);
}
