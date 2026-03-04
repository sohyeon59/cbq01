package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("연결됨");
		
		String orderno = request.getParameter("orderno");
		String shopno = request.getParameter("shopno");
		String orderdate = request.getParameter("orderdate");
		String pcode = request.getParameter("pcode");
		Integer amount = Integer.parseInt(request.getParameter("amount"));
		
		
		String url = "jdbc:oracle:thin:@//localhost:1521/testdb";
		String user = "green";
		String password = "1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			String sql = "Insert into TBL_0RDER_202101 value (?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderno);
			pstmt.setString(2, shopno);
			pstmt.setString(3, orderdate);
			pstmt.setString(4, pcode);
			pstmt.setInt(5, amount);
					
			int result = pstmt.executeUpdate();
			System.out.println(result + "건 등록 완료");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("연결 실패");
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


}
