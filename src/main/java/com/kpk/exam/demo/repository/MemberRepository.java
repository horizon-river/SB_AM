package com.kpk.exam.demo.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRepository {
	
	public void joinMember();

	public void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);
	
}
