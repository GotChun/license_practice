<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section
		style="position: fixed; top: 100px; left: 0; background-color: lightgray; height: 100%; width: 100%;">
		<h2 style="text-align: center;">회원매출조회</h2>
		<form action=""
			style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>고객등급</td>
					<td>매출</td>
				</tr>
				<%
				try{
					Connection conn = Util.getConnection();
					String sql = "select mt.custno,mt.custname,mt.grade,sum(price) price from member_tbl_02 mt, money_tbl_02 mo where mt.custno = mo.custno group by mt.custno,mt.custname,mt.grade order by price desc";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){	
				%>
				<tr>
				<td><%=rs.getString(1) %> </td>
				<td><%=rs.getString(2) %> </td>
				<td><%=rs.getString(3) %> </td>
				<td><%=rs.getString(4) %> </td>
				</tr>
				<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				%>
			</table>
		</form>

	</section>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>