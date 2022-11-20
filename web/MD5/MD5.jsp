<%@page import="Algoritm.MD5Algorithm"%>
<% MD5Algorithm algo = new MD5Algorithm(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MD5</title>
    </head>
    <body>
        <h4>MD%</h4>
        <%
            String plainteks = request.getParameter("plainteks");
            String encrypt = algo.encryptMD5("plainteks");
        %>
        <table border="1" cellspacing="0" cellpadding="10">
            <thead>
                <tr>
                    <th>Plainteks</th>
                    <th>Encrypt</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= plainteks %></td>
                    <td><%= encrypt %></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
