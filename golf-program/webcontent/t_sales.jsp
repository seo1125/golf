<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<% 
	String sql = " select "
		+ " teacher.teacher_code 강사코드, "
		+ " teacher.class_name 강의명, "
		+ " teacher.teacher_name 강사명, "
		+ " to_char(sum(class.tuition), 'l999,999,999') 총매출 "
		+ " from tbl_teacher_202201 teacher, tbl_class_202201 class "
		+ " where teacher.teacher_code = class.teacher_code "
		+ " group by teacher.teacher_code, teacher.teacher_name, teacher.class_name "
		+ " order by teacher.teacher_code "; 

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="./css/style.css?ver2.2">
</head>
<body>
	<footer>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</footer>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main class="section">
		<h2 id="title"><b>강사매출현황</b></h2>
		<table class="table_line">
			<tr>
				<th>강사코드</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>총매출</th>
			</tr>
			<%
				while(rs.next()) {
			%>
				<tr>
					<td style="text-align: center"><%= rs.getString("강사코드") %></td>
					<td><%= rs.getString("강의명") %></td>
					<td style="text-align: right;"><%= rs.getString("강사명") %></td>
					<td style="text-align: right;"><%= rs.getString("총매출") %></td>

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