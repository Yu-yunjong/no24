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
		<title>내 정보 - 비밀번호 변경</title>
	</head>
	<body>
		<%
			// 전달받은 값
			request.setCharacterEncoding("euc-kr");
			String newPW = EncriptPassword.encriptPassword((String) request.getParameter("newPW"));
			String currentPW = EncriptPassword.encriptPassword((String) request.getParameter("nowPW"));
			
			DB.loadConnect();
			
			// 아이디 설정(로그인한 아이디 읽어오도록 변경해야함.)
			String id = (String) session.getAttribute("userID");	// 아이디 입력 or 로그인한 아이디 조회해서 넣기
			
			ResultSet rs = DB.selectCurrentPW(id);
			String inputPW = null;
			while(rs.next()){
				inputPW = rs.getString("pw");
			}
			
			// 직접 실행하면 오류 발생하도록
			if(newPW.equals(EncriptPassword.encriptPassword(null))){
		%>
				<script type="text/javascript">
					alert('로그인 후 다시 시도해주세요.');
					setTimeout(function() {
						window.location.href = 'ChangePW.html';	// 리다이렉트: javascript로 사용
						}, 500);
				</script>
		<%
			}
			else{
					if(inputPW.equals(currentPW)){
						if(newPW.equals("")){
							System.out.println("비밀번호가 비어 있습니다.");
					%>
							<script type="text/javascript">
								alert('입력하신 비밀번호가 공백입니다. 확인 후 다시 변경해주세요.');
								setTimeout(function() {
									window.location.href = 'ChangePW.html';	// 리다이렉트: javascript로 사용
									}, 500);
							</script>
					<%
						}
						else{
							int result = DB.changeAdminPW(id ,newPW);
							if(result == 1) {
								System.out.println("변경완료");
					%>
							<script type="text/javascript">
								alert('비밀번호가 변경되었습니다.');
								setTimeout(function() {
									window.location.href = 'ChangePW.html';	// 리다이렉트: javascript로 사용
									}, 500);
							</script>
					<%
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
							setTimeout(function() {
								window.location.href = 'ChangePW.html';	// 리다이렉트: javascript로 사용
								}, 500);
						</script>
				<%
				}
			}
			
			
		%>
	</body>
</html>