<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-18 18:01)

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
		<title>���ε� üũ</title>
	</head>
	<body>
		<%
		String saveDir = "D:\\_DBP �ǽ�\\��������Ʈ\\no24\\WebContent\\img";	// ���� ��� ����!!
		//ServletContext context = getServletContext();
		//String saveDir = context.getRealPath("/img"); //���
		System.out.println("���ε� ��� >> " + saveDir);
		int size = 1024 * 1024 * 5; // �ִ� 5MB
		String fileName = "";
		
		try {
			MultipartRequest m = new MultipartRequest(request, saveDir, size, "EUC-KR", new DefaultFileRenamePolicy());
			Enumeration files = m.getFileNames();
			String str = (String) files.nextElement();
			
			fileName = m.getFilesystemName(str);
			%>
			<script>
				alert("���ε� �Ϸ�.");
				setTimeout(function() {
					window.open('','_self').close();// ���� â ����
					}, 200);
			</script>
			<%
			session.setAttribute("imgName", fileName);// ���尴ü�� �����̸��� ����
			System.out.println(application.getAttribute("imgName"));
		} catch(Exception e) {
			System.out.println("!!!!!!!!! ���� ���ε� ���� !!!!!!!!!!");
			System.out.println("!���� ��θ� �������ּ���(UploadOk.jsp)!");
			%>
			<script>
				alert("���ε� ����!!\n���� ��θ� �������ּ���. (UploadOk.jsp)");
				setTimeout(function() {
					window.open('','_self').close();// ���� â ����
					}, 200);
			</script>
			<%
		}
		%>
	</body>
</html>