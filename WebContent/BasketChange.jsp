<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-26 13:01)

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
		<title>장바구니 상품 변경</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">장바구니 상품 변경</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<form action = "BasketChangeProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>◈ 장바구니 상품 변경</b></h2>
				<table border=3 cellspacing=2 cellpadding=2 >
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					if(id == null)
						out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
					else {
						try {
							// 전달받은 값 다시 넘기기 위한 작업(hidden)
							// 전달받은 값
							String bno[] = null;
							request.setCharacterEncoding("euc-kr");
							
							bno = request.getParameterValues("selectBno");
							for(int i = 0; i < bno.length; i++) {
								out.println("<input type=\"checkbox\" name=\"selectBno\" checked=\"checked\" hidden=\"hidden\" value=\""+ bno[i] +"\">");
							}
							
							String pno[] = new String[bno.length], pname[] = new String[bno.length], bdate[] = new String[bno.length];
							int bamount[] = new int[bno.length], bprice[] = new int[bno.length], btotal[] = new int[bno.length], nowAmount[] = new int[bno.length];
							ResultSet rs = null;
							DB.loadConnect();
							
							for(int i = 0; i < bno.length; i++) {
								rs = DB.selectBnoBasket(bno[i]);
								if(rs.next()) {
									pno[i] = rs.getString("basket.pno");
									pname[i] = rs.getString("pname");
									bdate[i] = rs.getDate("bdate").toString();
									bamount[i] = rs.getInt("bamount");
									bprice[i] = rs.getInt("bprice");
									btotal[i] = rs.getInt("btotal");
								}
							}
							%>
							<tr align="middle">
								<td>장바구니번호</td><td>상품번호</td><td>상품명</td><td>수량</td><td>단가</td><td>합계</td>
							</tr>
							<%
							for(int j = 0; j < bno.length; j++) {
								out.println("<tr align=\"middle\"><td>" + bno[j] + "</td>");
								out.println("<td>" + pno[j] + "</td>");
								out.println("<td>" + pname[j] + "</td>");
								out.println("<td><input type=\"number\" name=\"bamount\" value=\"" + bamount[j] + "\" /></td>");
								out.println("<td>" + bprice[j] + "</td>");
								out.println("<td>" + btotal[j] + "</td></tr>");
								out.println("<input type=\"number\" name=\"bprice\" value=\"" + bprice[j] + "\" hidden=\"hidden\" />");	// 값 넘겨주기 위함
							}
							
							// 장바구니에 담은 항목을 세션에서 pno 삭제
							session.removeAttribute("pno");
							
						} catch(Exception e) {
							out.println("<script> alert(\"변경할 항목을 선택해주세요!\"); window.history.go(-1); </script>");
						}
					}
					%>
					<td colspan=6 align="right">
						<br/><br/><input type = "submit" id="submit-btn" value = "변경" style="width:50pt;height:30pt; font-size: 14pt;" >
					</td>
				</table>
		 	</div>
		 </form>
	</body>
</html>