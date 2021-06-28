<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-21 17:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>마이 페이지</title>
	</head>
		<body bgcolor="E7F5EF">
    	<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">마이 페이지</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<%
		String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
		
		int group = 0;
		try {
			group = Integer.parseInt(session.getAttribute("group").toString());// 회원그룹 조회
		} catch(Exception e){
			System.out.println("미로그인!!");
		}
		
		if(group == 1){
			out.println("<iframe id=\"sideMenuIframe\" src=\"SubMenu.html\"></iframe>");
		} else if(group == 10){
			out.println("<iframe id=\"sideMenuIframe\" src=\"Admin_SubMenu.html\"></iframe>");
		}
		%>
		<!-- 메인 상자 추가 -->
		<div id="mainbox" >
			<h2><b>◈ 마이 페이지</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
					<% 
					if(group == 0)
						out.println("<h3>로그인이 후 이용해주세요.</h3>");
					else if(group == 1)
						out.println("<h3>" + id + " 회원님 로그인 하신 것을 환영합니다!<br/><br/>좌측 메뉴에서 선택해주세요!</h3>");
					else if(group == 10)
						out.println("<h3>" + id + " 회원님 관리자로 로그인 하신 것을 환영합니다!<br/>오늘 하루도 열심히 ^^<br/><br/>좌측 메뉴에서 선택해주세요!</h3>");
					%>
					</td>
				</tr>
			</table>
		 </div>
	</body>
</html>