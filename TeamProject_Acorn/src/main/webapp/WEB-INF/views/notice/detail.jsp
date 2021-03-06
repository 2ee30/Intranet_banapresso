<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>

/* 글 내용안에 있는 이미지의 크기 제한 */
.content img{
	max-width: 100%;
}
/* 댓글에 관련된 css */
.comments ul{
	padding: 0;
	margin: 0;
	list-style-type: none;
}
.comments ul li{
	border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
}
.comments dt{
	margin-top: 5px;
}
.comments dd{
	margin-left: 26px;
}
.comments form textarea, .comments form button{
	float: left;
}
.comments li{
	clear: left;
}
.comments form textarea{
	width: 85%;
	height: 100px;
}
.comments form button{
	width: 15%;
	height: 100px;
}
/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
.comment form{
	display: none;
}
.comment{
	position: relative;
}
.comment .reply_icon{
	width: 8px;
	height: 8px;
	position: absolute;
	top: 10px;
	left: 30px;
}
.comments .user-img{
	width: 20px;
	height: 20px;
	border-radius: 50%;
}
.btn-primary{
background-color:#F1648A;
border:0;
outline:0;
}
.btn-primary:disabled{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-primary:hover{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-primary:focus, .btn-primary.focus {
	color: #fff;
	background-color: #F1648A;
	border: 0;
	box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
.show > .btn-primary.dropdown-toggle {
  color: #fff;
  background-color: #F1648A;
  border-color: #F1A4BA;
}
.btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
.show > .btn-primary.dropdown-toggle:focus {
  box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.page-link {
  color: #F1648A;
  border: 1px solid #F1A4BA;
}
.page-link:hover {
  color: #F1648A;
  background-color: #F1A4BA;
  border-color: #F1A4BA;
}
.page-item.active .page-link {
  color: #fff;
  background-color: #F1648A;
  border-color: #F1A4BA;
}
.page-item.disabled .page-link {
  border-color: #F1A4BA;
}
.btn-group .btn-secondary{
	background-color:#F1648A;
	border:0;
	outline:0;
}
.btn-group .btn-secondary:hover{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-group .btn-secondary:focus, .btn-group .btn-secondary.focus {
	color: #fff;
	background-color: #F1648A;
	border: 0;
	box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.btn-group .btn-secondary:not(:disabled):not(.disabled):active, .btn-group .btn-secondary:not(:disabled):not(.disabled).active{
  color: #fff;
  background-color: #F1648A;
  border-color: #F1A4BA;
}
.btn-group .btn-secondary:not(:disabled):not(.disabled):active:focus, .btn-group .btn-secondary:not(:disabled):not(.disabled).active:focus{
  box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.table-bordered th,
.table-bordered td {
  	border: 2px solid #F1A4BA !important;
}
</style>
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="notice" name="category"/>
</jsp:include>
</head>
<body>

<div class="container">

	<c:if test="${not empty keyword }">
		<p> <strong>${keyword }</strong> 검색어로 검색된
		결과 자세히 보기 입니다.</p>
	</c:if>
	<div style="margin-bottom:0.5rem;">
		<c:choose>
			<c:when test="${dto.prevNum ne 0 }">
				<a href="detail.go?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}" class="btn btn-primary btn-sm">이전글</a>
			</c:when>
			<c:otherwise>
				<button disabled="disabled" class="btn btn-primary btn-sm">이전글</button>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${dto.nextNum ne 0 }">
				<a href="detail.go?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}" class="btn btn-primary btn-sm">다음글</a>
			</c:when>
			<c:otherwise>
				<button disabled="disabled" class="btn btn-primary btn-sm">다음글</button>
			</c:otherwise>
		</c:choose>
	</div>
	<table class="table table-bordered table-sm">
		<colgroup>
			<col class="col-xs-4"/>
			<col class="col-xs-8"/>
		</colgroup>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
			<th>등록일</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="4">${dto.content }</td>
		</tr>
	</table>
	
	<div class="btn-group btn-group-sm float-right" role="group" aria-label="..." style="margin-top:0.7rem;">
		<a href="list.go" class="btn btn-secondary btn-sm">목록</a>
		<c:if test="${not empty isAdmin}">
			<a href="updateform.go?num=${dto.num }" class="btn btn-secondary btn-sm">수정</a>
			<a href="javascript:deleteConfirm()" class="btn btn-secondary btn-sm">삭제</a>
		</c:if>
	</div>
	
</div>
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<script>
function deleteConfirm(){
	swal({
		  title: "삭제 하시겠습니까?",
		  text: "글을 삭제하시면 복구 하실 수 없습니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    location.href="delete.go?num=${dto.num}";
		  } else {
		    swal("삭제를 취소 하셨습니다.");
		  }
		});
}
</script>
</body>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</html>
