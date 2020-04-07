<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/view/board/list.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
h1{color: #F1648A;}
thead{background-color: #F1A4BA;}
.table th,
.table td {
	border-top: 1px solid #F1A4BA;
}
.table thead th {
  	border-bottom: 2px solid #F1A4BA;
}
.table td a{
	color:#212529;
}
.table-hover tbody tr:hover {
	background-color: #f5d7e0;
}
.btn-primary{
	background-color:#F1648A;
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
</style>
</head>
<body>
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<div class="container">
	<h1>게시판</h1>
	<p> 자유게시판 입니다.</p> <br/>
	<c:if test="${not empty keyword }">
		<p>
			<strong>${keyword }</strong> 라는 검색어로 
			<strong>${totalRow }</strong> 개의 글이 검색 
			되었습니다.
		</p>
	</c:if>
	<table class="table table-sm table-hover">
		<colgroup>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
			<col class="col-xs-6"/>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목 (댓글수)</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>
					<c:choose>
						<c:when test="${tmp.countComment gt 0}">
							<a href="detail.go?num=${tmp.num }&pageNum=${pageNum}&condition=${condition }&keyword=${encodedKeyword }" style="color:black">${tmp.title }</a>
							<a>(<a style="color:#F1648A">${tmp.countComment}</a>)</a>
						</c:when>
						<c:otherwise>
							<a href="detail.go?num=${tmp.num }&pageNum=${pageNum}&condition=${condition }&keyword=${encodedKeyword }" style="color:black">${tmp.title }</a>
						</c:otherwise>
					</c:choose> 
				</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="text-right">
			<a href="insertform.go" class="btn btn-primary btn-sm">글쓰기  &nbsp;<span class="fas fa-pencil-alt"/></a>
	</div>
	
	<nav aria-label="Search pages">
		<ul class="pagination pagination-sm">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="list.go?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedKeyword }">
						&laquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" 
			end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active"><a class="page-link" href="list.go?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"  href="list.go?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li class="page-item">
					<a class="page-link" href="list.go?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">
						&raquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		</ul>		
	</nav>
	<%-- 글 검색 기능 폼 --%>
	<form action="list.go" method="get">
		<label for="condition">검색 조건</label>
		<select name="condition" id="condition">
			<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if> >제목+내용</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if> >제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if> >작성자</option>
		</select>
		<input type="text" name="keyword" 
			placeholder="키워드를 입력하세요..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form>
</div>
<br/><br/><br/>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>