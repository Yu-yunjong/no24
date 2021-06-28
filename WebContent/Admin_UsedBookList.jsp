<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-27 23:31)

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
		<title>중고 요청 도서 조회</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">관리자 메뉴</h1><br/>
		
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
		
		<!-- 메인 상자 추가 -->
		<form action = "Admin_UsedBookListProcess.jsp" method ="POST">
			<div id="mainbox2">
				<h2><b>◈ 도서 등록 > 중고 요청 도서 조회</b></h2>
				<table border="3" width="1500" >
					<tr bgcolor=#CCCCCC><td><h2>선택</h2></td><td><h2>요청번호</h2></td><td><h2>상품명</h2></td>
					<td><h2>요청시간</h2></td><td><h2>카테고리</h2></td><td><h2>이미지</h2></td><td><h2>가격</h2></td><td><h2>재고 수량</h2></td>
					<td><h2>등록상태</h2></td><td><h2>반려 사유</h2></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					if(id == null)
						out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllRequest();
						int rowsCount = DB.rowsCount(rs);
						
						String reqno[] = new String[rowsCount], uid[] = new String[rowsCount], category[] = new String[rowsCount], rname[] = new String[rowsCount], 
								author[] = new String[rowsCount], img[] = new String[rowsCount], reldate[] = new String[rowsCount], rtime[] = new String[rowsCount], 
								rstate[] = new String[rowsCount], reason[] = new String[rowsCount];
						int amount[] = new int[rowsCount], price[] = new int[rowsCount];
						int i = 0;	// 인덱스
						while(rs.next()) {
							reqno[i] = rs.getString("reqno");
							uid[i] = rs.getString("uid");
							category[i] = rs.getString("category");
							rname[i] = rs.getString("rname");
							author[i] = rs.getString("author");
							img[i] = rs.getString("image");
							reldate[i] = rs.getDate("reldate").toString();
							rtime[i] = rs.getDate("rtime").toString();
							rstate[i] = rs.getString("rstate");
							reason[i] = rs.getString("reason");
							amount[i] = rs.getInt("amount");
							price[i] = rs.getInt("price");
							i++;
						}
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><input type=\"radio\" name=\"select\" value=\"" + reqno[i] + "\" required=\"required\"></td>");
							out.println("<td><h3>" + reqno[i] + "</h3></td>");
							out.println("<td><h3>" + rname[i] + "</h3></td>");
							out.println("<td><h3>" + rtime[i] + "</h3></td>");
							out.println("<td><h3>" + category[i] + "</h3></td>");
							out.println("<td><img width=\"170\" src=\"" + img[i] + "\"></td>");
							out.println("<td><h3>" + price[i] + "</h3></td>");
							out.println("<td><h3>" + amount[i] + "</h3></td>");
							out.println("<td><h3>" + rstate[i] + "</h3></td>");
							out.println("<td><h3>" + reason[i] + "</h3></td></tr>");
						}
						
						%>
					<%} // else문 괄호 닫기%>
				</table>
				<br/>
				<div>
				 	<table>
						<tr>
							<td>
								<select name="state">
									<option value="등록요청">등록요청</option>
									<option value="심사중">심사중</option>
									<option value="등록됨">등록됨</option>
									<option value="반려">반려</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<textarea name="reason" placeholder="반려의 경우만 입력. (xx페이지 손상)" required="required" style="width:200px; height:80px"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="right">
								<br/><br/><input type = "submit" id="submit-btn" value = "변경" style="width:50pt;height:30pt; font-size: 14pt;" >
							</td>
						</tr>
					</table>
				 </div>
			 </div>
	   </form>
	</body>
</html>