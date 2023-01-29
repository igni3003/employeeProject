<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- multipart/formEEE-data  -->
	<!-- 모든 문자를 인코딩하지 않음을 명시함.이 방식은 <form> 요소가 파일이나 이미지를 서버로 전송할 때 주로 사용함. -->
	<form action="uploadFormAction" method="post" encType="multipart/form-data">
		<input type="file" name="uploadFile" multiple />
		<button>Submit</button>
	</form>
	
</body>
</html>










