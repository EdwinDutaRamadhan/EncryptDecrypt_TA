<%-- 
    Document   : RC4
    Created on : Nov 20, 2022, 10:37:21 AM
    Author     : HP
--%>
<%@page import="Algoritm.RC4Algorithm"%>
<%
    RC4Algorithm algo = new RC4Algorithm();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h4>RC 4</h4>
        <%
            String plainteks = request.getParameter("plainteks");
            String key = request.getParameter("key");
            char[] cipher = algo.rc4Algoritm(plainteks, key ,"cipher");
            char[] decrypt = algo.rc4Algoritm(plainteks, key, "decrypt");
        %>
        <table border="1" cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>Plainteks</th>
                    <th>Key</th>
                    <th>Cipher</th>
                    <th>Decrypt</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= plainteks %></td>
                    <td><%= key %></td>
                    <td>
                        <p>
                            <%
                                for (char c : cipher) {
                                    out.print(c);
                                }
                            %>
                        </p>
                    </td>
                    <td>
                        <p>
                            <%
                                for (char d : decrypt) {
                                    out.print(d);
                                }
                            %>
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
