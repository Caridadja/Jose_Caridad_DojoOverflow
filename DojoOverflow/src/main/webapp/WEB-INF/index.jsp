<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dojo Overflow</title>
</head>
<body>
<table>
				<tr>
					<th>Question</th>
					<th>Asked by</th>
					<th>Tags</th>
				</tr>
				<c:forEach items="${questions}" var="question">		
					<tr>
						<td><a href="/question/${question.id}">${question.question}</a></td>
						<td>${question.getUser().getUsername()}</td>
						<td><c:forEach items="${question.getTags()}" var="tag">
							${tag.subject}<c:if test="${loop.index+1 < question.getTags().size()}">,</c:if>
						</c:forEach></td>
					</tr>
				</c:forEach>
			</table>
		
		<p><a href="/question/new"><button>Ask a question</button></a></p>
</body>
</html>