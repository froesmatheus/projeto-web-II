<%-- 
    Document   : login
    Created on : Aug 7, 2016, 11:30:38 PM
    Author     : mathe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="header.jspf" %>
    </head>
    <body>
        <div class="container" style="width: 400px; text-align: center;">
            <form method="post" action="adicionarNoticia.jsp">
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon2">@</span>
                    <input type="text" class="form-control" placeholder="Email" aria-describedby="sizing-addon2">
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon2">@</span>
                    <input type="text" class="form-control" placeholder="Senha" aria-describedby="sizing-addon2">
                </div>
                <br/>
                <input value="Login" name="btn_login" class="btn btn-lg btn-info" type="submit" />
            </form>
        </div>
    </body>
</html>
