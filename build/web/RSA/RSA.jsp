<%@page import="Algoritm.RSAAlgorithm"%>
<%
    RSAAlgorithm algo = new RSAAlgorithm();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4>RSA</h4>
        <% 
            String plainteks = request.getParameter("plainteks");
            String publicKey = algo.keyGenerate("public");
            String privateKey = algo.keyGenerate("private");
            String encrypt = algo.cipher(plainteks, "encrypt");
            String decrypt = algo.cipher(plainteks, "decrypt");
        %>
        <table border="1" cellspacing="1" cellpadding="10">
            <tbody>
                <tr>
                    <th>Plainteks</th>
                    <td><%= plainteks %></td>
                </tr>
                <tr>
                    <td>PublicKey</td>
                    <td><%= publicKey %></td>
                </tr>
                <tr>
                    <td>PrivateKey</td>
                    <td><%= privateKey %></td>
                </tr>
                <tr>
                    <td>Enkripsi</td>
                    <td><%= encrypt %></td>
                </tr>
                <tr>
                    <td>Dekripsi</td>
                    <td><%= decrypt %></td>
                </tr>
            </tbody>
        </table>
                <a href="RSA_Form.jsp">Back To Form</a>
    </body>
</html>
