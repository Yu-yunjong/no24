<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-29 06:01)

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
		<title>리뷰 조회/관리</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">리뷰 조회/관리</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<form action = "" method ="POST">
			<div id="mainbox3">
				<h2><b>◈ 주문 관리 > 리뷰 조회/관리</b></h2>
				
				<%// 관리자 아이디인지 검사
				int group = 0;
				try {
					group = Integer.parseInt(session.getAttribute("group").toString());// 회원그룹 조회
				} catch(Exception e){
					out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); location.href=\"index.jsp\"; </script>");
				}
				
				if(group != 10) {
					out.println("<script> alert(\"관리자만 사용 가능한 페이지입니다.\"); location.href=\"index.jsp\"; </script>");
				}
				%>
				
				<table border="3" width="900" >
					<tr bgcolor=#CCCCCC><td><h3>주문번호</h3></td><td><h3>고객ID</h3></td></td><td><h3>상품명</h3></td><td><h3>평점</h3></td><td><h3>평가</h3></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					if(id == null)
						out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllOrdersForReviewNotNull();
						int rowsCount = DB.rowsCount(rs);
						
						String ono[] = new String[rowsCount], uid[] = new String[rowsCount], pname[] = new String[rowsCount], 
								reviewContent[] = new String[rowsCount], scoreStar[] = new String[rowsCount];
						int score[] = new int[rowsCount];
						
						for(int i = 0; i < rowsCount; i++)
							scoreStar[i] = "";	// 공백으로 초기화
						
						int i = 0;	// 인덱스
						while(rs.next()) {
							ono[i] = rs.getString("ono");
							uid[i] = rs.getString("uid");
							pname[i] = rs.getString("pname");
							score[i] = rs.getInt("score");
							for(int j = 0; j < score[i]; j++) {
								scoreStar[i] = scoreStar[i] + "★";
							}
							reviewContent[i] = rs.getString("reviewContent");
							i++;
						}
						
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + ono[i] + "</h4></td>");
							out.println("<td><h4>" + uid[i] + "</h4></td>");
							out.println("<td><h4>" + pname[i] + "</h4></td>");
							out.println("<td><h4>" + scoreStar[i] + "</h4></td>");
							out.println("<td><h4>" + reviewContent[i] + "</h4></td></tr>");
						}
						
						%>
					<%} // else문 괄호 닫기%>
				</table>
			 </div>
	   </form>
	</body>
</html>