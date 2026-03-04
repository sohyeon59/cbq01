<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품코드조회</title>

<style>

section{
    display:flex;
    flex-direction:column;
    align-items:center;
}

table{
    width:600px;
    border-collapse:collapse;
}

th, td{
    padding:8px;
    text-align:center;
}

</style>

</head>
<body>

<%@ include file="header.jsp" %>

<section>

<h2>제품코드조회</h2>

<table border="1">

<tr>
<th>제품코드</th>
<th>제품명</th>
<th>단가</th>
<th>할인율(10%)</th>
<th>할인율(15%)</th>
</tr>

<%

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = DriverManager.getConnection(
"jdbc:oracle:thin:@//localhost:1521/testdb",
"green",
"1234"
);

PreparedStatement ps = conn.prepareStatement(
"SELECT PCODE, PNAME, "+
"TO_CHAR(COST,'FM999,999'), "+
"TO_CHAR(COST*0.9,'FM999,999'), "+
"TO_CHAR(COST*0.85,'FM999,999') "+
"FROM TBL_PRODUCT_202101 ORDER BY PCODE"
);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
</tr>

<%
}

rs.close();
ps.close();
conn.close();

%>

</table>

</section>

</body>
</html>