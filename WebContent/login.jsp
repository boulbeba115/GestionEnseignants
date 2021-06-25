<%-- 
    Document   : login
    Created on : Jun 25, 2021, 10:27:45 AM
    Author     : boulbeba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connexion</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/loginStyle.css">
    </head>
    <body>
        <div class="container">
            <div class="card"></div>
            <div class="card">
                <h1 class="title">Login</h1>
                <form method="post" action="./Login">
                    <div class="input-container">
                        <input type="type" id="label" name="login" required="required"/>
                        <label for="label">Login</label>
                        <div class="bar"></div>
                    </div>
                    <div class="input-container">
                        <input type="password" id="label" required="required" name="password"/>
                        <label for="label">Mot de Pass</label>
                        <div class="bar"></div>
                    </div>
                    <% if (request.getAttribute("errorMsg") != null) { %>
                    <div style="text-align: center;margin-bottom: 18px;">
                        <span style="color:red"><% out.print(request.getAttribute("errorMsg")); %></span>
                    </div>
                    <% }%>
                    <div class="button-container">
                        <button><span>Connexion</span></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
