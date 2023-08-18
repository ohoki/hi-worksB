package com.worksb.hi.project.service;

import lombok.Data;

@Data
public class PrjParticirVO {
	private int prjParticirId;
	private String memberId;
	private String manager;
	private int projectId;
	private String alarmYn;
	private String projectMarkup;
}
