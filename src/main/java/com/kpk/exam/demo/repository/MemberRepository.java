package com.kpk.exam.demo.repository;

import org.apache.ibatis.annotations.Mapper;

import com.kpk.exam.demo.vo.Member;

@Mapper
public interface MemberRepository {

	public void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);

	public int getLastInsertId();

	public Member getMemberById(int id);
	
}
