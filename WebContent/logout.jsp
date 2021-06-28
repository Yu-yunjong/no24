<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-16 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>로그아웃</title>
	</head>
		<body bgcolor="E7F5EF">
		<nav class="menu-1">
		   <ul>
			  <li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="document.location.href='login.html'">로그인</button></li>
			  <li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="document.location.href='signup.html'">회원가입</button></li>
			<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="document.location.href='mypage.html'">마이페이지</button></li>
		   </ul>
		 </nav>     

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">로그아웃</h1><br/>
		

		
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						DB.loadConnect();
						DB.updateLastLogin(id);	// 최근 로그인 일자 업데이트
						session.invalidate();
						out.println("<h3>로그아웃 완료!<br/>이용해주셔서 감사합니다.</h3>");
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>