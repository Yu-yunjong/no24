<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-16 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>�α׾ƿ�</title>
	</head>
		<body bgcolor="E7F5EF">
		<nav class="menu-1">
		   <ul>
			  <li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="document.location.href='login.html'">�α���</button></li>
			  <li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="document.location.href='signup.html'">ȸ������</button></li>
			<li><button type="button" class="btn btn-primary active" id="btn" 
			onclick="document.location.href='mypage.html'">����������</button></li>
		   </ul>
		 </nav>     

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">�α׾ƿ�</h1><br/>
		

		
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						DB.loadConnect();
						DB.updateLastLogin(id);	// �ֱ� �α��� ���� ������Ʈ
						session.invalidate();
						out.println("<h3>�α׾ƿ� �Ϸ�!<br/>�̿����ּż� �����մϴ�.</h3>");
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>