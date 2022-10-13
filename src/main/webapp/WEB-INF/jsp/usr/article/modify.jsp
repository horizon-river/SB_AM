<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE MODIFY"/>
<%@ include file="../common/head.jspf" %>

	<section class="mt-8">
		<div class="container mx-auto px-3 text-xl">
			<form class="table-box-type-1" method="post" action="../article/doModify">
				<table>
					<tbody>
						<tr>
							<th>번호</th>
							<td><input name="id" type="hidden" value="${article.id }"/>${article.id }</td>
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
							<th>제목</th>
							<td><input class="w-full" name="title" type="text" placeholder="제목을 입력해주세요." value="${article.title}" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea class="w-full" name="body" placeholder="내용을 입력해주세요.">${article.body}</textarea>
							</td>
						</tr>
						<tr>
							<th></th>
							<td><button type="submit">수정</button></td>
						</tr>
					</tbody>
				</table>
				
			</form>
			
			<div class="btns">
				<button class="btn-text-link" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
	
<%@ include file="../common/foot.jspf" %>