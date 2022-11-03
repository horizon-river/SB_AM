<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE"/>
<%@ include file="../common/head.jspf" %>
<%@ page import="com.kpk.exam.demo.util.Ut" %>

<section class="mt-8">
	<div class="container mx-auto px-3 text-xl">
		<div class="table-box-type-1">
			<table class="table table-zebra w-full">
				<tbody>
					<tr>
						<th>가입일자</th>
						<td>${rq.loginedMember.regDate }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${rq.loginedMember.loginId }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${rq.loginedMember.name }</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${rq.loginedMember.nickname }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${rq.loginedMember.cellphoneNum }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${rq.loginedMember.email }</td>
					</tr>
					<tr>
						<th></th>
						<td><a href="../member/checkPassword?replaceUri=${Ut.getUriEncoded('../member/modify') }" class="btn">회원정보수정</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="btns mt-3">
			<button class="btn btn-warning" type="button" onclick="history.back();">뒤로가기</button>
		</div>
		
	</div>
</section>

<%@ include file="../common/foot.jspf" %>