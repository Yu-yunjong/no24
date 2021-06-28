<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-28 22:01)

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
		<title>관리자 - 주문내역 확인</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">관리자 - 주문내역 확인</h1><br/>
		
		
		<!-- 메인 상자 추가 -->
		<form action = "" method ="POST">
			<div id="mainboxOrderList">
				<h2><b>◈ 주문 관리 > 주문내역 조회/관리</b></h2>
				<table border="3" width="1600" >
					<tr bgcolor=#CCCCCC><td><h3>주문번호</h3></td><td><h3>상품명</h3></td><td><h3>수량</h3></td>
					<td><h3>단가</h3></td><td><h3>총 금액</h3></td><td><h3>주문일자</h3></td><td><h3>결제방식</h3></td><td><h3>결제 정보</h3></td>
					<td><h3>처리 현황</h3></td><td><h3>배송지</h3></td><td><h3>비고</h3></td></tr>
					<%
					//!!!!!!!!!!!!!!!!!!!!!!미구현!!!!!!!!!!!!!!!!!!!!!!!!
					out.println("<script> alert(\"아직 구현되지 않았습니다.\"); window.history.go(-1); </script>");
					// 관리자 아이디인지 검사
					int group = 0;
					try {
						group = Integer.parseInt(session.getAttribute("group").toString());// 회원그룹 조회
					} catch(Exception e){
						out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); location.href=\"index.jsp\"; </script>");
					}
					
					if(group != 10) {
						out.println("<script> alert(\"관리자만 사용 가능한 페이지입니다.\"); location.href=\"index.jsp\"; </script>");
					}
					
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					if(id == null)
						out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllOrders();
						int rowsCount = DB.rowsCount(rs);
						
						String ono[] = new String[rowsCount], pno[] = new String[rowsCount], pname[] = new String[rowsCount], 
								omethod[] = new String[rowsCount], otime[] = new String[rowsCount], opayment[] = new String[rowsCount], 
								ostatus[] = new String[rowsCount], oaddress[] = new String[rowsCount];
						int oamount[] = new int[rowsCount], price[] = new int[rowsCount];
						int i = 0;	// 인덱스
						while(rs.next()) {
							pno[i] = rs.getString("pno");
							ono[i] = rs.getString("ono");
							opayment[i] = rs.getString("opayment");
							pname[i] = rs.getString("pname");
							omethod[i] = rs.getString("omethod");
							otime[i] = rs.getDate("otime").toString();
							ostatus[i] = rs.getString("ostatus");
							oaddress[i] = rs.getString("oaddress");
							oamount[i] = rs.getInt("oamount");
							price[i] = rs.getInt("orders.price");
							i++;
						}
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + ono[i] + "</h4></td>");
							out.println("<td><h4>" + pname[i] + "</h4></td>");
							out.println("<td><h4>" + oamount[i] + "</h4></td>");
							out.println("<td><h4>" + price[i] + "</h4></td>");
							out.println("<td><h4>" + oamount[i] * price[i] + "</h4></td>");
							out.println("<td><h4>" + otime[i] + "</h4></td>");
							out.println("<td><h4>" + omethod[i] + "</h4></td>");
							out.println("<td><h4>" + opayment[i] + "</h4></td>");
							out.println("<td><h4>" + ostatus[i] + "</h4></td>");
							out.println("<td><h4>" + oaddress[i] + "</h4></td>");
							out.println("<td><button type=\"button\" onclick=\"javascript:location.href='./Admin_orderChange.jsp?ono=" + ono[i] + "'\">주문 변경</button><br/>");
							out.println("<button type=\"button\" onclick=\"javascript:location.href='./Admin_orderCancel.jsp?ono=" + ono[i] + "'\">주문 취소</button></td></tr>");
						}
						
						%>
					<%} // else문 괄호 닫기%>
				</table>
			 </div>
	   </form>
	</body>
</html>