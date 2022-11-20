<%@page import="Algoritm.SHA1Algorithm"%>
<%
    SHA1Algorithm algo = new SHA1Algorithm();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SHA 1</title>
    </head>
    <body>
        <h4>SHA-1</h4>
        <%
            String plainteks = request.getParameter("plainteks");
            String encrypt = algo.encryptSHA1(plainteks);
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
