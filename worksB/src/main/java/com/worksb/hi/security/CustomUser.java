package com.worksb.hi.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.worksb.hi.member.service.MemberVO;

public class CustomUser implements UserDetails {
	
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(MemberVO member) {
		this.member = member;
	}
	
	public MemberVO getMemberInfo() {
		return this.member;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(member.getMemberGrade()));
		return auth;
	}

	@Override
	public String getPassword() {
		return this.member.getMemberPw();
	}

	@Override
	public String getUsername() {
		return this.member.getMemberId();
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		if(this.member.getMailAuth() == 0) {
			return false;
		}
		return true;
	}
}
