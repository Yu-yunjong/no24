<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-22 21:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>중고도서 등록요청</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>   

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left"/>
		<h1 id="logotext">마이페이지</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<%
		String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
		DB.loadConnect();// DB 연결
		
		// 전달받은 값
		request.setCharacterEncoding("euc-kr");
		String group = "중고도서";
		String category = (String) request.getParameter("category");
		String pname = (String) request.getParameter("pname");
		String author = (String) request.getParameter("author");
		String strDate = (String) request.getParameter("date");
		String strPrice = (String) request.getParameter("price");
		String strAmount = (String) request.getParameter("amount");
		
		String imgName = (String) session.getAttribute("imgName");
		%>
		
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<h2><b>◈ 중고도서 > 등록 요청</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						// 다음 상품번호 조회
						ResultSet rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='reqno';");
						String serial = null;
						while(rs.next()){
							serial = "r" + rs.getString("serial");
						}
						
						if(category == null)
							out.println("<h3>로그인 후 다시 시도하시기 바랍니다.</h3>");
						else {
							// 날짜 값을 Date 형식으로 변환(+ 예외처리)
							// 수량, 가격은 int로 캐스팅(입력된 값이 숫자가 아닌 경우 예외처리)
							Date date = null;
							int amount = 0;
							int price = 0;
							try {
								date = java.sql.Date.valueOf(strDate);
								amount = Integer.parseInt(strAmount);
								price = Integer.parseInt(strPrice);
								
								if(imgName == null)
									out.println("<h3>이미지 파일을 첨부 후, 다시 상품을 등록해주세요.</h3>");
								else if(category.equals("none"))
									out.println("<h3>카테고리 선택 후, 다시 상품을 등록해주세요.</h3>");
								else {
									int count = 0;
									String imgRoute = "img/" + imgName;	// 이미지 경로 입력
									count = DB.insertUsedBook(serial, id, category, pname, author, amount, price, date, imgRoute);
									
									if(count == 1){
										DB.updateNextSerial("reqno");
										String sql = "SELECT * FROM request WHERE reqno = '" + serial + "'";
										rs = null;	// 초기화
								        rs = DB.selectQuery(sql);
										
										// 파일 이름 삭제
										session.removeAttribute("imgName");
								        
								        // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
								        out.println("<h3>입력한 상품이 등록되었습니다.</h3>");
								        request.setAttribute("title", "** 등록된 중고도서 **"); 	        
								        request.setAttribute("RS", rs);
								        
								     	// 새로운 페이지 호출하여 수행하기
								        request.getRequestDispatcher("listRS.jsp").forward(request, response);
									}
								}
							} catch(java.lang.NumberFormatException e) {
								out.println("<h3>'수량'이나 '가격'에 잘못된 값이 입력이 잘못되었습니다. (숫자만 입력 가능)<br/>확인 후 다시 등록해주세요.</h3>");
							} catch(java.lang.IllegalArgumentException e) {
								out.println("<h3>날짜에 잘못된 값이 입력이 잘못되었습니다.<br/>확인 후 다시 등록해주세요.</h3>");
							} catch(Exception e) {
								e.printStackTrace();
								out.println("<h3>기타 오류가 발생했습니다.<br/>확인 후 다시 등록해주세요.</h3>");
							}
						}
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>