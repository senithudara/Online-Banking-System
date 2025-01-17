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
@WebServlet("/accValidate")

public class ValidateAccount extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		//get input values from the form
		String myaccnum = req.getParameter("accnum");
		String mynid = req.getParameter("nid");
		String myacctype = req.getParameter("accounttype");
		
		try {
			//establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
			
			
			//sql statement to search if the bank account is in the banks' system
			PreparedStatement ps = con.prepareStatement("select * from bankaccounts where accountnumber=? and nationalID=? and acctype=?");
			ps.setString(1, myaccnum);
			ps.setString(2, mynid);
			ps.setString(3, myacctype);

			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{	
				
				//creating and assigning table data to sessions
				HttpSession session1 = req.getSession();
				session1.setAttribute("session_name1", rs.getString("accountnumber"));
				
				HttpSession session2 = req.getSession();
				session2.setAttribute("session_name2", rs.getString("nationalID"));
				
				HttpSession session3 = req.getSession();
				session3.setAttribute("session_name3", rs.getString("acctype"));
				
				HttpSession session4 = req.getSession();
				session4.setAttribute("session_name4", rs.getString("accbalance"));
				
				//sql statement to check if the user already has an account
				PreparedStatement ps1 = con.prepareStatement("select * from register where accnumber=? and nationalid=?");
				ps1.setString(1, myaccnum);
				ps1.setString(2, mynid);
	
				ResultSet rs1 = ps1.executeQuery();
				if(rs1.next()) {
				
					//if the user has an account redirect to the following page
					RequestDispatcher rd = req.getRequestDispatcher("/existingacc.jsp");
					rd.include(req, resp);
				
				}
				else {
					
					//if the user does not have an account redirec them to the next registration form
					RequestDispatcher rd = req.getRequestDispatcher("/register2.jsp");
					rd.include(req, resp);
				}
				
			}
			else {
				
				//if the bank account entered by the user is now in the system, print the following message
				out.print("<h3>We couldn't find your account. Please try again</h3>");
				
				RequestDispatcher rd = req.getRequestDispatcher("/register1.jsp");
				rd.include(req, resp);
			}
		}
		
		//exception handling

		catch(Exception e) {
			//if there is any error retrieve the error details and print the details
			e.printStackTrace();
			
			out.print("<h3> "+e.getMessage()+"</h3>");
			
			RequestDispatcher rd = req.getRequestDispatcher("/register1.jsp");
			rd.include(req, resp);
		}
		
	}

}
