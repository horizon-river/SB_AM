package com.kpk.exam.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpk.exam.demo.repository.ReplyRepository;
import com.kpk.exam.demo.util.Ut;
import com.kpk.exam.demo.vo.Article;
import com.kpk.exam.demo.vo.Member;
import com.kpk.exam.demo.vo.Reply;
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

	public List<Reply> getForPrintReplies(Member actor, String relTypeCode, int relId) {
		
		List<Reply> replies = replyRepository.getForPrintReplies(relTypeCode, relId);
		
		for (Reply reply : replies) {
			updateForPrintData(actor, reply);
		}
		
		return replies;
		
	}

	private void updateForPrintData(Member actor, Reply reply) {
		if (actor == null) {
			return;
		}
		
		ResultData actorCanDeleteRd = actorCanDelete(actor, reply);
		reply.setExtra__actorCanDelete(actorCanDeleteRd.isSuccess());
		
		ResultData actorCanModifyRd = actorCanModify(actor, reply);
		reply.setExtra__actorCanModify(actorCanModifyRd.isSuccess());
		
	}

	private ResultData actorCanModify(Member actor, Reply reply) {
		if (reply == null) {
			return ResultData.from("F-1", "댓글이 존재하지 않습니다");
		}
		
		if (reply.getMemberId() != actor.getId()) {
			return ResultData.from("F-2", "해당 댓글에 대한 권한이 없습니다.");
		}
		return ResultData.from("S-1", "수정 가능");
	}

	private ResultData actorCanDelete(Member actor, Reply reply) {
		if (reply == null) {
			return ResultData.from("F-1", "댓글이 존재하지 않습니다");
		}
		
		if (reply.getMemberId() != actor.getId()) {
			return ResultData.from("F-2", "해당 댓글에 대한 권한이 없습니다.");
		}
		return ResultData.from("S-1", "삭제 가능");
	}

	public Reply getForPrintReply(Member actor, int id) {
		Reply reply = replyRepository.getForPrintReply(id);
		
		updateForPrintData(actor, reply);
		
		return reply;
	}

	public ResultData deleteReply(int id) {
		replyRepository.deleteReply(id);
		
		return ResultData.from("S-1", Ut.f("%d번 댓글을 삭제했습니다.", id));
	}

	public ResultData modifyReply(int id, String body) {
		replyRepository.modifyReply(id, body);
		
		return ResultData.from("S-1", Ut.f("%d번 댓글을 수정했습니다.", id));
	}
	
}
