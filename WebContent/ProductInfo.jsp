<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-23 09:01)

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
		<title>��ǰ ������</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��ǰ ������</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<%
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
		
		<%
		//session.setAttribute("pno", "p5");	// �ӽ÷� �߰�. ��ǰ �߰�
		//String pno = (String) session.getAttribute("pno");
		String pno = (String) request.getParameter("pno");
		
		String pgroup = null, category = null, pname = null, 
				author = null, img = null, date = null;
		int amount = 0, price = 0;
		%>
		
		<!-- ���� ���� �߰� -->
		<form action = "ProductInfoProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>�� ��ǰ ������</b></h2>
				<div id="leftTable">
					<table border=3 cellspacing=2 cellpadding=2 >
						<%
						String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
						if(id == null)
							out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
						else {
							DB.loadConnect();
							ResultSet rs = DB.selectProductInfo(pno);
							while(rs.next()) {
								pgroup = rs.getString("pgroup");
								category = rs.getString("category");
								pname = rs.getString("pname");
								author = rs.getString("author");
								img = rs.getString("image");// �ѱ��̹��� �ȶߴ� ���, server.xml���� URIEncording="UTF-8" �߰� �ʿ�
								date = rs.getDate("reldate").toString();
								amount = rs.getInt("amount");
								price = rs.getInt("price");
							}
						%>
						<tr>
							<td colspan="2" style="text-align: center;" >
								<%out.println("<img width=\"170\" src=\""+ img +"\">"); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								�׷�: 
							</td>
						 	<td>
								<%out.println(pgroup); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								ī�װ�: 
							</td>
						 	<td>
								<%out.println(category); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								��ǰ��: 
							</td>
						 	<td>
								<%out.println(pname); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								����/�۰: 
							</td>
						 	<td>
								<%out.println(author); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								������/�߸���: 
							</td>
						 	<td>
								<%out.println(date); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								����: 
							</td>
						 	<td>
								<%out.println(price); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								��� ����: 
							</td>
						 	<td>
								<%out.println(amount); %>
							</td>
						</tr>
						<tr>
							<td bgcolor=#CCCCCC>
								���� ����: 
							</td>
						 	<td>
						 		<%out.println("<input type=\"text\" name=\"pno\" value=\"" + pno + "\" hidden>");%>
						 		<%out.println("<input type=\"text\" name=\"price\" value=\"" + price + "\" hidden>");%>
						 		<%out.println("<input type=\"text\" name=\"nowAmount\" value=\"" + amount + "\" hidden>");%>
								<input type="text" name="amount" required="required">
							</td>
						</tr>
						<tr>
							<td colspan=2 align="right">
								<input type = "submit" id="submit-btn" value = "��ٱ��� ���" style="width:150pt;height:30pt; font-size: 14pt;" >
							</td>
						</tr>
						<%} // else�� ��ȣ �ݱ�%>
					</table>
				</div>
					<div id="rightTable">
						<table border=3 cellspacing=2 cellpadding=2 width="500" >
								<%
								ResultSet rs = DB.selectReviewPno(pno);
								int rowsCount = DB.rowsCount(rs);
								String reviewContent[] = new String[rowsCount], uid[] = new String[rowsCount], 
										 scoreStar[] = new String[rowsCount];
								int score[] = new int[rowsCount];
								int i = 0;
								
								for(int j = 0; j < rowsCount; j++) {
									scoreStar[j] = "";
								}
								
								while(rs.next()) {
									uid[i] = rs.getString("uid");
									reviewContent[i] = rs.getString("reviewContent");
									score[i] = rs.getInt("score");
									for(int j = 0; j < score[i]; j++) {
										scoreStar[i] = scoreStar[i] + "��";
									}
									i++;
								}
								
								if(rowsCount == 0) {
									out.println("<tr><td><h3>���� ��ϵ� ����/�򰡰� �����ϴ�.<br/>�������� �򰡸� ��ٸ��Կ�~</h3></td></tr>");
								} else {
									%>
							<tr bgcolor=#CCCCCC>
								<td>ȸ�����̵�</td><td>����</td><td>��</td>
							</tr>
									<%
									for(i = 0; i < rowsCount; i++) {
										out.println("<tr><td>" + uid[i] + "</td>");
										out.println("<td>" + scoreStar[i] + "</td>");
										out.println("<td>" + reviewContent[i] + "</td></tr>");
									}
								}
								%>
						</table>
					</div>
				</div>
	   </form>
	</body>
</html>