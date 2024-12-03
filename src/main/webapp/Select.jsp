<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Database SQL</title>
</head>
<body>
<%@
    include file="connect.jsp"
%>
<table width="300" border="1">
    <tr>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
    </tr>
<%
    ResultSet rs = null;
    Statement stmt = null;

    try {
        if (conn == null) {
            out.println("데이터베이스 연결이 설정되지 않았습니다.<br>");
            return;
        }

        String sql = "SELECT * FROM Member";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            String id = rs.getString("id");
            String pw = rs.getString("passwd");
            String name = rs.getString("name");
%>
    <tr>
        <td><%= id %></td>
        <td><%= pw %></td>
        <td><%= name %></td>
    </tr>
<%
        }
    } catch (SQLException ex) {
        out.println("Member 테이블 호출이 실패했습니다.<br>");
        out.println("SQLException: " + ex.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
        } catch (SQLException ex) {
            out.println("ResultSet 닫는 중 오류 발생: " + ex.getMessage() + "<br>");
        }
        try {
            if (stmt != null) stmt.close();
        } catch (SQLException ex) {
            out.println("Statement 닫는 중 오류 발생: " + ex.getMessage() + "<br>");
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            out.println("Connection 닫는 중 오류 발생: " + ex.getMessage() + "<br>");
        }
    }
%>
</table>
</body>
</html>
