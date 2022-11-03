<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="checkPassword"/>
<%@ include file="../common/head.jspf" %>

	<section class="mt-8">
		<div class="container mx-auto px-3 text-xl">
			<form class="table-box-type-1" method="post" action="../member/doCheckPassword">
				<input type="hidden" name="replaceUri" value="${param.replaceUri }"/>
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>${rq.loginedMember.loginId }</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input required="required" class="input input-bordered w-full" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요."/></td>
						</tr>
						<tr>
							<th></th>
							<td><button class="btn btn-accent" type="submit">로그인</button></td>
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