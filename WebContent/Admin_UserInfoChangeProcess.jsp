<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-16 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>관리자 - 회원정보 수정</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>     

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">회원정보 수정</h1><br/>
		
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
		
		String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
		
		DB.loadConnect();
		
		// 전달받은 값
		request.setCharacterEncoding("euc-kr");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		String year = (String) request.getParameter("year");
		String month = (String) request.getParameter("month");
		String day = (String) request.getParameter("day");
		String address = (String) request.getParameter("address");
		String userID = (String) request.getParameter("userID");
		
		// 날짜 값을 Date 형식으로 변환
		String strDate = year + "-" + month + "-" + day;
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		if(year!=null || month!=null || day!=null){
			date = java.sql.Date.valueOf(strDate);
		}
		%>
		
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<h2><b>◈ 회원 관리 > 회원정보 수정</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						// 입력한 비번과 DB에 저장된 비번이 일치한지 점검
						if(year == null)
							out.println("<h3>로그인 후 다시 시도하시기 바랍니다.</h3>");
						else {
							int check = 0;
							// 주소 값이 빈칸인 경우 null을 저장하도록
							if(address.equals("")){
								check = DB.updateUserInfo(userID, phone, email, date, null);
							}
							else{
								check = DB.updateUserInfo(userID, phone, email, date, address);
							}
							
							if(check == 1){
								out.println("<script> alert(\"회원정보 변경됨.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
							}
							else
								out.println("<script> alert(\"오류 발생! 확인후 재시도바랍니다.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
								
						}
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>