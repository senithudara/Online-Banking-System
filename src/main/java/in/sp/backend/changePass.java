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
@WebServlet("/changepassword")
public class changePass extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String oldpass = req.getParameter("curpass");
		String newpass = req.getParameter("pass2");
		
		HttpSession session = req.getSession();
		String myaccno = (String) session.getAttribute("session_name5");
		
		
				try {
					//establish database connection
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
					
					//search for corresponding data in database table 
					PreparedStatement ps = con.prepareStatement("select * from register where password='"+oldpass+"' and accnumber='"+myaccno+"'");
					
					ResultSet rs = ps.executeQuery();
					if(rs.next())
					{
						
						//retrieving users' account details from the table
						PreparedStatement ps1 = con.prepareStatement("update register set password='"+newpass+"' where accnumber='"+myaccno+"'");
						
						int count = ps1.executeUpdate();
						
						if (count > 0){
							
						out.print("<h3>Password changed successfully</h3>");

						
						//if the login is successful, redirect the user to profile.jsp page
						RequestDispatcher rd = req.getRequestDispatcher("/redirect.jsp");
						rd.include(req, resp);
						}
						
					}
					else {
						
						//alert the user if the password or username cannot be found
						out.print("<h3>You entered a wrong password, try again!</h3>");
						
						RequestDispatcher rd = req.getRequestDispatcher("/changepass.jsp");
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
