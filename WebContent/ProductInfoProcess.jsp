<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-23 11:01)

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
		<title>상품 상세정보-장바구니</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">상품 상세정보</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<%
		//String pno = (String) session.getAttribute("pno");
		
		
		// 전달받은 값
		request.setCharacterEncoding("euc-kr");
		String pno = (String) request.getParameter("pno");
		String amountStr = (String) request.getParameter("amount");
		String priceStr = (String) request.getParameter("price");
		String nowAmountStr = (String) request.getParameter("nowAmount");
		%>
		
		<!-- 메인 상자 추가 -->
		<div id="mainbox" >
			<h2><b>◈ 장바구니에 담기</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
				if(id == null)
					out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
				else {
					int amount = 0, price = 0, nowAmount = 0;
					try{
						amount = Integer.parseInt(amountStr);
						price = Integer.parseInt(priceStr);
						nowAmount = Integer.parseInt(nowAmountStr);	// 재고 수량
						
						DB.loadConnect();
						// 다음 상품번호 조회
						ResultSet rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='bno';");
						String serial = null;
						while(rs.next()){
							serial = "b" + rs.getString("serial");
						}
						
						if(nowAmount < amount){
							out.println("<tr><td><h3>재고 수량보다 구입할 수량이 많을 수 없습니다.</h3></td></tr>");
						} else if(nowAmount == 0) {
							out.println("<tr><td><h3>재고가 부족합니다.</h3></td></tr>");
						} else if(amount <= 0){
							out.println("<tr><td><h3>최소 1개 이상은 구입해야 합니다.</h3></td></tr>");
						} else {
							int count = DB.insertBasket(serial, id, pno, amount, price);
							
							if(count == 1){
								DB.updateNextSerial("bno");
								String sql = "SELECT * FROM basket WHERE bno = '" + serial + "'";
								rs = null;	// 초기화
						        rs = DB.selectQuery(sql);
								
								// 장바구니에 담은 항목을 세션에서 pno 삭제
								session.removeAttribute("pno");
						        
						        // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
						        out.println("");
						        request.setAttribute("title", "<center><tr><td><h3>장바구니에 등록되었습니다.</h3></td></tr><br/>** 등록된 상품 **</center>"); 	        
						        request.setAttribute("RS", rs);
						        
						     	// 새로운 페이지 호출하여 수행하기
						        request.getRequestDispatcher("listRS.jsp").forward(request, response);
							}
						}
					} catch(Exception e) {
						out.println("<tr><td><h3>숫자만 입력 가능합니다.</h3></td></tr>");
					}
					
				%>
				<%} // else문 괄호 닫기%>
			</table>
		 </div>
	</body>
</html>