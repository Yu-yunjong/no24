<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-30 13:01)

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
		<title>ȸ������ ��ȸ/����</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">ȸ������ ��ȸ/����</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<form action = "" method ="POST">
			<div id="mainbox3">
				<h2><b>�� ȸ�� ���� > ȸ������ ��ȸ/����</b></h2>
				
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
				
				<table border="3" width="1200" >
					<tr bgcolor=#CCCCCC><td><h3>��ID</h3></td></td><td><h3>PW(��ȣȭ ����)</h3></td><td><h3>����</h3></td>
					<td><h3>�޴���</h3></td><td><h3>�������</h3></td><td><h3>�̸���</h3></td><td><h3>������</h3></td><td><h3>�ֱٷα���</h3></td><td><h3>���</h3></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					
					if(id == null)
						out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllUser();
						int rowsCount = DB.rowsCount(rs);
						
						String usrID[] = new String[rowsCount], pw[] = new String[rowsCount], name[] = new String[rowsCount], 
								phone[] = new String[rowsCount], birthday[] = new String[rowsCount], email[] = new String[rowsCount], 
								regdate[] = new String[rowsCount], lastlogin[] = new String[rowsCount];

						
						int i = 0;	// �ε���
						while(rs.next()) {
							usrID[i] = rs.getString("id");
							pw[i] = rs.getString("pw");
							name[i] = rs.getString("uname");
							phone[i] = rs.getString("phone");
							birthday[i] = rs.getString("birthday");
							email[i] = rs.getString("email");
							regdate[i] = rs.getString("regdate");
							lastlogin[i] = rs.getString("lastlogin");
							i++;
						}
						
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><h4>" + usrID[i] + "</h4></td>");
							out.println("<td><h4>" + pw[i] + "</h4></td>");
							out.println("<td><h4>" + name[i] + "</h4></td>");
							out.println("<td><h4>" + phone[i] + "</h4></td>");
							out.println("<td><h4>" + birthday[i] + "</h4></td>");
							out.println("<td><h4>" + email[i] + "</h4></td>");
							out.println("<td><h4>" + regdate[i] + "</h4></td>");
							out.println("<td><h4>" + lastlogin[i] + "</h4></td>");
							out.println("<td><button type=\"button\" onclick=\"javascript:location.href='./Admin_UserInfoChange.jsp?userID=" + usrID[i] + "'\">����</button><br/>");
							out.println("<button type=\"button\" onclick=\"javascript:location.href='./Admin_UserDelete.jsp?userID=" + usrID[i] + "'\">Ż��</button></td></tr>");
						}
						
						%>
					<%} // else�� ��ȣ �ݱ�%>
				</table>
			 </div>
	   </form>
	</body>
</html>