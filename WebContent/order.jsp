<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-25 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>주문 상세정보 입력</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left"/>
		<h1 id="logotext">주문 상세정보 입력</h1><br/>
		
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
		<form action = "orderProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>◈ 주문 상세정보</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
					<tr>
						<td>
							<%
							// 전달받은 값 다시 넘기기 위한 작업(hidden)
							// 전달받은 값
							request.setCharacterEncoding("euc-kr");
							try {
								String bno[] = request.getParameterValues("selectBno");
								for(int i = 0; i < bno.length; i++) {
									out.println("<input type=\"checkbox\" name=\"selectBno\" checked=\"checked\" hidden=\"hidden\" value=\""+ bno[i] +"\">");
								}
							} catch(Exception e) {
								out.println("<script> alert(\"주문할 항목을 선택해주세요!\"); window.history.go(-1); </script>");
							}
							%>
						
							결제방식: 
						</td>
					 	<td>
							<input type="radio" name="omethod" value="카드" checked="checked" required="required">카드
							<input type="radio" name="omethod" value="무통장입금" required="required">무통장입금
						</td>
					</tr>
					<tr>
						<td>
							카드번호 or<br/>계좌번호: 
						</td>
					 	<td>
							<input type="text" name="opayment" required="required">
						</td>
					</tr>
					<tr>
						<td>
							주소: 
						</td>
					 	<td>
					 		<%
					 		DB.loadConnect();
					 		ResultSet rs = DB.selectUserInfo(id);
					 		String address = null;
					 		if(rs.next()) {
					 			address = rs.getString("address");
					 		}
					 		out.println("<textarea name=\"address\" required=\"required\" style=\"width:200px; height:80px\">" + address +"</textarea>");
					 		%>
						</td>
					</tr>
					<tr>
						<td>
							배송 메모: 
						</td>
					 	<td>
							<textarea name="memo" placeholder="경비실에 맡겨주세요." style="width:200px; height:80px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<br/><br/><input type = "submit" id="submit-btn" value = "결제" style="width:50pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
				</table>
			 </div>
	   </form>
	   
	   <%			
		} 	// 로그인 if문 괄호닫기%>
	</body>
</html>