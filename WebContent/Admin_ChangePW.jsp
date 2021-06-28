<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.1 (2021-05-16 15:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>관리자-비밀번호 변경</title>
	</head>
	<body>
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
		
			// 전달받은 값
			request.setCharacterEncoding("euc-kr");
			String newPW = (String) request.getParameter("newPW");
			String currentPW = EncriptPassword.encriptPassword((String) request.getParameter("nowPW"));
			
			DB.loadConnect();
			
			// DB에서 현재 관리자 비번 조회
			String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
			
			ResultSet rs = DB.selectCurrentPW(id);
			String inputPW = null;
			while(rs.next()){
				inputPW = rs.getString("pw");
			}
			
			// 직접 실행하면 오류 발생하도록
			if(id == null){
		%>
				<script type="text/javascript">
					alert('로그인 후 다시 시도해주세요.');
					setTimeout(function() {
						window.location.href = 'Admin_ChangePW.html';	// 리다이렉트: javascript로 사용
						}, 500);
				</script>
		<%
			}
			else{
					System.out.println("current: " + currentPW);
					System.out.println("db pw: " + inputPW);
					if(currentPW.equals(inputPW)){
						if(newPW.equals("")){
							System.out.println("비밀번호가 비어 있습니다.");
					%>
							<script type="text/javascript">
								alert('입력하신 비밀번호가 공백입니다. 확인 후 다시 변경해주세요.');
								// 지연함수 없이 바로 실행하면 경고창 뜨지않고 넘어감.. 이거땜에 2시간 넘게 삽질한듯 ㅡㅡ
								setTimeout(function() {
									window.location.href = 'Admin_ChangePW.html';	// 리다이렉트: javascript로 사용
									}, 500);
							</script>
					<%
								//response.sendRedirect("Admin_ChangePW.html");// 리다이렉트: Java코드로 사용
						}
						else{
							int result = DB.changeAdminPW(id ,EncriptPassword.encriptPassword(newPW));
							if(result == 1) {
								System.out.println("변경완료");
					%>
							<script type="text/javascript">
								alert('비밀번호가 변경되었습니다.');
								// 지연함수 없이 바로 실행하면 경고창 뜨지않고 넘어감.. 이거땜에 2시간 넘게 삽질한듯 ㅡㅡ
								setTimeout(function() {
									window.location.href = 'Admin_ChangePW.html';	// 리다이렉트: javascript로 사용
									}, 500);
							</script>
					<%
								//response.sendRedirect("Admin_ChangePW.html");// 리다이렉트: Java코드로 사용
							}
							else
								System.out.println("변경실패");
						}
					}
					else {
						System.out.println("현재 비밀번호가 잘못 입력되었습니다.");
				%>
						<script type="text/javascript">
							alert('비밀번호 변경 실패!\n현재 비밀번호가 잘못 입력되었습니다.');
							// 지연함수 없이 바로 실행하면 경고창 뜨지않고 넘어감.. 이거땜에 2시간 넘게 삽질한듯 ㅡㅡ
							setTimeout(function() {
								window.location.href = 'Admin_ChangePW.html';	// 리다이렉트: javascript로 사용
								}, 500);
						</script>
				<%
						//response.sendRedirect("Admin_ChangePW.html");// 리다이렉트: Java코드로 사용
				}
			}
			
			
		%>
	</body>
</html>