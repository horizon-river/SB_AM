package com.kpk.exam.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpk.exam.demo.repository.ReplyRepository;
import com.kpk.exam.demo.util.Ut;
import com.kpk.exam.demo.vo.ResultData;

@Service
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository;
	
	public ResultData writeReply(int memberId, String relTypeCode, int relId, String body) {
		replyRepository.writeReply(memberId, relTypeCode, relId, body);
		
		int id = replyRepository.getLastInsertId();
		
		return ResultData.from("S-1", Ut.f("%d번 댓글이 등록되었습니다.", id), "id", id);
	}
	
	
	
}
