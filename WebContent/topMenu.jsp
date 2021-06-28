<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-26 15:03)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>상단 메뉴</title>
	</head>
	<body>
		<nav class="menu-1">
		   <ul>
		   		<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='index.jsp'" target="_parent">홈</button></li>
		   <%
		   String id = (String) session.getAttribute("userID");	// 로그인 아이디
		   if(id == null){
			   %>
			   <li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='login.html'" target="_parent">로그인</button></li>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='signup.jsp'" target="_parent">회원가입</button></li>
			   <%
		   } else{
			   %>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='ProductList.jsp'" target="_parent">전체 상품</button></li>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='logout.jsp'" target="_parent">로그아웃</button></li>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='myPageMain.jsp'" target="_parent">마이페이지</button></li>
			   <%
		   }
		   %>
			
		   </ul>
		</nav>
	</body>
</html>