<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-26 16:01)

******************************************************** -->

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URISyntaxException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>장바구니 변경</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">장바구니 변경</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<div id="mainbox" >
			<h2><b>◈ 장바구니 변경</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
				if(id == null)
					out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
				else {
					try{
						// 전달받은 값
						request.setCharacterEncoding("euc-kr");
						String bno[] = request.getParameterValues("selectBno");
						String bamountArr[] = request.getParameterValues("bamount");
						String bpriceArr[] = request.getParameterValues("bprice");
						int bamount[] = new int[bno.length], bprice[] = new int[bno.length];
						for(int i = 0; i < bno.length; i++) {
							bamount[i] = Integer.parseInt(bamountArr[i]);
							bprice[i] = Integer.parseInt(bpriceArr[i]);
						}
						
						String pno[] = new String[bno.length];
						int nowAmount[] = new int[bno.length];
						DB.loadConnect();
						ResultSet rs;
						int count = 0;	// 주문처리 된 횟수
						String sql = null;
						String err = "";	// 결제오류 메시지
						
						for(int i = 0; i < bno.length; i++) {
							rs = null;
							rs = DB.selectBnoBasket(bno[i]);
							if(rs.next()) {
								pno[i] = rs.getString("basket.pno");
								
							}
							
							// 상품 남은수량 가져오기
							rs = null;
							rs = DB.selectProductInfo(pno[i]);
							if(rs.next()) {
								nowAmount[i] = rs.getInt("amount");
							}
							
							// 장바구니 update
							if(nowAmount[i] < bamount[i]){
								err = "일부 상품의 수량이 부족합니다. <br/>상품의 재고를 확인해주세요.";
							} else if(bamount[i] < 1) {
								err = "값이 잘못 입력되었습니다. 1개 이상의 값만 입력 가능합니다. <br/>이외의 상품만 값이 변경됩니다.";
							} else {
								count = count + DB.updateBasketAmount(bno[i], bamount[i], bprice[i]);
							}
						}
						if(count >= 1) {
							out.println("<tr><td><h2>" + err + "</br></br>장바구니의 " + count + "개의 상품 수량이 변경되었습니다.<h2></td></tr>");
						} else {
							out.println("<tr><td><h2>" + err + "<h2></td></tr>");
						}
						

					} catch(Exception e) {
						out.println("<script> alert(\"오류가 발생했습니다! 입력값 확인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
					}
				}%>
			</table>
		 </div>
	</body>
</html>