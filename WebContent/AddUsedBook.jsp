<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-22 18:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>중고도서 등록요청</title>
		
		<!-- Internet Explorer에서 <input type="date"> 미지원 해결(jQuery 사용) -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
			// 현재 연도 구하기
			var now = new Date();
			var year = now.getFullYear();
			
			// 상세설정
			$.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        changeYear: true,
                changeMonth: true,
                yearRange: '1970:year', // 현재 표시된 연도 기준으로, 뒤, 앞으로 어떤 범위에서 선택할지 설정
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		    });
			
			$( function() {
			    $( "#date" ).datepicker();
			  } );
		</script>
		<!-- 날짜 지원 끝 -->
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- 상단 메뉴 영역 -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html" />
		<h1 id="logotext">마이페이지</h1><br/>
		
		<!-- 서브메뉴 추가(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- 메인 상자 추가 -->
		<form action = "AddUsedBookProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>◈ 중고도서 > 등록 요청</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
					<%
					String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
					if(id == null)
						out.println("<tr><td><h3>로그인 후 다시 시도하시기 바랍니다.</h3></td></tr>");
					else {
					%>
					<tr>
						<td>
							분류: 
						</td>
					 	<td>
							중고도서
						</td>
					</tr>
					<tr>
						<td>
							카테고리: 
						</td>
					 	<td>
							<select name="category" required>
								<option value="none">--- 선택 ---</option>
								<%
								String[] bookList = { "어린이", "건강/취미", "경제/경영", 
										"인문/사회", "대학교재", "만화", "라이트노벨", "판타지", 
										"소설", "여행", "역사", "자기계발", "IT 모바일", "참고서" };
								for(int i = 0; i < bookList.length; i++) {
									out.println("<option value=\"" + bookList[i] + "\">" + bookList[i] + "</option>");
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							상품명: 
						</td>
					 	<td>
							<input type="text" name="pname" required />
						</td>
					</tr>
					<tr>
						<td>
							저자/작곡가: 
						</td>
					 	<td>
							<input type="text" name="author" required />
						</td>
					</tr>
					<tr>
						<td>
							출판일/발매일: 
						</td>
					 	<td>
							<input type="text" name="date" id="date" required />
						</td>
					</tr>
					<tr>
						<td>
							가격: 
						</td>
					 	<td>
							<input type="text" name="price" required />
						</td>
					</tr>
					<tr>
						<td>
							수량: 
						</td>
					 	<td>
							<input type="text" name="amount" required />
						</td>
					</tr>
					<tr>
						<td>
							상품 이미지: 
						</td>
					 	<td>
					 		<iframe id="fileupload" src="FileUpload.html"></iframe>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<br/><br/><input type = "submit" id="submit-btn" value = "등록요청" style="width:100pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
					<%} // else문 괄호 닫기%>
				</table>
			 </div>
	   </form>
	</body>
</html>