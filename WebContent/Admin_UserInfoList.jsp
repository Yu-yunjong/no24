<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-30 13:01)

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
		<title>회원정보 조회/관리</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">회원정보 조회/관리</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<form action = "" method ="POST">
			<div id="mainbox3">
				<h2><b>◈ 회원 관리 > 회원정보 조회/관리</b></h2>
				
				<%// 관리자 아이디인지 검사
				int group = 0;
				try {
					group = Integer.parseInt(session.getAttribute("group").toString());// 회원그룹 조회
				} catch(Exception e){
					out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); location.href=\"index.jsp\"; </script>");
				}
				
				if(group != 10) {
					out.println("<script> alert(\"관리자만 사용 가능한 페이지입니다.\"); location.href=\"index.jsp\"; </script>");
				}
				%>
				
				<table border="3" width="1200" >
					<tr bgcolor=#CCCCCC><td><h3>고객ID</h3></td></td><td><h3>PW(암호화 적용)</h3></td><td><h3>고객명</h3></td>
					<td><h3>휴대폰</h3></td><td><h3>생년월일</h3></td><td><h3>이메일</h3></td><td><h3>가입일</h3></td><td><h3>최근로그인</h3></td><td><h3>비고</h3></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					
					if(id == null)
						out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllUser();
						int rowsCount = DB.rowsCount(rs);
						
						String usrID[] = new String[rowsCount], pw[] = new String[rowsCount], name[] = new String[rowsCount], 
								phone[] = new String[rowsCount], birthday[] = new String[rowsCount], email[] = new String[rowsCount], 
								regdate[] = new String[rowsCount], lastlogin[] = new String[rowsCount];

						
						int i = 0;	// 인덱스
						while(rs.next()) {
							usrID[i] = rs.getString("id");
							pw[i] = rs.getString("pw");
							name[i] = rs.getString("uname");
							phone[i] = rs.getString("phone");
							birthday[i] = rs.getString("birthday");
							email[i] = rs.getString("email");
							regdate[i] = rs.getString("regdate");
							lastlogin[i] = rs.getString("lastlogin");
							i++;
						}
						
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + usrID[i] + "</h4></td>");
							out.println("<td><h4>" + pw[i] + "</h4></td>");
							out.println("<td><h4>" + name[i] + "</h4></td>");
							out.println("<td><h4>" + phone[i] + "</h4></td>");
							out.println("<td><h4>" + birthday[i] + "</h4></td>");
							out.println("<td><h4>" + email[i] + "</h4></td>");
							out.println("<td><h4>" + regdate[i] + "</h4></td>");
							out.println("<td><h4>" + lastlogin[i] + "</h4></td>");
							out.println("<td><button type=\"button\" onclick=\"javascript:location.href='./Admin_UserInfoChange.jsp?userID=" + usrID[i] + "'\">변경</button><br/>");
							out.println("<button type=\"button\" onclick=\"javascript:location.href='./Admin_UserDelete.jsp?userID=" + usrID[i] + "'\">탈퇴</button></td></tr>");
						}
						
						%>
					<%} // else문 괄호 닫기%>
				</table>
			 </div>
	   </form>
	</body>
</html>