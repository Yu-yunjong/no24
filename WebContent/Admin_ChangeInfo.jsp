<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-16 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>관리자 - 정보 수정</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>    

		<!-- 상단 로고 영역 -->
		<a href="index.html"><img id="logoimg" src="img/no24.png" width=220 height=90 align="left" /></a>
		<h1 id="logotext">관리자 메뉴</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<%
		int group = 0;
		try {
			group = Integer.parseInt(session.getAttribute("group").toString());// 회원그룹 조회
		} catch(Exception e){
			out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); location.href=\"index.jsp\"; </script>");
		}
		
		if(group != 10) {
			out.println("<script> alert(\"관리자만 사용 가능한 페이지입니다.\"); location.href=\"index.jsp\"; </script>");
		}
		
		DB.loadConnect();
		
		// DB에서 현재 관리자 비번 조회
		String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
		
		ResultSet rs = DB.selectUserInfo(id);
		String name = null, phone = null, birthday = null, email = null, address = null, 
				regdate = null, lastlogin = null;
		while(rs.next()){
			name = rs.getString("uname");
			birthday = rs.getString("birthday");
			phone = rs.getString("phone");
			email = rs.getString("email");
			address = rs.getString("address");
			regdate = rs.getString("regdate");
			lastlogin = rs.getString("lastlogin");
		}
		
		
		%>
		
		<!-- 메인 상자 추가 -->
		<form action = "Admin_ChangeInfoProcess.jsp" method ="POST">
			<div id="mainbox" >
			
				<h2><b>◈ 내 정보 > 정보 수정</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
			
					<tr>
						<td>
							<%
							if(id == null){
								%>
								<h3>로그인 후 이용해주세요.</h3>
								<%
							}
							else{
							// 생일 나누기
							String birthdayCombo[] = birthday.split("-");
							
							%>
							아이디: 
						</td>
					 	<td>
							<% out.println(id); %>
						</td>
					</tr>
					<tr>
						<td>
							비밀번호: 
						</td>
					 	<td>
							<input type="password" id="pw" name="pw">
						</td>
					</tr>
					<tr>
						<td>
							이름: 
						</td>
					 	<td>
							<% out.println(name); %>
						</td>
					</tr>
					<tr>
						<td>
							휴대폰: 
						</td>
					 	<td>
							<% out.println("<input type=\"text\"name=\"phone\" value=\"" + phone +"\">"); %>
						</td>
					</tr>
					<tr>
						<td>
							이메일: 
						</td>
					 	<td>
							<% out.println("<input type=\"text\"name=\"email\" value=\"" + email +"\">"); %>
						</td>
					</tr>
					<tr>
						<td>
							생년월일: 
						</td>
					 	<td>
							<select name="year">
								<option value="none">년</option>
								<%
								for(int i = 1920; i < 2021; i++) {
									// 생년월일 값 선택
									if(i == Integer.parseInt(birthdayCombo[0]))
										out.println("<option value=" + i + " + selected>" + i + "</option>");
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								
								%>
							</select>
							<select name="month">
								<option value="none">월</option>
								<%
								for(int i = 1; i <= 12; i++) {
									// 생년월일 값 선택
									if(i == Integer.parseInt(birthdayCombo[1]))
										out.println("<option value=" + i + " + selected>" + i + "</option>");
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
							<select name="day">
								<option value="none">일</option>
								<%
								for(int i = 1; i <= 31; i++) {
									// 생년월일 값 선택
									if(i == Integer.parseInt(birthdayCombo[2]))
										out.println("<option value=" + i + " + selected>" + i + "</option>");
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							주소: 
						</td>
					 	<td>
							<%
							// 주소 값이 null인 경우, 빈 칸으로 표기
							if(address == null)
								out.println("<input type=\"text\"name=\"address\" value=\"\">");
							else
								out.println("<input type=\"text\"name=\"address\" value=\"" + address +"\">");
							%>
						</td>
					</tr>
					<tr>
						<td>
							회원가입 일자: 
						</td>
					 	<td>
							<% out.println(regdate); %>
						</td>
					</tr>
					<tr>
						<td>
							최근 로그인 일자: 
						</td>
					 	<td>
							<% out.println(lastlogin); %>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<span id="pwcheck"></span>
							<br/><br/><input type = "submit" id="submit-btn" value = "수정" style="width:50pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
					<%
				}// 로그인 확인 괄호 닫기.
					%>
				</table>
			 </div>
	   </form>
	</body>
</html>