<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name} 게시판"/>
<c:set var="totalPage" value="${totalPage }" />
<%@ include file="../common/head.jspf" %>

	<section class="mt-8">
		<div class="container mx-auto px-3 text-xl">
			<div>${articlesCount } 개</div>
			<div class="table-box-type-1 overflow-x-auto">
				<table class="table">
					<colgroup>
					<col width="80"/>
					<col width="140"/>
					<col />
					<col width="140"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>날짜</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles }">
							<tr class="hover">
								<td>${article.id }</td>
								<td>${article.regDate.substring(2,16) }</td>
								<td><a class="hover:underline" href="../article/detail?id=${article.id }">${article.title }</a></td>
								<td>${article.writer }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="page-menu flex justify-center mt-3">
				<div class="btn-group">
					<c:forEach begin="1" end="${pagesCount }" var="i">
						<a class="btn btn-sm ${page == i ? 'btn-active' : '' }" href="?boardId=${boardId }&page=${i }">${i }</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="../common/foot.jspf" %>