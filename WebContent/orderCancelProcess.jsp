<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-27 16:01)

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
		<title>취소완료</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">취소완료</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<div id="mainbox" >
			<h2><b>◈ 주문취소</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
				if(id == null)
					out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
				else {
					try{
						// 전달받은 값
						request.setCharacterEncoding("euc-kr");
						String ono = (String) request.getParameter("ono");
						String whyCancel = (String) request.getParameter("whyCancel");
						
						DB.loadConnect();
						int cnt = DB.insertCancel(ono);	// 주문취소 테이블에 옮기기
						if(cnt == 1) {
							int cnt1 = DB.updateWhyCancel(ono, whyCancel);
							if(cnt1 == 1) {
								int cnt2 = DB.deleteOrders(ono);
								if(cnt2 == 1) {
									out.println("<tr><td><h3>선택하신 주문이 취소되었습니다.</h3></td></tr>");
								}
							} else {
								out.println("<tr><td><h3>주문 취소 사유 등록 실패! 사유가 너무 길어요.</h3></td></tr>");
							}
						} else {
							out.println("<tr><td><h3>주문 취소 오류! 관리자에게 문의해주세요.</h3></td></tr>");
						}
						
						
						
						
					} catch(Exception e) {
						out.println("<script> alert(\"정상적으로 진행되지 않았습니다! 다시 시도해주세요.\"); window.history.go(-1); </script>");
					}
				}%>
			</table>
		 </div>
	</body>
</html>