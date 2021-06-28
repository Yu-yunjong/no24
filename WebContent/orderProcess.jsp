<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-25 22:01)

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
		<title>주문완료</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">주문완료</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<div id="mainbox" >
			<h2><b>◈ 결제완료</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
				if(id == null)
					out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
				else {
					try{
						// 전달받은 값
						request.setCharacterEncoding("euc-kr");
						String bno[] = request.getParameterValues("selectBno");		// 장바구니 번호
						String omethod = (String) request.getParameter("omethod");	// 결제방식
						String opayment = (String) request.getParameter("opayment");// 카드번호 or 계좌번호
						String address = (String) request.getParameter("address");	// 배송지 주소
						String memo = (String) request.getParameter("memo");		// 배송시 메모

						String pno[] = new String[bno.length], pname[] = new String[bno.length], bdate[] = new String[bno.length];
						int bamount[] = new int[bno.length], bprice[] = new int[bno.length], btotal[] = new int[bno.length], nowAmount[] = new int[bno.length];
						
						DB.loadConnect();
						ResultSet rs;
						int count = 0;	// 주문처리 된 횟수
						String sql = null;
						String err = "";	// 결제오류 메시지
						for(int i = 0; i < bno.length; i++) {
							// 다음 주문번호 조회
							rs = null;
							rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='ono';");
							String serial = null;
							if(rs.next()){
								serial = "o" + rs.getString("serial");
							}
							
							// 다음 송장번호 조회
							rs = null;
							rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='sno';");
							String sno = null;
							if(rs.next()){
								sno = rs.getString("serial");
							}
							
							rs = null;
							rs = DB.selectBnoBasket(bno[i]);
							if(rs.next()) {
								pno[i] = rs.getString("basket.pno");
								pname[i] = rs.getString("pname");
								bdate[i] = rs.getDate("bdate").toString();
								bamount[i] = rs.getInt("bamount");
								bprice[i] = rs.getInt("bprice");
								btotal[i] = rs.getInt("btotal");
							}
							
							// 상품 남은수량 가져오기
							rs = null;
							rs = DB.selectProductInfo(pno[i]);
							if(rs.next()) {
								nowAmount[i] = rs.getInt("amount");
							}
							
							// 주문처리
							if(nowAmount[i] < bamount[i]){
								err = "일부 상품의 구입할 수량이 부족합니다. <br/>상품의 재고를 확인해주세요.";
							} else {
								count = count + DB.insertOrder(serial, pno[i], bno[i], id, bamount[i], 
										bprice[i], omethod, opayment, "주문", address, sno, memo);
								
								if(count == 1){// 주문이 1개뿐인 경우
									DB.deleteBasket(bno[i]);	// 장바구니에서 해당 상품 삭제
									DB.updateNextSerial("ono");	// 다음 주문번호로 업데이트
									DB.updateNextSerial("sno");	// 다음 송장 번호로 업데이트
									sql = "SELECT * FROM orders WHERE ono = '" + serial + "'";
									rs = null;	// 초기화

									// 재고 현황 업데이트
									DB.updateProductAmount(pno[i], nowAmount[i] - bamount[i]);
								} else if(count > 1) { // 주문이 1개 이상인 경우, 2개부터는 여기를 실행.
									DB.deleteBasket(bno[i]);	// 장바구니에서 해당 상품 삭제
									DB.updateNextSerial("ono");
									DB.updateNextSerial("sno");
									sql = sql + " OR ono = '" + serial + "'";
									rs = null;	// 초기화

									// 재고 현황 업데이트
									DB.updateProductAmount(pno[i], nowAmount[i] - bamount[i]);
								}
							}
						}
						System.out.println(sql);
						rs = DB.selectQuery(sql);
						
						// 장바구니에 담은 항목을 세션에서 pno 삭제
						session.removeAttribute("pno");
				        
				        // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
				        request.setAttribute("title", "<center><tr>" + err +"<td></td><td><h3>주문완료.</h3></td></tr><br/>** 주문 처리된 상품 **</center>"); 	        
				        request.setAttribute("RS", rs);
				        
				     	// 새로운 페이지 호출하여 수행하기
				        request.getRequestDispatcher("listRS.jsp").forward(request, response);
						

					} catch(Exception e) {
						out.println("<script> alert(\"정상적으로 진행되지 않았습니다! 다시 시도해주세요.\"); window.history.go(-1); </script>");
					}
				}%>
			</table>
		 </div>
	</body>
</html>