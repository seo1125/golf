<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<% 
	String sql = " select "
		+ " teacher_code 강사코드, "
		+ " teacher_name 강사명, "
		+ " class_name 강의명, "
		+ " to_char(class_price, 'l999,999,999') 수강료, "
		+ " substr(teach_resist_date, 1, 4)||'년'||substr(teach_resist_date, 5, 2)||'월'||substr(teach_resist_date, 8, 2)||'일' 강사자격취득일 "
		+ " from tbl_teacher_202201 ";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.0.0">
</head>
<body>
	<footer>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</footer>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main class="section">
		<h2 id="title"><b>강사조회</b></h2>
		<table class="table_line">
			<tr>
				<th>강사코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>수강료</th>
				<th>강사자격취득일</th>
			</tr>
			<%
				while(rs.next()) {
			%>
				<tr>
					<td style="text-align: center"><%= rs.getString("강사코드") %></td>
					<td><%= rs.getString("강사명") %></td>
					<td><%= rs.getString("강의명") %></td>
					<td><%= rs.getString("수강료") %></td>
					<td><%= rs.getString("강사자격취득일") %></td>
				</tr>
			<%
				}
			%>
		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>