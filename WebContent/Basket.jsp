<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-23 23:01)

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
		<title>��ٱ���</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��ٱ���</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<form action = "BasketChange.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>�� �ֹ� ���� > ��ٱ���</b></h2>
				<table border=3 cellspacing=2 cellpadding=2>
					<%
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					String pno = (String) session.getAttribute("pno");
					if(id == null)
						out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectBasket(id);
						int rowsCount = DB.rowsCount(rs);	// �� ��
						
						String bno[] = new String[rowsCount], pname[] = new String[rowsCount], pnoArr[] = new String[rowsCount], bdate[] = new String[rowsCount];
						int bamount[] = new int[rowsCount], bprice[] = new int[rowsCount], btotal[] = new int[rowsCount];
						int i = 0;
						
						
						while(rs.next()) {
							bno[i] = rs.getString("bno");
							pnoArr[i] = rs.getString("pno");
							pname[i] = rs.getString("pname");
							bdate[i] = rs.getDate("bdate").toString();
							bamount[i] = rs.getInt("bamount");
							bprice[i] = rs.getInt("bprice");
							btotal[i] = rs.getInt("btotal");
							i++;
						}
					%>
					<tr align="middle">
						<td>����</td><td>��ٱ��Ϲ�ȣ</td><td>��ǰ��ȣ</td><td>��ǰ��</td><td>���� ��¥</td><td>����</td><td>�ܰ�</td><td>�հ�</td>
					</tr>
					<%
					for(int j = 0; j < rowsCount; j++) {
						out.println("<tr align=\"middle\"><td><input type=\"checkbox\" name=\"selectBno\" value=\""+ bno[j] +"\"></td>");
						out.println("<td>" + bno[j] + "</td>");
						out.println("<td>" + pnoArr[j] + "</td>");
						out.println("<td>" + pname[j] + "</td>");
						out.println("<td>" + bdate[j] + "</td>");
						out.println("<td>" + bamount[j] + "</td>");
						out.println("<td>" + bprice[j] + "</td>");
						out.println("<td>" + btotal[j] + "</td></tr>");
					}
					%>
					
					<tr>
						<td colspan=8 align="right">
							<input type = "submit" id="submit-btn" value = "����" style="width:70pt;height:30pt; font-size: 14pt;" >
							<input type = "submit" id="submit-btn" value = "����" formaction="BasketDelete.jsp" style="width:70pt;height:30pt; font-size: 14pt;" >
							<input type = "submit" id="submit-btn" value = "�ֹ�" formaction="order.jsp" style="width:70pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
					<%} // else�� ��ȣ �ݱ�%>
				</table>
			 </div>
	   </form>
	</body>
</html>