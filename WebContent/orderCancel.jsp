<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-27 13:01)

******************************************************** -->

<%@page import="com.sun.org.apache.xerces.internal.impl.dtd.models.DFAContentModel"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>주문 취소</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left"/>
		<h1 id="logotext">주문 취소</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<%
		String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기

		
		if(id == null){
			out.println("<script> alert(\"로그인 후 다시 시도해주세요!\"); window.history.go(-1); </script>");
		}
		else {
		%>
		
		<!-- 메인 상자 추가 -->
		<form action = "orderCancelProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>◈ 주문 취소</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
					<tr>
						<td>
							<%
							// 전달받은 값
							request.setCharacterEncoding("euc-kr");
							String ono = (String) request.getParameter("ono");
							
							// DB 조회해서 로그인한 사용자 정보와 ono의 주문자가 일치하는지 확인(get방식으로 전달되므로, 데이터 변조 점검)
							DB.loadConnect();
					 		int check = DB.selectUidWithOnoOrders(id, ono);
					 		
					 		if(check != 1){
					 			out.println("<script> alert(\"로그인 사용자와 주문 정보가 일치하지 않습니다. 올바른 경로로 접근해주세요.\"); window.history.go(-1); </script>");
					 		}
					 		
					 		// 30일이 지난 경우, 주문취소 불가능.
					 		ResultSet rs = DB.selectOnoOrders(ono);
					 		String strDate = null;
					 		if(rs.next()) {
					 			strDate = rs.getDate("otime").toString();
					 		}
					 		try {
					 			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
					 		java.util.Date todayDate = new java.util.Date();
					 		int today = Integer.parseInt(df.format(todayDate));	// 오늘날짜
					 		
					 		int date1Month = Integer.parseInt(strDate.replace("-", "")) - 100;	// 1달 전 연월일
					 		
						 		if(today - date1Month > 100) {
						 			out.println("<script> alert(\"30일이 지난 주문은 취소할 수 없습니다.\"); window.history.go(-1); </script>");
						 		}
					 		} catch(Exception e) {
					 			out.println("<script> alert(\"잘못된 값이 입력되었습니다. 올바른 경로로 접근해주세요.\"); window.history.go(-1); </script>");
					 		}
					 		
					 		
					 		// hidden속성으로 값 넘기기
					 		out.println("<input type=\"text\" hidden name=\"ono\" value=\"" + ono + "\">");
							%>
							
							주문 취소 사유: 
						</td>
					 	<td>
							<textarea name="whyCancel" placeholder="제품이 부서졌어요." required="required" style="width:200px; height:80px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<br/><br/><input type = "submit" id="submit-btn" value = "주문취소" style="width:80pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
				</table>
			 </div>
	   </form>
	   
	   <%			
		} 	// if문 괄호닫기%>
	</body>
</html>