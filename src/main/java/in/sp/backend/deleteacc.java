package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//mapping the webservlet url
@WebServlet("/deleteaccount")
public class deleteacc extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		PrintWriter out = resp.getWriter();
		
		//get input values from the delete confirmation form
		String password = req.getParameter("pwd");

		//assign the value of the session into a variable
		HttpSession session = req.getSession();
		String myaccno = (String) session.getAttribute("session_name5");
		
		
		try {
			//establish database connection

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
			
			PreparedStatement ps = con.prepareStatement("delete from register where password=?");
			ps.setString(1, password);

			
			int count = ps.executeUpdate();
			if (count > 0) {
				
				resp.setContentType("text/html");
				out.print("<h3>User deleted successfully</h3>");	
				
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.include(req, resp);
						
			}
			
			else {
				
				resp.setContentType("text/html");
				out.print("<h3>User not registered due to error</h3>");
				
				RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
				rd.include(req, resp);
				
			}
		}
		//exception handling

		catch(Exception e)
		{
			e.printStackTrace();
			
			resp.setContentType("text/html");
			out.print("<h3> Exception Occured: "+e.getMessage()+" </h3>");
			
			RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
			rd.include(req, resp);
			
		}
	}
}
