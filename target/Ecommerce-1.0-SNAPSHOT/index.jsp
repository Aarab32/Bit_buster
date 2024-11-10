<%-- 
    Document   : index
    Created on : 10 Nov 2024, 9:28:54 pm
    Author     : aarab
--%>

<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1>creating session factory object</h1>
        <%
        out.println(FactoryProvider.getFactory());
        
        %>
    </body>
</html>
