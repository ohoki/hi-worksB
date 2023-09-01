package com.worksb.hi.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.admin.mapper.AdminMapper;
import com.worksb.hi.admin.service.AdminService;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.company.service.DepartmentVO;
import com.worksb.hi.company.service.JobVO;
import com.worksb.hi.project.service.FileDataVO;
import com.worksb.hi.project.service.ProjectVO;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminmapper;
	
	@Override
	public List<FileDataVO> downloadList(int companyId,PagingVO pagingVO) {
		return adminmapper.downloadList(companyId,pagingVO);
	}

	@Override
	public int downloadCount(int companyId) {
		return adminmapper.downloadCount(companyId);
	}

	@Override
	public int prjcount(int companyId) {
		return adminmapper.prjcount(companyId);
	}

	@Override
	public List<ProjectVO> projectList(int companyId, PagingVO pagingVO) {
		return adminmapper.projectList(companyId, pagingVO);
	}

	@Override
	public List<DepartmentVO> departmentList(int companyId) {
		return adminmapper.departmentList(companyId);
	}

	@Override
	public List<JobVO> jobList(int companyId) {
		return adminmapper.jobList(companyId);
	}

	@Override
	public int updateDept(DepartmentVO vo) {
		if(adminmapper.updateDept(vo)<1) {
			return -1;
		}
		return 1;
	}

}