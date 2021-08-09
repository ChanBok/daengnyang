<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberListPage</title>
</head>
<body>
	<c:forEach items="${memberList }" var="list">
		<ul>
			<li>${list.memId }</li>
			<li>${list.memPw }</li>
			<li>${list.memName }</li>
			<li>${list.postNum }</li>
			<li>${list.memAdd }</li>
			<li>${list.addDetail }</li>
			<li>${list.memPhone }</li>
			<li>${list.memBirth }</li>
			<li>${list.memGender }</li>
		</ul>
	</c:forEach>
</body>
</html>