package com.kpk.exam.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kpk.exam.demo.service.ReplyService;
import com.kpk.exam.demo.util.Ut;
import com.kpk.exam.demo.vo.ResultData;
import com.kpk.exam.demo.vo.Rq;

@Controller
public class UsrReplyController {
	
	@Autowired
	private ReplyService replyService;
	@Autowired
	private Rq rq;
	
	@RequestMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(int memberId, String relTypeCode, int relId, String replaceUri, String body) {
				
		ResultData writeReplyRd = replyService.writeReply(memberId, relTypeCode, relId, body);
		
		int id = (int) writeReplyRd.getData1();
		
		if (Ut.empty(replaceUri)) {
			switch (relTypeCode) {
			case "article":
				replaceUri = Ut.f("../article/detail?id=%d", relId);
				break;
			}
		}
		
		return rq.jsReplace(writeReplyRd.getMsg(), replaceUri);
	}
}