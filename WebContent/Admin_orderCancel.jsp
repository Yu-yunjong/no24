<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-28 22:01)

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
		<title>������ - �ֹ����� Ȯ��</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">������ - �ֹ����� Ȯ��</h1><br/>
		
		
		<!-- ���� ���� �߰� -->
		<form action = "" method ="POST">
			<div id="mainboxOrderList">
				<h2><b>�� �ֹ� ���� > �ֹ����� ��ȸ/����</b></h2>
				<table border="3" width="1600" >
					<tr bgcolor=#CCCCCC><td><h3>�ֹ���ȣ</h3></td><td><h3>��ǰ��</h3></td><td><h3>����</h3></td>
					<td><h3>�ܰ�</h3></td><td><h3>�� �ݾ�</h3></td><td><h3>�ֹ�����</h3></td><td><h3>�������</h3></td><td><h3>���� ����</h3></td>
					<td><h3>ó�� ��Ȳ</h3></td><td><h3>�����</h3></td><td><h3>���</h3></td></tr>
					<%
					//!!!!!!!!!!!!!!!!!!!!!!�̱���!!!!!!!!!!!!!!!!!!!!!!!!
					out.println("<script> alert(\"���� �������� �ʾҽ��ϴ�.\"); window.history.go(-1); </script>");
					// ������ ���̵����� �˻�
					int group = 0;
					try {
						group = Integer.parseInt(session.getAttribute("group").toString());// ȸ���׷� ��ȸ
					} catch(Exception e){
						out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); location.href=\"index.jsp\"; </script>");
					}
					
					if(group != 10) {
						out.println("<script> alert(\"�����ڸ� ��� ������ �������Դϴ�.\"); location.href=\"index.jsp\"; </script>");
					}
					
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					if(id == null)
						out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllOrders();
						int rowsCount = DB.rowsCount(rs);
						
						String ono[] = new String[rowsCount], pno[] = new String[rowsCount], pname[] = new String[rowsCount], 
								omethod[] = new String[rowsCount], otime[] = new String[rowsCount], opayment[] = new String[rowsCount], 
								ostatus[] = new String[rowsCount], oaddress[] = new String[rowsCount];
						int oamount[] = new int[rowsCount], price[] = new int[rowsCount];
						int i = 0;	// �ε���
						while(rs.next()) {
							pno[i] = rs.getString("pno");
							ono[i] = rs.getString("ono");
							opayment[i] = rs.getString("opayment");
							pname[i] = rs.getString("pname");
							omethod[i] = rs.getString("omethod");
							otime[i] = rs.getDate("otime").toString();
							ostatus[i] = rs.getString("ostatus");
							oaddress[i] = rs.getString("oaddress");
							oamount[i] = rs.getInt("oamount");
							price[i] = rs.getInt("orders.price");
							i++;
						}
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + ono[i] + "</h4></td>");
							out.println("<td><h4>" + pname[i] + "</h4></td>");
							out.println("<td><h4>" + oamount[i] + "</h4></td>");
							out.println("<td><h4>" + price[i] + "</h4></td>");
							out.println("<td><h4>" + oamount[i] * price[i] + "</h4></td>");
							out.println("<td><h4>" + otime[i] + "</h4></td>");
							out.println("<td><h4>" + omethod[i] + "</h4></td>");
							out.println("<td><h4>" + opayment[i] + "</h4></td>");
							out.println("<td><h4>" + ostatus[i] + "</h4></td>");
							out.println("<td><h4>" + oaddress[i] + "</h4></td>");
							out.println("<td><button type=\"button\" onclick=\"javascript:location.href='./Admin_orderChange.jsp?ono=" + ono[i] + "'\">�ֹ� ����</button><br/>");
							out.println("<button type=\"button\" onclick=\"javascript:location.href='./Admin_orderCancel.jsp?ono=" + ono[i] + "'\">�ֹ� ���</button></td></tr>");
						}
						
						%>
					<%} // else�� ��ȣ �ݱ�%>
				</table>
			 </div>
	   </form>
	</body>
</html>