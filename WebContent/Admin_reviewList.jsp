<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-29 06:01)

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
		<title>���� ��ȸ/����</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">���� ��ȸ/����</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<form action = "" method ="POST">
			<div id="mainbox3">
				<h2><b>�� �ֹ� ���� > ���� ��ȸ/����</b></h2>
				
				<%// ������ ���̵����� �˻�
				int group = 0;
				try {
					group = Integer.parseInt(session.getAttribute("group").toString());// ȸ���׷� ��ȸ
				} catch(Exception e){
					out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); location.href=\"index.jsp\"; </script>");
				}
				
				if(group != 10) {
					out.println("<script> alert(\"�����ڸ� ��� ������ �������Դϴ�.\"); location.href=\"index.jsp\"; </script>");
				}
				%>
				
				<table border="3" width="900" >
					<tr bgcolor=#CCCCCC><td><h3>�ֹ���ȣ</h3></td><td><h3>��ID</h3></td></td><td><h3>��ǰ��</h3></td><td><h3>����</h3></td><td><h3>��</h3></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					if(id == null)
						out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllOrdersForReviewNotNull();
						int rowsCount = DB.rowsCount(rs);
						
						String ono[] = new String[rowsCount], uid[] = new String[rowsCount], pname[] = new String[rowsCount], 
								reviewContent[] = new String[rowsCount], scoreStar[] = new String[rowsCount];
						int score[] = new int[rowsCount];
						
						for(int i = 0; i < rowsCount; i++)
							scoreStar[i] = "";	// �������� �ʱ�ȭ
						
						int i = 0;	// �ε���
						while(rs.next()) {
							ono[i] = rs.getString("ono");
							uid[i] = rs.getString("uid");
							pname[i] = rs.getString("pname");
							score[i] = rs.getInt("score");
							for(int j = 0; j < score[i]; j++) {
								scoreStar[i] = scoreStar[i] + "��";
							}
							reviewContent[i] = rs.getString("reviewContent");
							i++;
						}
						
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + ono[i] + "</h4></td>");
							out.println("<td><h4>" + uid[i] + "</h4></td>");
							out.println("<td><h4>" + pname[i] + "</h4></td>");
							out.println("<td><h4>" + scoreStar[i] + "</h4></td>");
							out.println("<td><h4>" + reviewContent[i] + "</h4></td></tr>");
						}
						
						%>
					<%} // else�� ��ȣ �ݱ�%>
				</table>
			 </div>
	   </form>
	</body>
</html>