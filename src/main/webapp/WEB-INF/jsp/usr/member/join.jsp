<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="JOIN"/>
<%@ include file="../common/head.jspf" %>
<%@ page import="com.kpk.exam.demo.util.Ut" %>

<!-- lodash debounce -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

<section class="mt-8">
	<div class="container mx-auto px-3 text-xl">
		<form onsubmit="submitJoinForm(this); return false;" class="table-box-type-1" method="post" action="../member/doJoin">
		<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
			<div class="table-box-type-1">
				<table class="table table-zebra w-full">
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								<input onkeyup="debouncedCheckLoginIdDup(this);" class="w-full input input-bordered" type="text" name="loginId" placeholder="아이디를 입력해주세요."  autocomplete="off"/>
								<div class="loginId-msg"></div>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="w-full input input-bordered" type="password" name="loginPw" placeholder="비밀번호를 입력해주세요." /></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input class="w-full input input-bordered" type="password" name="loginPwConfirm" placeholder="비밀번호를 입력해주세요." /></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="w-full input input-bordered" type="text" name="name" placeholder="이름을 입력해주세요." /></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input class="w-full input input-bordered" type="text" name="nickname" placeholder="닉네임을 입력해주세요." /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="w-full input input-bordered" type="text" name="cellphoneNum" placeholder="전화번호를 입력해주세요." /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input class="w-full input input-bordered" type="text" name="email" placeholder="이메일을 입력해주세요." /></td>
						</tr>
						<tr>
							<th></th>
							<td><button type="submit" class="btn">회원가입</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</form>
	
		<div class="btns mt-3">
			<button class="btn btn-warning" type="button" onclick="history.back();">뒤로가기</button>
		</div>
		
	</div>
</section>

<script>
	let validLoginId = "";

	let submitJoinFormDone = false;

	function checkLoginIdDup(el){
		const form = $(el).closest("form").get(0);
		
		if (form.loginId.value.length == 0){
			validLoginId = "";
			return;
		}
		if (validLoginId == form.loginId.value){
			return;
		}
		
		$(".loginId-msg").html('<div class="mt-2">확인중...</div>');
		
		$.get("../member/getLoginIdDup", {
			isAjax : "Y",
			loginId :form.loginId.value
		},function(data){
			$(".loginId-msg").html("<div class='mt-2'>" + data.msg + "</div>");
			if(data.success) {
				validLoginId = data.data1;
			}else {
				validLoginId = "";
			}
			
			if (data.resultCode == "F-B"){
				alert(data.msg);
				location.replace("/");
			}
		},"json");
	}
	
	const debouncedCheckLoginIdDup = _.debounce(checkLoginIdDup, 300);

	function submitJoinForm(form){
		if(submitJoinFormDone){
			alert('처리중 입니다.');
			return;
		}
		
		form.loginId.value = form.loginId.value.trim();
		
		if(form.loginId.value.length == 0){
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		
		if(form.loginId.value != validLoginId){
			alert('사용할 수 없는 아이디입니다.');
			form.loginId.focus();
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
		
		if(form.loginPw.value.length == 0){
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return;
		}
		
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
		
		form.submit();
		
		submitJoinFormDone = true;
	}
</script>

<%@ include file="../common/foot.jspf" %>