<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-28 12:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>중고요청도서 등록</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>     

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">관리자 메뉴</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<%
		String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
		DB.loadConnect();// DB 연결
		
		// 전달받은 값
		request.setCharacterEncoding("euc-kr");
		String group = (String) request.getParameter("group");
		String category = (String) request.getParameter("category");
		String pname = (String) request.getParameter("pname");
		String author = (String) request.getParameter("author");
		String strDate = (String) request.getParameter("date");
		String strPrice = (String) request.getParameter("price");
		String strAmount = (String) request.getParameter("amount");
		
		String imgName = (String) session.getAttribute("imgName");
		%>
		
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<h2><b>◈ 상품 등록 > 중고도서 요청 처리</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%

						// 미구현..
						if(group == null)
							out.println("<h3>구현되지 않은 기능입니다.</h3>");
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>