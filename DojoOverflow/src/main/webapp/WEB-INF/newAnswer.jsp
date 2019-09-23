<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dojo Overflow</title>
</head>
<body>
<h3>
			${question.getUser().getUsername()} asked on: 
			<fmt:formatDate pattern = "MMMM dd',' yyyy 'at' h:mm:ss a" value ="${question.createdAt}"/>
		</h3>
		
		<h3>${question.question}</h3>
		
		
		<p>
			Tags: <c:forEach items="${question.getTags()}" var="tag" varStatus="loop">
				<span class="box">${tag.subject}</span>
			</c:forEach>
		</p>
		
			<legend>Answers</legend>
			<c:if test="${question.getAnswers().size() == 0}"><p>There are no answers yet</p></c:if>
			<ol>
			<c:forEach items="${question.getAnswers()}" var="answer">
				<li class="answer">
					<p>${answer.getUser().getUsername()} answered on: 
						<fmt:formatDate pattern = "MMMM dd',' yyyy 'at' h:mm:ss a" value ="${answer.createdAt}"/>
					</p>
					<p><pre>${answer.answer}</pre></p>
				</li>
			</c:forEach>
			</ol>

	
Your Answer
			<form action="/answer/${question.id}" method="post">
				<p>
					<span style="display:block;">Answer:</span>
					<textarea name="answer" rows=6 cols=60></textarea>
				</p>
				
				<p>${error}</p>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<button type="submit">Submit Answer</button>
			</form>
</body>
</html>