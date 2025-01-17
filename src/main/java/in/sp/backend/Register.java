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
@WebServlet("/regForm")
public class Register extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		PrintWriter out = resp.getWriter();
		
		//get input values from the form		
		String myfname = req.getParameter("fname");
		String mylname = req.getParameter("lname");
		String myfullnme = req.getParameter("fullnme");
		String mybdate = req.getParameter("bdate");
		String mynid = req.getParameter("nid");
		String myaccno = req.getParameter("accno");
		String mynum = req.getParameter("mnum");
		String myemail = req.getParameter("email");
		String muname = req.getParameter("uname");
		String mypass2 = req.getParameter("pass2");
		
		try {
			
			//establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
			
			//sql statement to insert the values retrieved from the form into the table
			PreparedStatement ps = con.prepareStatement("insert into register values(?,?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, myaccno);
			ps.setString(2, myfname);
			ps.setString(3, mylname);
			ps.setString(4, myfullnme);
			ps.setString(5, mybdate);
			ps.setString(6, mynid);		
			ps.setString(7, mynum);
			ps.setString(8, myemail);
			ps.setString(9, muname);
			ps.setString(10, mypass2);


			
			int count = ps.executeUpdate();
			if (count > 0) {
				
				//if data insert is successful, print the message and redirect to loging page
				resp.setContentType("text/html");				
				RequestDispatcher rd = req.getRequestDispatcher("/registersuccess.jsp");
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
