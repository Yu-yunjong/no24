<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-28 12:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>�߰��û���� ���</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>     

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">������ �޴�</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<%
		String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
		DB.loadConnect();// DB ����
		
		// ���޹��� ��
		request.setCharacterEncoding("euc-kr");
		String group = (String) request.getParameter("group");
		String category = (String) request.getParameter("category");
		String pname = (String) request.getParameter("pname");
		String author = (String) request.getParameter("author");
		String strDate = (String) request.getParameter("date");
		String strPrice = (String) request.getParameter("price");
		String strAmount = (String) request.getParameter("amount");
		
		String imgName = (String) session.getAttribute("imgName");
		%>
		
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<h2><b>�� ��ǰ ��� > �߰��� ��û ó��</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%

						// �̱���..
						if(group == null)
							out.println("<h3>�������� ���� ����Դϴ�.</h3>");
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>