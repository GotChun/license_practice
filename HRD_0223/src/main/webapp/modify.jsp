<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<script type="text/javascript" src="check.js"></script>

	<section
		style="position: fixed; top: 100px; left: 0; background-color: lightgray; height: 100%; width: 100%;">
		<h2 style="text-align: center;">홈쇼핑 회원 정보 수정</h2>
		<form action="action.jsp" name="frm" method="post"
			style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<input type="hidden" name="mode" value="modify">
			<table border="1">
				<%
				request.setCharacterEncoding("UTF-8");
				String custno = "";
				String custname = "";
				String phone = "";
				String address = "";
				String joindate = "";
				String grade = "";
				String city = "";
				String transDate = "";
				try {
					custno = request.getParameter("mod_custno");
					String sql = "select * from member_tbl_02 where custno=?";
					Connection conn = Util.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, custno);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					custname = rs.getString(2);
					phone = rs.getString(3);
					address = rs.getString(4);
					joindate = rs.getString(5);
					grade = rs.getString(6);
					city = rs.getString(7);
					transDate = joindate.replace("-", "");
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=custno%>"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value=<%=custname%>></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value=<%=phone%>></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value=<%=address%>></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value=<%=transDate%>></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade" value=<%=grade%>></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value=<%=city%>></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정"
						onclick="return modify()"> <input type="button" value="조회"
						onclick="return search()"></td>
				</tr>
			</table>
		</form>

	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>