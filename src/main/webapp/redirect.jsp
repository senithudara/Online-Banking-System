<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="in.sp.backend.viewprofie" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    //creating instance of the viewprofie class
    viewprofie profileServlet = new viewprofie();

    //creating a request and response object with different variable names
    HttpServletRequest httpRequest = (HttpServletRequest) pageContext.getRequest();
    HttpServletResponse httpResponse = (HttpServletResponse) pageContext.getResponse();

    try {
        //calling the doPost method of the viewprofie class
        profileServlet.doPost(httpRequest, httpResponse);
    } catch (Exception e) {
    	
        e.printStackTrace();
        out.print("<h3> " + e.getMessage() + "</h3>");
    }
%>


</body>
</html>