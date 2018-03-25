<%-- 
    Document   : st-logout
    Created on : 2 Apr, 2017, 11:30:53 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            HttpSession sess = request.getSession(false);
            if(sess!=null)
            sess.invalidate();   
            
            response.sendRedirect("/SAIL-Transfers/st-login.jsp");
        %>        
    </body>
</html>
