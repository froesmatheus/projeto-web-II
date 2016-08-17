<%-- 
    Document   : index
    Created on : 06/08/2016, 19:53:29
    Author     : mathe
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="models.Noticia"%>
<%@page import="db.daos.NoticiaDAO"%>
<%@page contentType="text/html" session="true"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    NoticiaDAO dao = new NoticiaDAO();
    
    Noticia noticia = null;
    if (request.getParameter("noticia_id") != null) {
        int id = Integer.parseInt(request.getParameter("noticia_id"));
        noticia = dao.select(id);
        
        if (noticia == null) {
            throw new Exception("Notícia não encontrada");
        }
    }
    
%>
<html lang="pt-BR">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Matheus Fróes</title>
        <%@include file="header.jspf" %>
        
        <link href="css/basic.css" rel="stylesheet"/>
  </head>

  <body>

    <div class="container">
            
        <article>
            <h3><%=noticia.getTitulo()%></h3>
            <p><%=noticia.getResumo()%></p>
            
            <p><%=noticia.getConteudo()%></p>
        </article>
        
              
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  
   
    
</body>
</html>