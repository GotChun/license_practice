<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section
		style="position: fixed; top: 100px; left: 0; background-color: lightgray; height: 100%; width: 100%;">
		<h2 style="text-align: center;">회원목록조회/수정</h2>

		<form action=""
			style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try {
					String sql = "select * from member_tbl_02 order by custno";
					Connection conn = Util.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
						String grade = rs.getString(6);
						String gradeName = "";
						if (grade.equals("A")) {
					gradeName = "VIP";
						} else if (grade.equals("B")) {
					gradeName = "일반";
						} else if (grade.equals("C")) {
					gradeName = "직원";
						}
					String mod_custno = rs.getString(1);
				%>
				<tr>
					<td><a href="modify.jsp?mod_custno=<%=mod_custno %>"><%=rs.getString(1)%></a></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getDate(5)%></td>
					<td><%=gradeName%></td>
					<td><%=rs.getString(7)%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>