<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	padding: 2rem;
}
.board-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="mb-4">MyBatis 실습문제 2</h1>

		<h2>게시판 전체 조회</h2>
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list}">
					<tr onclick="displayBoard(${board.boardNo})" style="cursor:pointer;">
						<td>${board.boardNo}</td>						
						<td>${board.boardTitle}</td>
						<td>${board.userName}</td>
						<td>${board.createDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="search" method="get" class="row g-2 align-items-center mb-4">
			<div class="col-auto">
				<select name="searchKey" class="form-select">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="userName">작성자</option>
				</select>
			</div>
			<div class="col-auto">
				<input type="text" name="searchValue" class="form-control" placeholder="검색어 입력">
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</form>
		
		<div id="resultArea" class="mt-5">
			<h4>조회 결과</h4>
			<div class="border p-3" style="min-height: 100px;">
				<!-- AJAX 결과 삽입 -->
			</div>
		</div>
	</div>
	
	<a href="../index.jsp"> &lt;&lt;&lt; 이전 문제 </a>

	<script>
		function displayBoard(boardNo) {
			$.ajax({
				url : "selectBoard", // 따옴표 오류 수정
				method : "GET",
				data : { boardNo: boardNo },
				success : function(data) {
					// 데이터가 게시판 + 댓글 목록인 경우 처리
					let html = "";

					// 게시판 정보 출력
					html += `<h5>제목: \${data.boardTitle}</h5>`;
					html += `<p>작성자: \${data.userName}</p>`;
					html += `<p>내용: \${data.boardContent}</p>`;
					html += `<hr>`;
					
					// 댓글 출력
					if (data.replyList && data.replyList.length > 0) {
						html += "<h6>댓글 목록</h6><ul>";
						data.replyList.forEach(function(reply) {
							html += `<li><strong>\${reply.userName}:</strong> \${reply.replyContent} <small>(\${reply.createDate})</small></li>`;
						});
						html += "</ul>";
					} else {
						html += "<p class='text-muted'>댓글이 없습니다.</p>";
					}
					
					$("#resultArea div").html(html);
				},
				error : function() {
					$("#resultArea div").html("<p class='text-danger'>게시글 조회 실패</p>");
				}
			});
		}
	</script>
</body>
</html>
