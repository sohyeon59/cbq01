<h2>Team Project - git수업</h2>
<hr>

<h3>페이지 이름 협의점</h3>
<ul>
  <li>헤더 header.jsp </li>
  <li>홈 index.jsp</li>
  <li>주문등록 register.jsp</li>
  <li>주문목록조회 orders.jsp</li>
  <li>점포별주문현황 store.jsp</li>
  <li>제품코드조회 product.jsp</li>
</ul>
<hr>

<h3>파일 협의점</h3>
<h4>css파일은 css폴더에, jsp랑 같은 이름으로 !!</h4>
<h4>ex) index.jsp / index.css</h4>
<hr>

<h3>header, footer 협의점</h3>
<ul>
  <li>HEADER: <%@ include file="header.jsp" %></li>
  <li>FOOTER: <%@ include file="footer.jsp" %></li>
</ul>
<hr>

<h2>주의!! 이 문장 꼭 확인하고 사용할 것!</h2>
<h3>DB문 사용 시 유의할 점</h3>
<p>장진우(Cherta4242) -> jdbc:oracle:thin:@//localhost:1521/orcl  -> 'orcl' 사용</p>  
<p>다른 팀원 -> jdbc:oracle:thin:@//localhost:1521/testdb  ->  'testdb' 사용</p>
