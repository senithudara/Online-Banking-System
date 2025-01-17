package in.sp.backend;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*; 

//mapping the webservlet url
@WebServlet("/viewuserprofile")

public class viewprofie extends HttpServlet{
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		//assign the value of the session into a varibale
		HttpSession session = req.getSession();
		String myaccno = (String) session.getAttribute("session_name5");

		try {
			
			//establish database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "senith");
			
			Statement stmt = con.createStatement();
			
			//sql statement to retrieve data from the table for the corresponding account number
			String sql = "select * from register where accnumber='"+myaccno+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{   
				
				//assigning values from table rows to variables
				String fname2 = rs.getString(2);
				String lname2 = rs.getString(3);
				String fullname2 = rs.getString(4);
				String bday2 = rs.getString(5);
				String phone2 = rs.getString(7);
				String email2 = rs.getString(8);
				String nid2 = rs.getString(6);
				String accno2 = rs.getString(1);

				req.setAttribute("firstname", fname2);
				req.setAttribute("lastname", lname2);
				req.setAttribute("fullname", fullname2);
				req.setAttribute("birthday", bday2);
				req.setAttribute("phonenum", phone2);
				req.setAttribute("email", email2);
				req.setAttribute("nationalid", nid2);
				req.setAttribute("accountno", accno2);
				
				//assigning values from table rows to sessions
				HttpSession sessionfname = req.getSession();
				sessionfname.setAttribute("session_fname", rs.getString("firstname"));
				HttpSession sessionlname = req.getSession();
				sessionlname.setAttribute("session_lname", rs.getString("lastname"));
				HttpSession sessionfullname = req.getSession();
				sessionfullname.setAttribute("session_fullname", rs.getString("fullname"));
				HttpSession sessionbday = req.getSession();
				sessionbday.setAttribute("session_bday", rs.getString("birthdate"));
				HttpSession sessionphone = req.getSession();
				sessionphone.setAttribute("session_phone", rs.getString("phonenum"));
				HttpSession sessionemail = req.getSession();
				sessionemail.setAttribute("session_email", rs.getString("email"));
				
				
				//if the data is retrieved successfully redirect to the viewprofile.jsp
				RequestDispatcher rd = req.getRequestDispatcher("/viewprofile.jsp");
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
