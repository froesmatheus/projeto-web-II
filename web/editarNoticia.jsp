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
    
    int noticiaId = 0;
    if (request.getParameter("noticia_id") != null) {
        noticiaId = Integer.parseInt(request.getParameter("noticia_id"));    
    }
    
    Noticia noticia = dao.select(noticiaId);
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jspf" %>
    </head>
    <body>
        <div class="container">
            
            <form method="post" action="editarNoticia.jsp">
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon1">Título</span>
                    <input value="<%=noticia.getTitulo()%>" name="titulo" type="text" class="form-control" aria-describedby="sizing-addon">
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon2">Resumo</span>
                    <input value="<%=noticia.getResumo()%>" name="conteudo" type="text" class="form-control" aria-describedby="sizing-addon2">
                </div>
                <br/>
                <input name="id" type="hidden" value="<%=noticia.getId()%>"/>
                <input value="Atualizar" name="btn_atualizar" class="btn btn-lg btn-success" type="submit" />
            </form>
            
            
            <%
                if (request.getParameter("btn_atualizar") != null) {
                    String titulo = request.getParameter("titulo");
                    String resumo = request.getParameter("conteudo");
                    int id = Integer.parseInt(request.getParameter("id"));
                    
                    noticia.setTitulo(titulo);
                    noticia.setId(id);
                    noticia.setResumo(resumo);
                    
                    boolean updated = dao.update(noticia);

                    if (updated) {
                        response.sendRedirect("index.jsp");
                    }
                }
            %>
        </div>
    </body>
</html>

