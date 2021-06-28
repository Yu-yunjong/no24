<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-26 12:01)

******************************************************** -->

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URISyntaxException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>장바구니 상품 삭제</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">장바구니 상품 삭제</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<div id="mainbox" >
			<h2><b>◈ 장바구니 상품 삭제</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
				if(id == null)
					out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
				else {
					try {
						// 전달받은 값
						request.setCharacterEncoding("euc-kr");
						String bno[] = request.getParameterValues("selectBno");
						
						int count = 0;
						DB.loadConnect();
						for(int i = 0; i < bno.length; i++) {
							count = count + DB.deleteBasket(bno[i]);
						}
						
						if(count >= 1){
							out.println("<tr><td><h2>장바구니에서 " + count +"개의 항목이 삭제되었습니다.</h2></td></tr>");
							// 장바구니에 담은 항목을 세션에서 pno 삭제
							session.removeAttribute("pno");
						}
					} catch(Exception e) {
						out.println("<script> alert(\"삭제할 항목을 선택해주세요!\"); window.history.go(-1); </script>");
					}
				}
				%>

			</table>
		 </div>
	</body>
</html>