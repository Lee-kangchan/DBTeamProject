<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% List<HashMap<String, Object>> user = (List<HashMap<String, Object>>)request.getAttribute("user"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    HelloWorld
    <%for(HashMap<String, Object> t : user){%>
    <%=t.get("borrow_membership_name")%>
    <%}%>
</body>
</html>