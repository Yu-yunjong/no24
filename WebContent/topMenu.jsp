<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-26 15:03)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>��� �޴�</title>
	</head>
	<body>
		<nav class="menu-1">
		   <ul>
		   		<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='index.jsp'" target="_parent">Ȩ</button></li>
		   <%
		   String id = (String) session.getAttribute("userID");	// �α��� ���̵�
		   if(id == null){
			   %>
			   <li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='login.html'" target="_parent">�α���</button></li>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='signup.jsp'" target="_parent">ȸ������</button></li>
			   <%
		   } else{
			   %>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='ProductList.jsp'" target="_parent">��ü ��ǰ</button></li>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='logout.jsp'" target="_parent">�α׾ƿ�</button></li>
				<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="window.top.location.href='myPageMain.jsp'" target="_parent">����������</button></li>
			   <%
		   }
		   %>
			
		   </ul>
		</nav>
	</body>
</html>