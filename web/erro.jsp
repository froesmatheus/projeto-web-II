<%-- 
    Document   : erro
    Created on : Aug 8, 2016, 11:55:21 PM
    Author     : mathe
--%>

<%request.setCharacterEncoding("UTF-8");%>
<%@page import="models.Noticia"%>
<%@page import="db.daos.NoticiaDAO"%>
<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jspf" %>
    </head>
    <body>
        <div class="container" style="text-align: center;">
            
            <h1>Notícia não encontrada</h1> 
             
            <br/>
            
            <form action="index.jsp">
                <button class="btn btn-lg btn-danger">Início</button>
            </form>
        </div>
    </body>
</html>


