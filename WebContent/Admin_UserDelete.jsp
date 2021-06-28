<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-31 19:03)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>관리자 - 회원 탈퇴</title>
	</head>
		<body bgcolor="E7F5EF">
		
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>
		
		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html" />
		<h1 id="logotext">관리자 - 회원 탈퇴</h1><br/>
		
		<%// 관리자 아이디인지 검사
		int group = 0;
		try {
			group = Integer.parseInt(session.getAttribute("group").toString());// 회원그룹 조회
		} catch(Exception e){
			out.println("<script> alert(\"로그인 후 다시 시도해주세요.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
		}
		
		if(group != 10) {
			out.println("<script> alert(\"관리자만 사용 가능한 페이지입니다.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
		}
		%>
		
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<h2><b>◈ 회원관리 > 회원 탈퇴</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						
						// 전달받은 값
						request.setCharacterEncoding("euc-kr");
						String userID = request.getParameter("userID");
						
						if(id == null){
							out.println("<h3>로그인 후 이용해주세요.</h3>");
						} else {
							int chk = 0;	// 탈퇴 여부
							
							DB.deleteBasketForDeleteUser(userID);	// 장바구니 삭제
							DB.updateOrdersForDeleteUser(userID);	// order테이블의 uid를 null로 변경(외래키 문제 해결)
							DB.updateCancelForDeleteUser(userID);	// cancel테이블의 uid를 null로 변경(외래키 문제 해결)
							chk = DB.deleteUser(userID);
							
							
							if(chk == 1){
								out.println("<script> alert(\"회원 탈퇴 성공\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
							} else {
								out.println("<h3>회원 탈퇴 처리에 실패하였습니다.<br />관리자에게 문의해주세요.</h3>");
							}
							
						}
						%>
					</td>
				</tr>
				
			</table>
		 </div>

	</body>
</html>