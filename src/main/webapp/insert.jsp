<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Database SQL</title>
</head>
<body>
<form method="POST" action="insert_process.jsp">
<p>아이디: <input type="text" name="id" /></p>
<p>비밀번호: <input type="password" name="passwd" /></p>
<p>이름: <input type="text" name="name" /></p>
<p> <input type="submit" value="전송" /></p>
</form>
</body>
</html>

