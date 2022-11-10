<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"/>
<%@ include file="../common/head.jspf" %>
<%@ include file="../common/toastUiEditorLib.jspf" %>

<section class="mt-8">
	<div class="container mx-auto px-3 text-xl">
		<div class="table-box-type-1">
			<table class="table table-zebra w-full">
				<tbody>
					<tr>
						<th>번호</th>
						<td><div class="badge badge-lg">${article.id }</div></td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${article.regDate }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${article.updateDate }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>
							<span class="badge article-detail__hit-count">${article.hitCount }</span>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.writer }</td>
					</tr>
					<tr>
						<th>추천</th>
						<td>
							<span class="badge">${article.goodReactionPoint }</span>
							<c:if test="${actorCanMakeReaction }">
								<span>&nbsp;</span>
								<a href="/usr/reactionPoint/doGoodReaction?relTypeCode=article&relId=${param.id }&replaceUri=${rq.encodedCurrentUri}" 
								class="btn btn-outline btn-xs">좋아요 👍</a>
								<span>&nbsp;</span>
								<a href="/usr/reactionPoint/doBadReaction?relTypeCode=article&relId=${param.id }&replaceUri=${rq.encodedCurrentUri}" 
								class="btn btn-outline btn-xs">싫어요 👎</a>
							</c:if>
							<c:if test="${actorCanCancelGoodReaction }">
								<span>&nbsp;</span>
								<a href="/usr/reactionPoint/doCancelGoodReaction?relTypeCode=article&relId=${param.id }&replaceUri=${rq.encodedCurrentUri}"  
								class="btn btn-primary btn-xs">좋아요 👍</a>
								<span>&nbsp;</span>
								<a onclick="alert(this.title); return false;" title="좋아요를 먼저 취소해주세요." href="#"
								class="btn btn-outline btn-xs">싫어요 👎</a>	
							</c:if>
							<c:if test="${actorCanCancelBadReaction }">
								<span>&nbsp;</span>
								<a onclick="alert(this.title); return false;" title="싫어요를 먼저 취소해주세요." href="#" 
								class="btn btn-outline btn-xs">좋아요 👍</a>
								<span>&nbsp;</span>
								<a href="/usr/reactionPoint/doCancelBadReaction?relTypeCode=article&relId=${param.id }&replaceUri=${rq.encodedCurrentUri}" 
								class="btn btn-primary btn-xs">싫어요 👎</a>	
							</c:if>
						</td>
					<tr>
						<th>제목</th>
						<td>${article.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-viewer">
								<script type="text/x-template">${article.getForPrintBody() }</script>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="btns mt-3">
			<c:if test="${empty param.listUri}">
				<button class="btn btn-warning" type="button" onclick="history.back();">뒤로가기</button>			
			</c:if>
			<c:if test="${not empty param.listUri}">
				<a class="btn btn-warning" href="${param.listUri }">뒤로가기</a>			
			</c:if>
			<c:if test="${article.extra__actorCanModify }">
				<a class="btn btn-accent"  href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.extra__actorCanDelete }">
				<a class="btn btn-error" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="../article/doDelete?id=${article.id }">삭제</a>
			</c:if>
		</div>
		
	</div>
</section>

<section class="mt-5">
	<div class="container mx-auto px-3">
		<h2>댓글 작성</h2>
		<c:if test="${rq.logined }">
			<form class="table-box-type-1" method="post" action="../reply/doWrite" onsubmit="ReplyWrite__submitForm(this); return false;">
				<input type="hidden" name="relTypeCode" value="article" />
				<input type="hidden" name="relId" value="${article.id }" />
				<input type="hidden" name="replaceUri" value="${rq.currentUri }"/>
				<table class="table table-zebra w-full">
					<tbody>
						<tr>
							<th>작성자</th>
							<td>${rq.loginedMember.nickname }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea class="w-full textarea textarea-bordered" name="body" placeholder="댓글을 입력해주세요." rows="3"></textarea>
							</td>
						</tr>
						<tr>
							<th></th>
							<td><button class="btn btn-success" type="submit">댓글작성</button></td>
						</tr>
					</tbody>
				</table>
			</form>
		</c:if>
		<c:if test="${rq.notLogined }">
			<a class="btn btn-primary" href="${rq.loginUri }">로그인</a> 후 이용해주세요.
		</c:if>
	</div>
</section>

<section class="mt-5">
	<div class="container mx-auto px-3">
		<h2>댓글 리스트 (${replies.size() })</h2>
		<table class="table table-zebra w-full">
			<colgroup>
				<col width="80" />
				<col width="200" />
				<col width="100" />
				<col width="50" />
				<col width="100" />
			</colgroup>
			<thead>
				<tr>
					<!-- <th>번호</th> -->
					<th>작성자</th>
					<th>내용</th>
					<th>날짜</th>
					<th>추천</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reply" items="${replies }" varStatus="status">
					<tr class="hover">
						<!-- <td>${status.count }</td> -->
						<td>${reply.writer }</td>
						<td>${reply.getForPrintBody() }</td>
						<td>${reply.forPrintType1RegDate }</td>
						<td>${reply.goodReactionPoint }</td>
						<td>
							<c:if test="${reply.extra__actorCanModify}">
								<a class="btn btn-ghost" href="../reply/modify?id=${reply.id }&replaceUri=${rq.encodedCurrentUri }">수정</a>
							</c:if>
							<c:if test="${reply.extra__actorCanDelete}">
								<a class="btn btn-ghost" onclick="if(confirm('삭제 하시겠습니까?') == false) return false;" href="../reply/doDelete?id=${reply.id }&replaceUri=${rq.encodedCurrentUri }">삭제</a>
							</c:if>
						</td>
					</tr>					
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>

<script>
	// 조회수 관련
	function ArticleDetail__increaseHitCount(){
		const localStorageKey = 'article__' + params.id + '__alreadyView';
		
		if(localStorage.getItem(localStorageKey)){
			return;
		}
		localStorage.setItem(localStorageKey, true);
		
		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y',
		}, function(data) {
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}
	
	ArticleDetail__increaseHitCount();
	
	$(function(){
		setTimeout(ArticleDetail__increaseHitCount(), 2000);
	});
</script>

<script type="text/javascript">
	// 댓글 관련
	let ReplyWrite__submitFormDone = false;
	function ReplyWrite__submitForm(form) {
		if(ReplyWrite__submitFormDone){
			return;
		}
		
		form.body.value = form.body.value.trim();
		
		const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
		const markdown = editor.getMarkdown().trim();
				
		if(markdown.length == 0){
			alert('내용을 입력해주세요.');
			editor.focus();
			
			return;
		}
		
		form.body.value = markdown;
		
		form.submit();
		
		ReplyWrite__submitFormDone = true;
	}
</script>
<%@ include file="../common/foot.jspf" %>