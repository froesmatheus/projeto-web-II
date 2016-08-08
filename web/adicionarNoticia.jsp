<%-- 
    Document   : adicionarNoticia
    Created on : 07/08/2016, 19:07:22
    Author     : mathe
--%>

<%request.setCharacterEncoding("UTF-8");%>
<%@page import="models.Noticia"%>
<%@page import="db.daos.NoticiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    NoticiaDAO dao = new NoticiaDAO();
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jspf" %>
    </head>
    <body>
        <div class="container">
            
            <form method="post" action="adicionarNoticia.jsp">
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon1">Título</span>
                    <input name="titulo" type="text" class="form-control" aria-describedby="sizing-addon">
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon2">Conteúdo</span>
                    <input name="conteudo" type="text" class="form-control" aria-describedby="sizing-addon2">
                </div>
                <br/>
                <input value="Adicionar" name="btn_adicionar" class="btn btn-lg btn-success" type="submit" />
            </form>
            
            
            <%
                if (request.getParameter("btn_adicionar") != null) {
                    String titulo = request.getParameter("titulo");
                    String conteudo = request.getParameter("conteudo");

                    boolean inserted = dao.insert(new Noticia(titulo, conteudo));

                    if (inserted)
                        response.sendRedirect("index.jsp");
                }
                
            %>
        </div>
    </body>
</html>

