<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER MODIFY"/>
<%@ include file="../common/head.jspf" %>
<%@ page import="com.kpk.exam.demo.util.Ut" %>

<section class="mt-8">
	<div class="container mx-auto px-3 text-xl">
		<div class="table-box-type-1">
			<form class="table-box-type-1" method="post" action="../member/doModify" onsubmit="MemberModify__submit(this); return false;">
				<input type="hidden" name="memberModifyAuthKey" value="${param.memberModifyAuthKey }" />
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
							<th>새 비밀번호</th>
							<td>
								<input name="loginPw" class="w-full input input-bordered max-w-xs" type="password" placeholder="새 비밀번호를 입력해주세요."/>
							</td>
						</tr>
						<tr>
							<th>새 비밀번호 확인</th>
							<td>
								<input name="loginPwConfirm" class="w-full input input-bordered max-w-xs" type="password" placeholder="새 비밀번호를 다시 입력해주세요."/>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input class="w-full input input-bordered max-w-xs" name="name" type="text" value="${rq.loginedMember.name }"/>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input class="w-full input input-bordered max-w-xs" name="nickname" type="text" value="${rq.loginedMember.nickname }"/>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input class="w-full input input-bordered max-w-xs" name="cellphoneNum" type="text" value="${rq.loginedMember.cellphoneNum }"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input class="w-full input input-bordered max-w-xs" name="email" type="text" value="${rq.loginedMember.email }"/>
							</td>
						</tr>
						<tr>
							<th></th>
							<td><button class="btn" type="submit" >수정</button></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		
		<div class="btns mt-3">
			<button class="btn btn-warning" type="button" onclick="history.back();">뒤로가기</button>
		</div>
		
	</div>
</section>
	
	<script type="text/javascript">
		let MemberModify__submitDone = false;
		function MemberModify__submit(form) {
			if(MemberModify__submitDone){
				return;
			}
			
			form.loginPw.value = form.loginPw.value.trim();
			
			if(form.loginPwConfirm.value.length > 0){
				form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
				
				if(form.loginPwConfirm.value.length == 0){
					alert('비밀번호 확인을 입력해주세요.');
					form.loginPwConfirm.focus();
					
					return;
				}
			}
			
			if(form.loginPw.value != form.loginPwConfirm.value){
				alert('비밀번호가 일치하지 않습니다.');
				form.loginPw.focus();
				
				return;
			}
			
			form.name.value = form.name.value.trim();
			
			if(form.name.value.length == 0){
				alert('이름을 입력해주세요.');
				form.name.focus();
				
				return;
			}
			
			form.nickname.value = form.nickname.value.trim();
			
			if(form.nickname.value.length == 0){
				alert('닉네임을 입력해주세요.');
				form.nickname.focus();
				
				return;
			}
			
			form.cellphoneNum.value = form.cellphoneNum.value.trim();
			
			if(form.cellphoneNum.value.length == 0){
				alert('전화번호를 입력해주세요.');
				form.cellphoneNum.focus();
				
				return;
			}
			
			form.email.value = form.email.value.trim();
			
			if(form.email.value.length == 0){
				alert('이메일을 입력해주세요.');
				form.email.focus();
				
				return;
			}
			
			
			MemberModify__submitDone = true;
			form.submit();
		}
	</script>

<%@ include file="../common/foot.jspf" %>