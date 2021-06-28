<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-21 19:03)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>회원 탈퇴</title>
	</head>
		<body bgcolor="E7F5EF">
		
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>
		
		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html" />
		<h1 id="logotext">회원 탈퇴</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<h2><b>◈ 내 정보 > 회원 탈퇴</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						int group = 0;
						try {
							group = Integer.parseInt(session.getAttribute("group").toString());
						} catch(Exception e) {	// 로그인하지 않으면 null값이기 때문에, int로 캐스팅하지 못해서 예외 발생.
							out.println("<h3>로그인 후 이용해주세요.</h3>");
						}
						
						if(group == 1) {
							out.println("<h3>정말로 no24를 탈퇴하실건가요? ㅠㅠ</h3>");
							out.println("<h3>탈퇴하면 그동안 <b><u>이용내역과 혜택이 모두 사라집니다.</u></b></h3>");
						} else if(group == 10) {
							out.println("<h3>관리자는 탈퇴할 수 없습니다.</h3>");
						}
						%>
					</td>
				</tr>
				<tr>
					<td>
						<%
						if(group == 1) {
							out.println("<h3>회원 탈퇴를 원하시면 아래 확인 칸에 [탈퇴 희망]을 입력해주세요.</h3>");
							
						%>
						<form action="deleteUserProcess.jsp" method ="POST">
							확인: <input type="text" name="check"> <br/>
							비밀번호: <input type="password" name="pw"> <br /><br /><br />
							<input type = "submit" id="submit-btn" value = "탈퇴" style="width:50pt;height:30pt; font-size: 14pt;" >
						</form>
						<%
						}
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>