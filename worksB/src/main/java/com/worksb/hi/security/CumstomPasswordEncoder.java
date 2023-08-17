package com.worksb.hi.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.worksb.hi.common.UserSha256;

public class CumstomPasswordEncoder implements PasswordEncoder{

	@Override
	public String encode(CharSequence rawPassword) {
		return UserSha256.encrypt((String)rawPassword);
	}
	
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return UserSha256.encrypt((String)rawPassword).equals(encodedPassword);
	}

}
