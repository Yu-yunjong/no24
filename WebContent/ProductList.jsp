<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-23 09:01)

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
		<title>상품 목록</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">상품 목록</h1><br/>
		
		<%
		//session.setAttribute("pno", "p6");	// 임시로 추가. 상품 추가
		//String pno = (String) session.getAttribute("pno");
		%>
		
		<!-- 메인 상자 추가 -->
		<form action = "ProductInfoProcess.jsp" method ="POST">
			<div id="mainbox2">
				<h2><b>◈ 상품 목록 조회</b></h2>
				<table border="3" width="1500" >
					<tr bgcolor=#CCCCCC><td><h2>이미지</h2></td><td><h2>그룹</h2></td><td><h2>카테고리</h2></td><td><h2>상품명</h2></td><td><h2>저자/작곡가</h2></td><td><h2>발매일</h2></td><td><h2>가격</h2></td><td><h2>재고 수량</h2></td><td><h2>상세정보</h2></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					if(id == null)
						out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllProduct();
						int rowsCount = DB.rowsCount(rs);
						
						String pgroup[] = new String[rowsCount], category[] = new String[rowsCount], pname[] = new String[rowsCount], pno[] = new String[rowsCount], 
								author[] = new String[rowsCount], img[] = new String[rowsCount], date[] = new String[rowsCount];
						int amount[] = new int[rowsCount], price[] = new int[rowsCount];
						int i = 0;	// 인덱스
						while(rs.next()) {
							pno[i] = rs.getString("pno");
							pgroup[i] = rs.getString("pgroup");
							category[i] = rs.getString("category");
							pname[i] = rs.getString("pname");
							author[i] = rs.getString("author");
							img[i] = rs.getString("image");// 한글이미지 안뜨는 경우, server.xml에서 URIEncording="UTF-8" 추가 필요
							date[i] = rs.getDate("reldate").toString();
							amount[i] = rs.getInt("amount");
							price[i] = rs.getInt("price");
							i++;
						}
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><img width=\"170\" src=\""+ img[i] +"\"></td>");
							out.println("<td><h3>" + pgroup[i] + "</h3></td>");
							out.println("<td><h3>" + category[i] + "</h3></td>");
							out.println("<td><h3>" + pname[i] + "</h3></td>");
							out.println("<td><h3>" + author[i] + "</h3></td>");
							out.println("<td><h3>" + date[i] + "</h3></td>");
							out.println("<td><h3>" + price[i] + "</h3></td>");
							out.println("<td><h3>" + amount[i] + "</h3></td>");
							out.println("<td><button type=\"button\" onclick=\"javascript:location.href='./ProductInfo.jsp?pno=" + pno[i] + "'\">조회</button></td></tr>");
						}
						
						%>
					<%} // else문 괄호 닫기%>
				</table>
			 </div>
	   </form>
	</body>
</html>