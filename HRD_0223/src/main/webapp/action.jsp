<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%
    	request.setCharacterEncoding("UTF-8");
    String mode = request.getParameter("mode");
    
    String custno = request.getParameter("custno");
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    System.out.println(mode + custno);
    switch(mode){
    case "insert":
    	try{
        	Connection conn = Util.getConnection();
           	String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
        	PreparedStatement pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, custno);
        	pstmt.setString(2, custname);
        	pstmt.setString(3, phone);
        	pstmt.setString(4, address);
        	pstmt.setString(5, joindate);
        	pstmt.setString(6, grade);
        	pstmt.setString(7, city);
        	pstmt.executeUpdate();
         	
            // ✅ 회원가입 완료 후 index.jsp로 이동
            response.sendRedirect("index.jsp");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
		break;
    case "modify":
    	try{
        	Connection conn = Util.getConnection();
           	String sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=? ";
        	PreparedStatement pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, custname);
        	pstmt.setString(2, phone);
        	pstmt.setString(3, address);
        	pstmt.setString(4, joindate);
        	pstmt.setString(5, grade);
        	pstmt.setString(6, city);
        	pstmt.setString(7, custno);
        	pstmt.executeUpdate();
         	
            // ✅ 회원가입 완료 후 index.jsp로 이동
            response.sendRedirect("index.jsp");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	break;
    }
    
    %>