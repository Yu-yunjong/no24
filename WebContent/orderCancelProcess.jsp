<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-27 16:01)

******************************************************** -->

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URISyntaxException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>��ҿϷ�</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��ҿϷ�</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<div id="mainbox" >
			<h2><b>�� �ֹ����</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
				if(id == null)
					out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
				else {
					try{
						// ���޹��� ��
						request.setCharacterEncoding("euc-kr");
						String ono = (String) request.getParameter("ono");
						String whyCancel = (String) request.getParameter("whyCancel");
						
						DB.loadConnect();
						int cnt = DB.insertCancel(ono);	// �ֹ���� ���̺� �ű��
						if(cnt == 1) {
							int cnt1 = DB.updateWhyCancel(ono, whyCancel);
							if(cnt1 == 1) {
								int cnt2 = DB.deleteOrders(ono);
								if(cnt2 == 1) {
									out.println("<tr><td><h3>�����Ͻ� �ֹ��� ��ҵǾ����ϴ�.</h3></td></tr>");
								}
							} else {
								out.println("<tr><td><h3>�ֹ� ��� ���� ��� ����! ������ �ʹ� ����.</h3></td></tr>");
							}
						} else {
							out.println("<tr><td><h3>�ֹ� ��� ����! �����ڿ��� �������ּ���.</h3></td></tr>");
						}
						
						
						
						
					} catch(Exception e) {
						out.println("<script> alert(\"���������� ������� �ʾҽ��ϴ�! �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					}
				}%>
			</table>
		 </div>
	</body>
</html>