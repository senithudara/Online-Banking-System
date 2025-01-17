package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//mapping the webservlet url
@WebServlet("/staffloginForm")
public class staffLogin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String myuid = req.getParameter("uid2");
		String mypass = req.getParameter("pass2");
		
		try {
			
			//establish database connection

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
			
			//retrieving users' account details from the table
			PreparedStatement ps = con.prepareStatement("select * from staffdata where username=? and password=?");
			ps.setString(1, myuid);
			ps.setString(2, mypass);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{				
				HttpSession session = req.getSession();
				session.setAttribute("session_name", rs.getString("name"));
				
				RequestDispatcher rd = req.getRequestDispatcher("/staffdashboard.jsp");
				rd.include(req, resp);
				
			}
			else {
				
				out.print("<h3>Invalid Username or Password</h3>");
				
				RequestDispatcher rd = req.getRequestDispatcher("/stafflogin.jsp");
				rd.include(req, resp);
			}
		}
		//exception handling

		catch(Exception e) {
			
			e.printStackTrace();
			
			out.print("<h3> "+e.getMessage()+"</h3>");
			
			RequestDispatcher rd = req.getRequestDispatcher("/stafflogin.jsp");
			rd.include(req, resp);
		}
		
	}

}
