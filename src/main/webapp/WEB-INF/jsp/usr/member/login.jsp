<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"/>
<%@ include file="../common/head.jspf" %>

	<section class="mt-8">
		<div class="container mx-auto px-3 text-xl">
			<form class="table-box-type-1" method="post" action="../member/doLogin">
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input class="w-96" name="loginId" type="text" placeholder="아이디를 입력해주세요."/></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="w-96" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요."/></td>
						</tr>
						<tr>
							<th></th>
							<td><button type="submit">로그인</button></td>
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