<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-26 19:03)

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
		
		
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<h2><b>◈ 내 정보 > 회원 탈퇴</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						
						// 전달받은 값
						request.setCharacterEncoding("euc-kr");
						String check = (String) request.getParameter("check");
						String PW = EncriptPassword.encriptPassword((String) request.getParameter("pw"));
						
						if(id == null || check == null){
							out.println("<h3>로그인 후 이용해주세요.</h3>");
						} else {
							DB.loadConnect();
							ResultSet rs = DB.selectCurrentPW(id);
							
							String dbPW = null;
							while(rs.next()) {
								dbPW = rs.getString("pw");
							}
							int chk = 0;	// 탈퇴 여부
							
							if(check.equals("탈퇴 희망") && dbPW.equals(PW)){
								DB.deleteBasketForDeleteUser(id);	// 장바구니 삭제
								DB.updateOrdersForDeleteUser(id);	// order테이블의 uid를 null로 변경(외래키 문제 해결)
								DB.updateCancelForDeleteUser(id);	// cancel테이블의 uid를 null로 변경(외래키 문제 해결)
								chk = DB.deleteUser(id);
							} else{
								out.println("<h3>비밀번호 혹은 확인 메시지를 잘못 입력하였습니다.</h3>");
							}
							
							if(chk == 1){
								session.invalidate();	// 세션 삭제
								out.println("<h3>회원 탈퇴되었습니다.<br />지금까지 이용해 주셔서 감사합니다.</h3>");
							} else {
								out.println("<h3>탈퇴 진행 중 실패하였습니다.<br />관리자에게 문의해주세요.</h3>");
							}
							
						}
						%>
					</td>
				</tr>
				
			</table>
		 </div>

	</body>
</html>