<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-23 23:01)

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
		<title>장바구니</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">장바구니</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<form action = "BasketChange.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>◈ 주문 정보 > 장바구니</b></h2>
				<table border=3 cellspacing=2 cellpadding=2>
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					String pno = (String) session.getAttribute("pno");
					if(id == null)
						out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectBasket(id);
						int rowsCount = DB.rowsCount(rs);	// 행 수
						
						String bno[] = new String[rowsCount], pname[] = new String[rowsCount], pnoArr[] = new String[rowsCount], bdate[] = new String[rowsCount];
						int bamount[] = new int[rowsCount], bprice[] = new int[rowsCount], btotal[] = new int[rowsCount];
						int i = 0;
						
						
						while(rs.next()) {
							bno[i] = rs.getString("bno");
							pnoArr[i] = rs.getString("pno");
							pname[i] = rs.getString("pname");
							bdate[i] = rs.getDate("bdate").toString();
							bamount[i] = rs.getInt("bamount");
							bprice[i] = rs.getInt("bprice");
							btotal[i] = rs.getInt("btotal");
							i++;
						}
					%>
					<tr align="middle">
						<td>선택</td><td>장바구니번호</td><td>상품번호</td><td>상품명</td><td>담은 날짜</td><td>수량</td><td>단가</td><td>합계</td>
					</tr>
					<%
					for(int j = 0; j < rowsCount; j++) {
						out.println("<tr align=\"middle\"><td><input type=\"checkbox\" name=\"selectBno\" value=\""+ bno[j] +"\"></td>");
						out.println("<td>" + bno[j] + "</td>");
						out.println("<td>" + pnoArr[j] + "</td>");
						out.println("<td>" + pname[j] + "</td>");
						out.println("<td>" + bdate[j] + "</td>");
						out.println("<td>" + bamount[j] + "</td>");
						out.println("<td>" + bprice[j] + "</td>");
						out.println("<td>" + btotal[j] + "</td></tr>");
					}
					%>
					
					<tr>
						<td colspan=8 align="right">
							<input type = "submit" id="submit-btn" value = "변경" style="width:70pt;height:30pt; font-size: 14pt;" >
							<input type = "submit" id="submit-btn" value = "삭제" formaction="BasketDelete.jsp" style="width:70pt;height:30pt; font-size: 14pt;" >
							<input type = "submit" id="submit-btn" value = "주문" formaction="order.jsp" style="width:70pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
					<%} // else문 괄호 닫기%>
				</table>
			 </div>
	   </form>
	</body>
</html>