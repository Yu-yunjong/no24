<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-27 18:03)

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
		<title>��û���� ��ȸ</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��û���� ��ȸ</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<form action = "" method ="POST">
			<div id="mainbox3">
				<h2><b>�� �߰������ > ��û ���� ��ȸ</b></h2>
				<table border="3" width="1400" >
					<tr bgcolor=#CCCCCC><td><h3>��Ϲ�ȣ</h3></td><td><h3>�з�</h3></td><td><h3>ī�װ�</h3></td><td><h3>��ǰ��</h3></td>
					<td><h3>����</h3></td><td><h3>�߸���</h3></td><td><h3>��ǰ�̹���</h3></td><td><h3>��Ͻð�</h3><td><h3>��ϻ���</h3></td><td><h3>�ݷ�����</h3></td></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					if(id == null)
						out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectRequestUid(id);
						int rowsCount = DB.rowsCount(rs);
						
						String reqno[] = new String[rowsCount], rgroup[] = new String[rowsCount], 
								category[] = new String[rowsCount], rname[] = new String[rowsCount], author[] = new String[rowsCount], rtime[] = new String[rowsCount], 
								reldate[] = new String[rowsCount], image[] = new String[rowsCount], rstate[] = new String[rowsCount], reason[] = new String[rowsCount];
						int amount[] = new int[rowsCount], price[] = new int[rowsCount];
						
						int i = 0;	// �ε���
						while(rs.next()) {
							reqno[i] = rs.getString("reqno");
							rgroup[i] = rs.getString("rgroup");
							category[i] = rs.getString("category");
							rname[i] = rs.getString("rname");
							price[i] = rs.getInt("price");
							reldate[i] = rs.getDate("reldate").toString();
							rtime[i] = rs.getDate("rtime").toString();
							amount[i] = rs.getInt("amount");
							image[i] = rs.getString("image");
							rstate[i] = rs.getString("rstate");
							reason[i] = rs.getString("reason");
							i++;
						}
						
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + reqno[i] + "</h4></td>");
							out.println("<td><h4>" + rgroup[i] + "</h4></td>");
							out.println("<td><h4>" + category[i] + "</h4></td>");
							out.println("<td><h4>" + rname[i] + "</h4></td>");
							out.println("<td><h4>" + price[i] + "</h4></td>");
							out.println("<td><h4>" + reldate[i] + "</h4></td>");
							out.println("<td><img width=\"170\" src=\""+ image[i] +"\"></td>");
							out.println("<td><h4>" + rtime[i] + "</h4></td>");
							out.println("<td><h4>" + rstate[i] + "</h4></td>");
							out.println("<td><h4>" + reason[i] + "</h4></td></tr>");
						}
						
						%>
					<%} // else�� ��ȣ �ݱ�%>
				</table>
			 </div>
	   </form>
	</body>
</html>