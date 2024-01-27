<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
	<title>게시글 목록</title>
</head>
<body>
<main>
	<div>
		<div>
	      		<h2>로그인</h2>
			<form action="login" method="POST">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	      		<div>
	        		<div>
	          			<label for="email" class="sr-only">Email address</label>
	          			<input id="email" name="email" type="email" autocomplete="email" placeholder="Email">
	        		</div>
	        		<div>
	          			<label for="password" class="sr-only">Password</label>
	          			<input id="password" name="password" type="password" autocomplete="current-password" placeholder="Password">
	        		</div>
	      		</div>
	      		<div>
	        		<button type="submit">
	          			로그인
	        		</button>
	      		</div>
	    	</form>
	  	</div>
	</div>
</main>
</body>
</html>