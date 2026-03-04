<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록조회</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
	String url = "jdbc:oracle:thin:@//localhost:1521/orcl";
	String user = "green";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "SELECT "
	           + "TSHOP.SHOPNO AS SHOPNO, "
	           + "TSHOP.SHOPNAME AS SHOPNAME, "
	           + "SUBSTR(TORD.ORDERNO,1,4) || '-' || SUBSTR(TORD.ORDERNO,5,4) AS ORDERNO, "
	           + "TO_CHAR(TO_DATE(TORD.ORDERDATE, 'YYYYMMDD'), 'YYYY-MM-DD') AS ORDERDATE, "
	           + "TPRD.PCODE AS PCODE, "
	           + "TPRD.PNAME AS PNAME, "
	           + "TORD.AMOUNT AS AMOUNT, "
	           + "TO_CHAR(TPRD.COST, 'FM999,999') AS COST, "
	           + "TO_CHAR(TORD.AMOUNT * TPRD.COST, 'FM999,999') AS TOTAL_PRICE, "
	           + "TO_CHAR(TORD.AMOUNT * TPRD.COST * (100 - TSHOP.DISCOUNT) / 100, 'FM999,999,999') AS DISCOUNT_PRICE "
	           + "FROM TBL_ORDER_202101 TORD "
	           + "JOIN TBL_SHOP_202101 TSHOP ON TORD.SHOPNO = TSHOP.SHOPNO "
	           + "JOIN TBL_PRODUCT_202101 TPRD ON TORD.PCODE = TPRD.PCODE "
	           + "ORDER BY TORD.ORDERNO ASC";
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pw);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>

	<%@ include file="header.jsp" %>

	<section id="orders_section">
		<div id="orders_view">
			<h1>주문 목록</h1>
			<table>
				<tr>
					<th>할인점코드</th>
					<th>점포명</th>
					<th>주문번호</th>
					<th>주문일자</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>주문수량</th>
					<th>단가</th>
					<th>소비자가격</th>
					<th>할인가격</th>
				</tr>
				<% while(rs.next()){ %>
				<tr>
					<td><%= rs.getString("SHOPNO") %></td>
					<td><%= rs.getString("SHOPNAME") %></td>
					<td><%= rs.getString("ORDERNO") %></td>
					<td><%= rs.getString("ORDERDATE") %></td>
					<td><%= rs.getString("PCODE") %></td>
					<td><%= rs.getString("PNAME") %></td>
					<td><%= rs.getInt("AMOUNT") %></td>
					<td><%= rs.getString("COST") %></td>
					<td><%= rs.getString("TOTAL_PRICE") %></td>
					<td><%= rs.getString("DISCOUNT_PRICE") %></td>
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
		</div>
	</section>
	
	<%@ include file="footer.jsp" %>
</body>
</html>