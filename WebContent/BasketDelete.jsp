<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-26 12:01)

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
		<title>��ٱ��� ��ǰ ����</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��ٱ��� ��ǰ ����</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<div id="mainbox" >
			<h2><b>�� ��ٱ��� ��ǰ ����</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
				if(id == null)
					out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
				else {
					try {
						// ���޹��� ��
						request.setCharacterEncoding("euc-kr");
						String bno[] = request.getParameterValues("selectBno");
						
						int count = 0;
						DB.loadConnect();
						for(int i = 0; i < bno.length; i++) {
							count = count + DB.deleteBasket(bno[i]);
						}
						
						if(count >= 1){
							out.println("<tr><td><h2>��ٱ��Ͽ��� " + count +"���� �׸��� �����Ǿ����ϴ�.</h2></td></tr>");
							// ��ٱ��Ͽ� ���� �׸��� ���ǿ��� pno ����
							session.removeAttribute("pno");
						}
					} catch(Exception e) {
						out.println("<script> alert(\"������ �׸��� �������ּ���!\"); window.history.go(-1); </script>");
					}
				}
				%>

			</table>
		 </div>
	</body>
</html>