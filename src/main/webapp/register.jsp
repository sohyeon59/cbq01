<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/register.css">
<head>
<meta charset="UTF-8">
<title>주문등록</title>

</head>
<body>

<section>
	<h1>주문 등록</h1>
		<table border="1">
			<tr>
				<td>주문번호</td>
				<td><input type="text" id="orderno"></td>				
			</tr>
			<tr>
				<td>주문점포</td>
				<td>
					<select id="shopno" required>
						<option value="" disabled selected>점포선택</option>
						<option value="S001">AA 할인점</option>
						<option value="S002">BB 할인점</option>
						<option value="S003">CC 할인점</option>
						<option value="S004">DD 할인점</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>주문일자</td>
				<td><input type="text" id="orderdate"></td>
			</tr>
			<tr>
				<td>제품코드</td>
				<td>
					<select id="pcode" required>
						<option value="" disabled selected>코드선택</option>
						<option value="AA01">AA01</option>
						<option value="AA02">AA02</option>
						<option value="AA03">AA03</option>
						<option value="AA04">AA04</option>
						<option value="AA05">AA05</option>
						<option value="AA06">AA06</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>주문수량</td>
				<td><input type="text" id="amount"></td>
			</tr>
			<tr>
				<td colspan = 2>
				<button id="regbtn" onclick="register()">주문등록</button>
				<button id="resetbtn" onclick="location.href='register.jsp'">다시쓰기</button></td>
			</tr>
			
		
		</table>
	
	
	</section>
	<%@ include file="footer.jsp" %>
<script>
	function register(){
		const orderno = document.getElementById("orderno");
		const shopno = document.getElementById("shopno");
		const orderdate = document.getElementById("orderdate");
		const pcode = document.getElementById("pcode");
		const amount = document.getElementById("amount");
		const send = "orderno=" + orderno.value + "&shopno=" + shopno.value + "&orderdate=" + orderdate.value + "&pcode=" + pcode.value + "&amount=" + amount.value;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onload = function(){
			
			if(orderno.value == ""){
				alert("주문번호가 입력되지 않았습니다!");
				console.log("오류");
				orderno.focus();
			}else if(shopno.value == ""){
				alert("주문점포가 선택되지 않았습니다!");
				shopno.focus();
			}else if(orderdate.value == ""){
				alert("주문일자가 입력되지 않았습니다!");
				orderdate.focus();
			}else if(pcode.value == ""){
				alert("제품코드가 선택되지 않았습니다!");
				pcode.focus();
			}else if(amount.value == ""){
				alert("주문수량이 입력되지 않았습니다!");
				amount.focus();
			}else{
				alert("주문등록이 정상적으로 등록 되었습니다!");
				location.href='register.jsp';
			}
		}
		
		xhr.open("GET", "register?" + send);
		xhr.send();
		
	}

</script>


</body>
</html>