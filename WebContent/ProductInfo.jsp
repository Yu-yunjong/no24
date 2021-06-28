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
		<title>상품 상세정보</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">상품 상세정보</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<%
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
		
		<%
		//session.setAttribute("pno", "p5");	// 임시로 추가. 상품 추가
		//String pno = (String) session.getAttribute("pno");
		String pno = (String) request.getParameter("pno");
		
		String pgroup = null, category = null, pname = null, 
				author = null, img = null, date = null;
		int amount = 0, price = 0;
		%>
		
		<!-- 메인 상자 추가 -->
		<form action = "ProductInfoProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>◈ 상품 상세정보</b></h2>
				<div id="leftTable">
					<table border=3 cellspacing=2 cellpadding=2 >
						<%
						String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
						if(id == null)
							out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
						else {
							DB.loadConnect();
							ResultSet rs = DB.selectProductInfo(pno);
							while(rs.next()) {
								pgroup = rs.getString("pgroup");
								category = rs.getString("category");
								pname = rs.getString("pname");
								author = rs.getString("author");
								img = rs.getString("image");// 한글이미지 안뜨는 경우, server.xml에서 URIEncording="UTF-8" 추가 필요
								date = rs.getDate("reldate").toString();
								amount = rs.getInt("amount");
								price = rs.getInt("price");
							}
						%>
						<tr>
							<td colspan="2" style="text-align: center;" >
								<%out.println("<img width=\"170\" src=\""+ img +"\">"); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								그룹: 
							</td>
						 	<td>
								<%out.println(pgroup); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								카테고리: 
							</td>
						 	<td>
								<%out.println(category); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								상품명: 
							</td>
						 	<td>
								<%out.println(pname); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								저자/작곡가: 
							</td>
						 	<td>
								<%out.println(author); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								출판일/발매일: 
							</td>
						 	<td>
								<%out.println(date); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								가격: 
							</td>
						 	<td>
								<%out.println(price); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								재고 수량: 
							</td>
						 	<td>
								<%out.println(amount); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								구입 수량: 
							</td>
						 	<td>
						 		<%out.println("<input type=\"text\" name=\"pno\" value=\"" + pno + "\" hidden>");%>
						 		<%out.println("<input type=\"text\" name=\"price\" value=\"" + price + "\" hidden>");%>
						 		<%out.println("<input type=\"text\" name=\"nowAmount\" value=\"" + amount + "\" hidden>");%>
								<input type="text" name="amount" required="required">
							</td>
						</tr>
						<tr>
							<td colspan=2 align="right">
								<input type = "submit" id="submit-btn" value = "장바구니 담기" style="width:150pt;height:30pt; font-size: 14pt;" >
							</td>
						</tr>
						<%} // else문 괄호 닫기%>
					</table>
				</div>
					<div id="rightTable">
						<table border=3 cellspacing=2 cellpadding=2 width="500" >
								<%
								ResultSet rs = DB.selectReviewPno(pno);
								int rowsCount = DB.rowsCount(rs);
								String reviewContent[] = new String[rowsCount], uid[] = new String[rowsCount], 
										 scoreStar[] = new String[rowsCount];
								int score[] = new int[rowsCount];
								int i = 0;
								
								for(int j = 0; j < rowsCount; j++) {
									scoreStar[j] = "";
								}
								
								while(rs.next()) {
									uid[i] = rs.getString("uid");
									reviewContent[i] = rs.getString("reviewContent");
									score[i] = rs.getInt("score");
									for(int j = 0; j < score[i]; j++) {
										scoreStar[i] = scoreStar[i] + "★";
									}
									i++;
								}
								
								if(rowsCount == 0) {
									out.println("<tr><td><h3>아직 등록된 평점/평가가 없습니다.<br/>여러분의 평가를 기다릴게요~</h3></td></tr>");
								} else {
									%>
							<tr bgcolor=#CCCCCC>
								<td>회원아이디</td><td>평점</td><td>평가</td>
							</tr>
									<%
									for(i = 0; i < rowsCount; i++) {
										out.println("<tr><td>" + uid[i] + "</td>");
										out.println("<td>" + scoreStar[i] + "</td>");
										out.println("<td>" + reviewContent[i] + "</td></tr>");
									}
								}
								%>
						</table>
					</div>
				</div>
	   </form>
	</body>
</html>