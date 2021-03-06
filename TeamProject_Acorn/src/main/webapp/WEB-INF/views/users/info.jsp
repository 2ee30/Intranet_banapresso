<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<jsp:include page="../include/resource_boot4.jsp"/>
<style>
	h1{color: #F1648A;}
	#profileLink img{
		width: 60px;
		height: 60px;
		border-radius: 50%;
	}
	#profileForm{
		display: none;
	}
	table{
		width: 100%;
	}
	th, td {
		padding: 20px;
		border: 2px solid #F1648A;
	}
	th{
		font-weight: bold;
	    border-left: 8px solid #F1648A;
	}
	td{
		text-align: center;
	}
	a{
		color:#F1648A;
	}
</style>

<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="users" name="category"/>
</jsp:include>
</head>
<body>
<div class="container">
	<h1>개인 정보 페이지</h1> 
	<p>개인 정보를 열람 및 수정할 수 있는 페이지입니다. 계정 삭제를 원하시는 경우, 관리자에게 문의하시기 바랍니다.</p> <br/><br/>
	
	<table>
		<tr>
			<th scope="row">아이디</th>
			<td>${dto.userid }</td>
		</tr>
		<tr>
			<th scope="row">프로필 이미지</th>
			<td>
				<a href="javascript:" id="profileLink">
					<c:choose>
						<c:when test="${empty dto.profile }">
							<img src="${pageContext.request.contextPath }/resources/images/bana_logo_4.png"/>
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }${dto.profile}"/>
						</c:otherwise>
					</c:choose>
				</a>
			</td>
		</tr>
		<tr>
			<th scope="row">비밀번호</th>
			<td><a href="pwd_updateform.go">수정하기</a></td>
		</tr>
		<tr>
			<th scope="row">이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th scope="row">입사일</th>
			<td>${dto.hdate }</td>
		</tr>
		<tr>
			<th scope="row">내가 작성한 글</th>
			<td><a href="${pageContext.request.contextPath }/board/list.go?condition=writer&keyword=${dto.userid }">목록 보기</a></td>
		</tr>
		<tr>
			<th scope="row">내가 업로드한 파일</th>
			<td><a href="${pageContext.request.contextPath }/file/list.go?condition=writer&keyword=${dto.userid }">목록 보기</a></td>
		</tr>
	</table>
</div>

<form action="profile_upload.go" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage"
		accept=".jpg, .jpeg, .png, .JPG, .JPEG, .PNG"/>
</form>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	$("#profileLink").click(function(){
		$("#profileImage").click();
	});
	$("#profileImage").on("change", function(){
		$("#profileForm").submit();
	});
	
	$("#profileForm").ajaxForm(function(responseData){
		console.log(responseData);
		var src="${pageContext.request.contextPath }"+responseData.savedPath;
		$("#profileLink img").attr("src", src);
	});
	
</script>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>