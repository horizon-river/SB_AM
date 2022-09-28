package com.kpk.exam.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpk.exam.demo.repository.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;

	public void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		// memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);
	}
	
}
