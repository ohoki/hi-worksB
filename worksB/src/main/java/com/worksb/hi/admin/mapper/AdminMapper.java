package com.worksb.hi.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.project.service.FileDataVO;

public interface AdminMapper {
	//downloadList
	public List<FileDataVO> downloadList(@Param("companyId")int companyId,@Param("pagingvo")PagingVO pagingVO);
	//downloadlist의 갯수
	public int downloadCount(int companyId);
	
	//prjlist갯수
	public int prjcount(int companyId);
}
