package com.kpk.exam.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kpk.exam.demo.service.MemberService;

@Controller
public class UsrMemberController {
	
	@Autowired
	private MemberService memberSerivce;
	
	// 액션 메서드
	@RequestMapping("usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		memberSerivce.join(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		return "가입!";
	}
}