

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;


public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/eshopper";
		String user = "root";
		String mysqlPassword = "password";

		String name = request.getParameter("name");
		String password = request.getParameter("password");

		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,mysqlPassword);
			Statement st = con.createStatement();
			ResultSet result = st.executeQuery("select Name, Password from users where Name='"+ name +"' and Password='"+ password +"'");
			
				if(result.next()) {
					session.setAttribute("user", name);
					response.sendRedirect("home.jsp");
				} else {
					response.sendRedirect("login.jsp");
				}
			
		}
		catch(Exception e) {
			pw.println(e);
		}

	}

}
