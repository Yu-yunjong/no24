<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-18 18:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, 
    java.util.Enumeration, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, 
    com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>업로드 체크</title>
	</head>
	<body>
		<%
		String saveDir = "D:\\_DBP 실습\\팀프로젝트\\no24\\WebContent\\img";	// 저장 경로 설정!!
		//ServletContext context = getServletContext();
		//String saveDir = context.getRealPath("/img"); //경로
		System.out.println("업로드 경로 >> " + saveDir);
		int size = 1024 * 1024 * 5; // 최대 5MB
		String fileName = "";
		
		try {
			MultipartRequest m = new MultipartRequest(request, saveDir, size, "EUC-KR", new DefaultFileRenamePolicy());
			Enumeration files = m.getFileNames();
			String str = (String) files.nextElement();
			
			fileName = m.getFilesystemName(str);
			%>
			<script>
				alert("업로드 완료.");
				setTimeout(function() {
					window.open('','_self').close();// 현재 창 종료
					}, 200);
			</script>
			<%
			session.setAttribute("imgName", fileName);// 내장객체에 파일이름을 저장
			System.out.println(application.getAttribute("imgName"));
		} catch(Exception e) {
			System.out.println("!!!!!!!!! 파일 업로드 오류 !!!!!!!!!!");
			System.out.println("!저장 경로를 설정해주세요(UploadOk.jsp)!");
			%>
			<script>
				alert("업로드 실패!!\n저장 경로를 설정해주세요. (UploadOk.jsp)");
				setTimeout(function() {
					window.open('','_self').close();// 현재 창 종료
					}, 200);
			</script>
			<%
		}
		%>
	</body>
</html>