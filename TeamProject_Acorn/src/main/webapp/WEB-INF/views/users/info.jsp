<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지가 가로 세로 50px 인 원형으로 표시 될수 있도록  */
	#profileLink img{
		width: 50px;
		height: 50px;
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
		border: 1px solid #000000;
	}
	th{
		font-weight: bold;
	    border-left: 8px solid #369;
	}
	
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="container">
	<h1>개인 정보 페이지</h1>
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
							<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg"/>
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
	</table>
</div>

<form action="profile_upload.go" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage"
		accept=".jpg, .jpeg, .png, .JPG, .JPEG, .PNG"/>
</form>
<%-- jquery form  플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면 
	$("#profileLink").click(function(){
		//강제로 <input type="file" /> 을 클릭해서 파일 선택창을 띄우고
		$("#profileImage").click();
	});
	//input type="file" 에 파일이 선택되면 
	$("#profileImage").on("change", function(){
		//폼을 강제 제출하고 
		$("#profileForm").submit();
	});
	
	// jquery form 플러그인의 동작을 이용해서 폼이 ajax 로 제출되도록 한다. 
	$("#profileForm").ajaxForm(function(responseData){
		//responseData 는 plain object 이다.
		//{savedPath:"/upload/저장된이미지파일명"}
		//savedPath 라는 방에 저장된 이미지의 경로가 들어 있다.
		console.log(responseData);
		var src="${pageContext.request.contextPath }"+responseData.savedPath;
		// img 의 src 속성에 반영함으로써 이미지가 업데이트 되도록 한다.
		$("#profileLink img").attr("src", src);
	});
	
</script>
</body>
</html>