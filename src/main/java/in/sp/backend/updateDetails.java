package in.sp.backend;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*; 

//mapping the webservlet url
@WebServlet("/updatedata")
public class updateDetails extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
	
		//assign the value of the session into a variable
		HttpSession session = req.getSession();
		String myaccno = (String) session.getAttribute("session_name5");
		
		//get input values from the update form
		String myfname = req.getParameter("efname");
		String mylname = req.getParameter("elname");
		String myfullnme = req.getParameter("efullnme");
		String mybdate = req.getParameter("ebdate");
		String mynum = req.getParameter("emnum");
		String myemail = req.getParameter("eemail");
	
		try {
			
			//establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
			
			//sql statement to update table row of the corresponding account number
			PreparedStatement ps = con.prepareStatement("update register set firstname=?, lastname=?, fullname=?, birthdate=?, phonenum=?, email=? where accnumber='"+myaccno+"'");
			
				ps.setString(1, myfname);
				ps.setString(2, mylname);
				ps.setString(3, myfullnme);
				ps.setString(4, mybdate);
				ps.setString(5, mynum);
				ps.setString(6, myemail);	
			
			int count = ps.executeUpdate();
			
			if (count > 0)
			{   
				//if data is updated successfully redirect to the page
				RequestDispatcher rd = req.getRequestDispatcher("/redirect.jsp");
				rd.include(req, resp);
				
			}
			
			//exception handling

		}catch(Exception e) {
			
			e.printStackTrace();
			
			out.print("<h3> "+e.getMessage()+"</h3>");
			
			RequestDispatcher rd = req.getRequestDispatcher("/register1.jsp");
			rd.include(req, resp);
		}
		
	}
	

}
