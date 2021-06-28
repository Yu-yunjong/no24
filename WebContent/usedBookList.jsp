<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-27 18:03)

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
		<title>요청도서 조회</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">요청도서 조회</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<form action = "" method ="POST">
			<div id="mainbox3">
				<h2><b>◈ 중고도서등록 > 요청 도서 조회</b></h2>
				<table border="3" width="1400" >
					<tr bgcolor=#CCCCCC><td><h3>등록번호</h3></td><td><h3>분류</h3></td><td><h3>카테고리</h3></td><td><h3>상품명</h3></td>
					<td><h3>가격</h3></td><td><h3>발매일</h3></td><td><h3>상품이미지</h3></td><td><h3>등록시간</h3><td><h3>등록상태</h3></td><td><h3>반려사유</h3></td></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					if(id == null)
						out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectRequestUid(id);
						int rowsCount = DB.rowsCount(rs);
						
						String reqno[] = new String[rowsCount], rgroup[] = new String[rowsCount], 
								category[] = new String[rowsCount], rname[] = new String[rowsCount], author[] = new String[rowsCount], rtime[] = new String[rowsCount], 
								reldate[] = new String[rowsCount], image[] = new String[rowsCount], rstate[] = new String[rowsCount], reason[] = new String[rowsCount];
						int amount[] = new int[rowsCount], price[] = new int[rowsCount];
						
						int i = 0;	// 인덱스
						while(rs.next()) {
							reqno[i] = rs.getString("reqno");
							rgroup[i] = rs.getString("rgroup");
							category[i] = rs.getString("category");
							rname[i] = rs.getString("rname");
							price[i] = rs.getInt("price");
							reldate[i] = rs.getDate("reldate").toString();
							rtime[i] = rs.getDate("rtime").toString();
							amount[i] = rs.getInt("amount");
							image[i] = rs.getString("image");
							rstate[i] = rs.getString("rstate");
							reason[i] = rs.getString("reason");
							i++;
						}
						
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + reqno[i] + "</h4></td>");
							out.println("<td><h4>" + rgroup[i] + "</h4></td>");
							out.println("<td><h4>" + category[i] + "</h4></td>");
							out.println("<td><h4>" + rname[i] + "</h4></td>");
							out.println("<td><h4>" + price[i] + "</h4></td>");
							out.println("<td><h4>" + reldate[i] + "</h4></td>");
							out.println("<td><img width=\"170\" src=\""+ image[i] +"\"></td>");
							out.println("<td><h4>" + rtime[i] + "</h4></td>");
							out.println("<td><h4>" + rstate[i] + "</h4></td>");
							out.println("<td><h4>" + reason[i] + "</h4></td></tr>");
						}
						
						%>
					<%} // else문 괄호 닫기%>
				</table>
			 </div>
	   </form>
	</body>
</html>