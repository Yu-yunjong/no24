<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-21 17:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>���� ������</title>
	</head>
		<body bgcolor="E7F5EF">
    	<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">���� ������</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<%
		String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
		
		int group = 0;
		try {
			group = Integer.parseInt(session.getAttribute("group").toString());// ȸ���׷� ��ȸ
		} catch(Exception e){
			System.out.println("�̷α���!!");
		}
		
		if(group == 1){
			out.println("<iframe id=\"sideMenuIframe\" src=\"SubMenu.html\"></iframe>");
		} else if(group == 10){
			out.println("<iframe id=\"sideMenuIframe\" src=\"Admin_SubMenu.html\"></iframe>");
		}
		%>
		<!-- ���� ���� �߰� -->
		<div id="mainbox" >
			<h2><b>�� ���� ������</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
					<% 
					if(group == 0)
						out.println("<h3>�α����� �� �̿����ּ���.</h3>");
					else if(group == 1)
						out.println("<h3>" + id + " ȸ���� �α��� �Ͻ� ���� ȯ���մϴ�!<br/><br/>���� �޴����� �������ּ���!</h3>");
					else if(group == 10)
						out.println("<h3>" + id + " ȸ���� �����ڷ� �α��� �Ͻ� ���� ȯ���մϴ�!<br/>���� �Ϸ絵 ������ ^^<br/><br/>���� �޴����� �������ּ���!</h3>");
					%>
					</td>
				</tr>
			</table>
		 </div>
	</body>
</html>