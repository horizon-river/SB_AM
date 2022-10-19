<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name} 게시판"/>
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
					<c:set var="pageMenuLen" value="6" />
					<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
					<c:set var="endPage" value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount }" />
					<c:if test="${startPage > 1 }">
						<a class="btn btn-sm" href="?boardId=${boardId }&page=1">1</a>
						<c:if test="${startPage > 2 }">
							<a class="btn btn-sm btn-disabled">...</a>
						</c:if>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a class="btn btn-sm ${page == i ? 'btn-active' : '' }" href="?boardId=${boardId }&page=${i }">${i }</a>
					</c:forEach>
					<c:if test="${endPage < pagesCount}">
						<c:if test="${endPage < pagesCount - 1 }">
							<a class="btn btn-sm btn-disabled">...</a>
						</c:if>
						<a class="btn btn-sm" href="?boardId=${boardId }&page=${pagesCount }">${pagesCount }</a>
					</c:if>
				</div>
			</div>
			<div class="search flex justify-center mt-3">
				<form action="" method="get" class="flex justify-item-stretch">
					<input name="searchKeyword" type="text" placeholder="검색어를 입력해주세요." class="input w-full max-w-xs" />
					<button class="btn" type="submit">검색</button>
				</form>
			</div>
		</div>
	</section>
	
<%@ include file="../common/foot.jspf" %>