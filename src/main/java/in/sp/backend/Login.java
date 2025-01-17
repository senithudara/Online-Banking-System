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
@WebServlet("/loginForm")
public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		//get input values from the login form
		String myuid = req.getParameter("uid1");
		String mypass = req.getParameter("pass1");
		
		try {
			//establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
			
			//search for corresponding data in database table 
			PreparedStatement ps = con.prepareStatement("select * from register where username=? and password=?");
			ps.setString(1, myuid);
			ps.setString(2, mypass);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				//assigning values from the table to variables
				String accno = rs.getString(1);
				req.setAttribute("accountno", accno);
				
				String fname = rs.getString(2);
				req.setAttribute("firstname", fname);
				
				//creating sessions and assigning them the values from the table columns
				HttpSession session = req.getSession();
				session.setAttribute("session_name5", rs.getString("accnumber"));
				
				HttpSession session2 = req.getSession();
				session2.setAttribute("session_name6", rs.getString("nationalid"));
				
				HttpSession sessionname = req.getSession();
				sessionname.setAttribute("session_fname", rs.getString("firstname"));
				
				//retrieving users' account details from the table
				PreparedStatement ps1 = con.prepareStatement("select * from bankaccounts where accountnumber='"+accno+"'");
				
				ResultSet rs1 = ps1.executeQuery();
				
				while(rs1.next()) {
			
				//assigning values from the table to variables
				String accno2 = rs1.getString(1);
				String nid2 = rs1.getString(2);
				String balance2 = rs1.getString(3);
				String acctype2 = rs1.getString(4);
				
				req.setAttribute("accnumber", accno2);
				req.setAttribute("nationalid", nid2);
				req.setAttribute("accbalance", balance2);
				req.setAttribute("acctype", acctype2);
				
				HttpSession sessionacc = req.getSession();
				sessionacc.setAttribute("session_accno", accno2);
				
				HttpSession sessionbal = req.getSession();
				sessionbal.setAttribute("session_balance", balance2);
				
				HttpSession sessionacctype = req.getSession();
				sessionacctype.setAttribute("session_acctype", acctype2);
				
				
				//if the login is successful, redirect the user to profile.jsp page
				RequestDispatcher rd = req.getRequestDispatcher("/profile.jsp");
				rd.include(req, resp);
				}
				
			}
			else {
				
				//alert the user if the password or username cannot be found
				out.print("<h3>Username and password didnt match</h3>");
				
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.include(req, resp);
			}
		}
		//exception handling

		catch(Exception e) {
			
			//if there is any error retrieve the error details and print the details
			e.printStackTrace();
			
			out.print("<h3> "+e.getMessage()+"</h3>");
			
			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.include(req, resp);
		}
		
	}
	
}
