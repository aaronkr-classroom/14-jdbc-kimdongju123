<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL:update</title>
<body>
<%@ include file="connect.jsp" %>

<%
request.setCharacterEncoding ("utf-8");

//:http://localhost:8080/?id=1234
String id = request.getParameter("id");
String pw = "";
String name = "";

ResultSet rs = null;
PreparedStatement pstmt = null;
try {
	String sql = "SELECT id, passwd, name FROM Member WHERE id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter ("id"));
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		String pw = rs.getString("passwd");
		String name = rs.getString("name");
	}
	
}catch (SQLException e) {
	out.println("Member 테이블에서 id 찾을 수 없었습니다~ ㅠㅠ ");
	out.println("SQLException:"+ e.getMessage());
}finally {
	if (rs != null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
}
%>
<form method="POST" action="insert_process.jsp">
<p>아이디: <input type="text" name="id" /></p>
<p>비밀번호: <input type="password" name="passwd" /></p>
<p>이름: <input type="text" name="name" /></p>
<p> <input type="submit" value="전송" /></p>
</form>
</body>
</html>
