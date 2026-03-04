<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포별 주문현황</title>
<link rel="stylesheet" href="css/store.css">
</head>
<body>
<%
	String url = "jdbc:oracle:thin:@//localhost:1521/orcl";
	String user = "green";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "SELECT TSHOP.SHOPNO AS SHOPNO, TPRD.PCODE AS PCODE, TPRD.PNAME AS PNAME,"
				+ "SUM(TORD.AMOUNT) AS TOTAL_AMOUNT "
				+ "FROM tbl_order_202101 TORD "
				+ "JOIN tbl_shop_202101 TSHOP ON TORD.shopno = TSHOP.shopno "
				+ "JOIN tbl_product_202101 TPRD ON TORD.pcode = TPRD.pcode "
				+ "GROUP BY TPRD.pname, TPRD.pcode, TSHOP.shopno "
				+ "ORDER BY TSHOP.SHOPNO ASC";
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pw);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
	<%@ include file="header.jsp" %>
	
	<section id="store_section">
			<h1>점포별 주문현황</h1>
			<table>
				<tr>
					<th>할인점코드</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>주문총수량</th>
				</tr>
				<% while(rs.next()){ %>
				<tr>
					<td><%= rs.getString("SHOPNO") %></td>
					<td><%= rs.getString("PCODE") %></td>
					<td><%= rs.getString("PNAME") %></td>
					<td><%= rs.getString("TOTAL_AMOUNT") %></td>
				</tr>
				<% } %>
			</table>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}

%>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>