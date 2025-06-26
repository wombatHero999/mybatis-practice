<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	padding: 2rem;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="mb-4">MyBatis 실습문제 1</h1>

		<h3>1. 회원 전체 조회</h3>
		<br>
		<div class="mb-3">
			<button id="btnSelectAll" class="btn btn-primary">회원 전체 조회</button>
		</div>
		<br>
		<hr>
		<h3>2. 회원 ID 기반 검색</h3>
		<br>
		<div class="mb-4">
			<form id="searchFormById" class="d-flex" onsubmit="return false;">
				<input type="text" class="form-control me-2" id="searchId"
					placeholder="회원 ID 입력">
				<button id="btnSearchById" class="btn btn-warning">ID로 검색</button>
			</form>
		</div>
		<br>
		<hr>

		<h3>3. 회원 등록</h3>
		<br>
		<div class="mb-4">
			<form action="member/insertMember" method="post" class="row g-3">
				<div class="col-md-4">
					<label class="form-label">아이디</label> <input type="text"
						class="form-control" name="userId" required>
				</div>
				<div class="col-md-4">
					<label class="form-label">비밀번호</label> <input type="password"
						class="form-control" name="userPwd" required>
				</div>
				<div class="col-md-4">
					<label class="form-label">이름</label> <input type="text"
						class="form-control" name="userName" required>
				</div>
				<div class="col-md-6">
					<label class="form-label">이메일</label> <input type="email"
						class="form-control" name="email">
				</div>
				<div class="col-12">
					<button type="submit" class="btn btn-success">회원 등록</button>
				</div>
			</form>
		</div>
		<br>
		<hr>
		<h3>4. 회원 이름 기반 검색</h3>
		<br>
		<div class="mb-4">
			<form id="searchForm" class="d-flex" onsubmit="return false;">
				<input type="text" class="form-control me-2" id="searchName"
					placeholder="회원 이름 입력">
				<button id="btnSearch" class="btn btn-secondary">검색</button>
			</form>
		</div>
		<br>
		<hr>
		<br>
		<!-- 비동기 결과 출력 영역 -->
		<div id="resultArea" class="mt-5">
			<h4>조회 결과</h4>
			<div class="border p-3" style="min-height: 100px;">
				<!-- AJAX 결과가 이곳에 삽입됨 -->
			</div>
		</div>
	</div>

	<div class="mb-4">
		<div class="p-3" style="min-height: 100px;">
			<a href="board/selectAllBoard">MyBatis 실습문제 2번 >>></a>
		</div>
	</div>
	<!-- 비동기 처리 스크립트-->
	<script>
		// 전체 회원 조회
		$("#btnSelectAll").click(
				function() {
					$.ajax({
						url : "member/selectAll",
						success : function(data) {
							displayData(data);
						},
						error : function() {
							$("#resultArea div").html(
									"<p class='text-danger'>전체 조회 실패</p>");
						}
					});
				});

		$("#btnSearchById").click(
				function() {
					const userId = $("#searchId").val();
					$.ajax({
						url : "member/searchById",
						data : {
							userId : userId
						},
						success : function(data) {
							displayData(data);
						},
						error : function() {
							$("#resultArea div").html(
									"<p class='text-danger'>ID 검색 실패</p>");
						}
					});
				});

		$("#btnSearch").click(
				function() {
					const name = $("#searchName").val();
					$.ajax({
						url : "member/searchMember",
						data : {
							searchName : name
						},
						success : function(data) {
							displayData(data);
						},
						error : function() {
							$("#resultArea div").html(
									"<p class='text-danger'>검색 실패</p>");
						}
					});
				});
		function displayData(data){
			const $resultDiv = $("#resultArea div");
			$resultDiv.empty(); // 기존 내용 비우기

			// 배열인지 아닌지 판단
			if (Array.isArray(data)) {
				if (data.length === 0) {
					$resultDiv.html("<p>조회된 데이터가 없습니다.</p>");
					return;
				}

				// 배열: 각 객체 출력
				let html = '';
				data.forEach(obj => {
					html += "<ul class='list-group mb-3'>";
					for (let key in obj) {
						html += `<li class='list-group-item'><strong>\${key}</strong>: \${obj[key]}</li>`;
					}
					html += "</ul>";
				});
				$resultDiv.html(html);
			} else if (typeof data === 'object' && data !== null) {
				// 단일 객체
				let html = "<ul class='list-group'>";
				for (let key in data) {
					html += `<li class='list-group-item'><strong>\${key}</strong>: \${data[key]}</li>`;
				}
				html += "</ul>";
				$resultDiv.html(html);
			} else {
				// null 또는 기타 타입
				$resultDiv.html("<p class='text-warning'>표시할 수 있는 데이터가 없습니다.</p>");
			}
		}
	</script>

</body>
</html>
