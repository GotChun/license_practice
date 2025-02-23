<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<script type="text/javascript" src="check.js"></script>
	<section
		style="position: fixed; top: 100px; left: 0; background-color: lightgray; height: 100%; width: 100%;">
		<h2 style="text-align: center;">홈쇼핑 회원 등록</h2>
		<%
		request.setCharacterEncoding("UTF-8");
		try {
			String sql = "select max(custno)+1 from member_tbl_02";
			Connection conn = Util.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
		%>

		<form action="action.jsp" name="frm" method="post"
			style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<input type="hidden" name="mode" value="insert">
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno"
						value=<%=rs.getString(1)%>></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"
						onclick="return add()"> <input type="button" value="조회"
						onclick="return search()"></td>
				</tr>
			</table>
		</form>
		<%
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>