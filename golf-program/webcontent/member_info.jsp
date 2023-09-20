<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<% 
	String sql = " select "
		+ " substr(class.resist_month, 1, 4) || '년' || substr(class.resist_month, 5, 2) || '월' 수강월, "
		+ " member.c_no 회원번호, "
		+ " member.c_name 회원명, "
		+ " teacher.class_name 강의명, "
		+ " class.class_area 강의장소, "
		+ " to_char(teacher.class_price, 'l999,999,999') 수강료, "
		+ " member.grade 등급 "
		+ " from tbl_member_202201 member, tbl_class_202201 class, tbl_teacher_202201 teacher "
		+ " where member.c_no = class.c_no and teacher.teacher_code = class.teacher_code "
		+ " order by member.c_no asc "; 

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
		<h2 id="title"><b>회원정보조회</b></h2>
		<table class="table_line">
			<tr>
				<th>수강월</th>
				<th>회원번호</th>
				<th>회원명</th>
				<th>강의명</th>
				<th>강의장소</th>
				<th>수강료</th>
				<th>등급</th>
			</tr>
			<%
				while(rs.next()) {
			%>
				<tr>
					<td><%= rs.getString("수강월") %></td>
					<td style="text-align: center"><%= rs.getString("회원번호") %></td>
					<td><%= rs.getString("회원명") %></td>
					<td><%= rs.getString("강의명") %></td>
					<td><%= rs.getString("강의장소") %></td>
					<td><%= rs.getString("수강료") %></td>
					<td><%= rs.getString("등급") %></td>
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