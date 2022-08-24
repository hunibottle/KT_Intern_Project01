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
		<h1 class="page-header">담당자 정보</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">담당자 소개</div>
			<div class="panel-body">
				<form>
					<div class="form-group">
						<label>이름 및 직책</label>
						<input class="form-control" name='name' value="${list[0].USER_NAME}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>전화번호</label>
						<input class="form-control" name='phonenum' value="${list[0].USER_PHONE}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>업무 상세 내용</label>
						<input class="form-control" name='content' value="${list[0].WORK_CONTENT}" readonly="readonly">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
