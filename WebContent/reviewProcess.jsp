<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-27 08:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>리뷰 작성</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left"/>
		<h1 id="logotext">리뷰 작성</h1><br/>
		
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
		<form action = "reviewProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>◈ 리뷰 작성</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
					<tr>
						<td>
							<%
							try {
								// 전달받은 값
								request.setCharacterEncoding("euc-kr");
								String ono = (String) request.getParameter("ono");
								int score = Integer.parseInt(request.getParameter("score"));
								String reviewContent = (String) request.getParameter("reviewContent");
								
								DB.loadConnect();
						 		int check = DB.updateReview(ono, score, reviewContent);
						 		
						 		if(check == 1) {
						 			out.println("<script> alert(\"작성한 리뷰가 등록되었습니다.\"); location.href='orderList.jsp'; </script>");
						 		}
							} catch(Exception e) {
								out.println("<script> alert(\"잘못된 값이 전달되었습니다. 숫자만 입력 가능합니다.\"); window.history.go(-1); </script>");
							}
							%>
						</td>
				</table>
			 </div>
	   </form>
	   
	   <%			
		} 	// if문 괄호닫기%>
	</body>
</html>