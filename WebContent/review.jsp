<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-27 12:01)

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
							// 전달받은 값
							request.setCharacterEncoding("euc-kr");
							String ono = (String) request.getParameter("ono");
							
							// DB 조회해서 로그인한 사용자 정보와 ono의 주문자가 일치하는지 확인(get방식으로 전달되므로, 데이터 변조 점검)
							DB.loadConnect();
					 		int check = DB.selectUidWithOnoOrders(id, ono);
					 		
					 		if(check != 1){
					 			out.println("<script> alert(\"로그인 사용자와 주문 정보가 일치하지 않습니다. 올바른 경로로 접근해주세요.\"); window.history.go(-1); </script>");
					 		}
					 		
					 		ResultSet rs = DB.selectOnoOrders(ono);
					 		String score = null;
					 		if(rs.next()) {
					 			score = rs.getString("score");
					 		}
					 		
					 		if(score != null) {
					 			out.println("<script> alert(\"이미 리뷰가 등록된 상품입니다.\"); window.history.go(-1); </script>");
					 		}
					 		
					 		// hidden속성으로 값 넘기기
					 		out.println("<input type=\"text\" hidden name=\"ono\" value=\"" + ono + "\">");
							%>
							
							평점: 
						</td>
					 	<td>
							<input type="radio" name="score" value=5 required="required">★★★★★<br/>
							<input type="radio" name="score" value=4 required="required">★★★★<br/>
							<input type="radio" name="score" value=3 required="required">★★★<br/>
							<input type="radio" name="score" value=2 required="required">★★<br/>
							<input type="radio" name="score" value=1 required="required">★
						</td>
					</tr>
					<tr>
						<td>
							평가: 
						</td>
					 	<td>
							<textarea name="reviewContent" placeholder="정말 좋아요!" required="required" style="width:200px; height:80px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<br/><br/><input type = "submit" id="submit-btn" value = "등록" style="width:50pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
				</table>
			 </div>
	   </form>
	   
	   <%			
		} 	// if문 괄호닫기%>
	</body>
</html>