<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">담당자 등록</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">담당자 등록</div>
			<div class="panel-body">
				<form method="post" action="insertUser">
					<div class="form-group">
						<label>아이디</label>
						<input type="text" placeholder="사번" class="form-control" name="user_id">
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" placeholder="사번" class="form-control" name="user_pw">
					</div>
					<div class="form-group">
						<label>이름</label>
						<input type="text" placeholder="이름" class="form-control" name="user_name">
					</div>
					<div class="form-group">
						<label>부서</label>
						<input type="text" placeholder="부서" class="form-control" name="user_department">
					</div>
					<div class="form-group">
						<label>분류</label>
						<input type="text" placeholder="분류" class="form-control" name="user_category">
					</div>
					<div class="form-group">
						<label>업무</label>
						<input type="text" placeholder="업무" class="form-control" name="user_work">
					</div>
					<div class="form-group">
						<label>전화번호</label>
						<input type="text" placeholder="전화번호" class="form-control" name="user_phone">
					</div>
					<div class="form-group">
						<label>등록하기</label>
						<input type="submit" placeholder="전화번호" class="form-control" style="width:50px;">
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
