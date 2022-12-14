<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"/>
<%@ include file="../common/head.jspf" %>

	<section class="mt-8">
		<div class="container mx-auto px-3 text-xl">
			<form class="table-box-type-1" method="post" action="../member/doLogin">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input class="input input-bordered w-full" name="loginId" type="text" placeholder="아이디를 입력해주세요."/></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="input input-bordered w-full" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요."/></td>
						</tr>
						<tr>
							<th></th>
							<td><button class="btn btn-accent" type="submit">로그인</button></td>
						</tr>
						<tr>
							<th></th>
							<td>
								<a href="${rq.findLoginIdUri }" class="btn btn-active btn-ghost" type="submit">아이디 찾기</a>
								<a href="${rq.findLoginPwUri }" class="btn btn-active btn-ghost" type="submit">비밀번호 찾기</a>
							</td>
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