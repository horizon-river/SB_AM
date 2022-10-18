<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"/>
<%@ include file="../common/head.jspf" %>

	<section class="mt-8">
		<div class="container mx-auto px-3 text-xl">
			<form class="table-box-type-1" method="post" action="../article/doWrite">
				<table class="table table-zebra w-full">
					<tbody>
						<tr>
							<th>작성자</th>
							<td>${rq.loginedMember.nickname }</td>
						</tr>
						<tr>
							<th>게시판</th>
							<td>
								<select class="w-full select select-bordered" name="boardId">
									<option disabled>게시판을 선택해주세요.</option>
									<option value="1">공지사항</option>
									<option value="2">자유게시판</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input required="required" type="text" class="input input-ghost w-full" name="title" placeholder="제목을 입력해주세요."/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea required="required" class="w-full textarea textarea-bordered" name="body" placeholder="내용을 입력해주세요."></textarea>
							</td>
						</tr>
						<tr>
							<th></th>
							<td><button class="btn btn-success" type="submit">작성</button></td>
						</tr>
					</tbody>
				</table>
				
			</form>
			
			<div class="btns mt-3">
				<button class="btn btn-warning" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
	
<%@ include file="../common/foot.jspf" %>