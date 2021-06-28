<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-16 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>������ - ���� ����</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>    

		<!-- ��� �ΰ� ���� -->
		<a href="index.html"><img id="logoimg" src="img/no24.png" width=220 height=90 align="left" /></a>
		<h1 id="logotext">������ �޴�</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<%
		int group = 0;
		try {
			group = Integer.parseInt(session.getAttribute("group").toString());// ȸ���׷� ��ȸ
		} catch(Exception e){
			out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); location.href=\"index.jsp\"; </script>");
		}
		
		if(group != 10) {
			out.println("<script> alert(\"�����ڸ� ��� ������ �������Դϴ�.\"); location.href=\"index.jsp\"; </script>");
		}
		
		DB.loadConnect();
		
		// DB���� ���� ������ ��� ��ȸ
		String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
		
		ResultSet rs = DB.selectUserInfo(id);
		String name = null, phone = null, birthday = null, email = null, address = null, 
				regdate = null, lastlogin = null;
		while(rs.next()){
			name = rs.getString("uname");
			birthday = rs.getString("birthday");
			phone = rs.getString("phone");
			email = rs.getString("email");
			address = rs.getString("address");
			regdate = rs.getString("regdate");
			lastlogin = rs.getString("lastlogin");
		}
		
		
		%>
		
		<!-- ���� ���� �߰� -->
		<form action = "Admin_ChangeInfoProcess.jsp" method ="POST">
			<div id="mainbox" >
			
				<h2><b>�� �� ���� > ���� ����</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
			
					<tr>
						<td>
							<%
							if(id == null){
								%>
								<h3>�α��� �� �̿����ּ���.</h3>
								<%
							}
							else{
							// ���� ������
							String birthdayCombo[] = birthday.split("-");
							
							%>
							���̵�: 
						</td>
					 	<td>
							<% out.println(id); %>
						</td>
					</tr>
					<tr>
						<td>
							��й�ȣ: 
						</td>
					 	<td>
							<input type="password" id="pw" name="pw">
						</td>
					</tr>
					<tr>
						<td>
							�̸�: 
						</td>
					 	<td>
							<% out.println(name); %>
						</td>
					</tr>
					<tr>
						<td>
							�޴���: 
						</td>
					 	<td>
							<% out.println("<input type=\"text\"name=\"phone\" value=\"" + phone +"\">"); %>
						</td>
					</tr>
					<tr>
						<td>
							�̸���: 
						</td>
					 	<td>
							<% out.println("<input type=\"text\"name=\"email\" value=\"" + email +"\">"); %>
						</td>
					</tr>
					<tr>
						<td>
							�������: 
						</td>
					 	<td>
							<select name="year">
								<option value="none">��</option>
								<%
								for(int i = 1920; i < 2021; i++) {
									// ������� �� ����
									if(i == Integer.parseInt(birthdayCombo[0]))
										out.println("<option value=" + i + " + selected>" + i + "</option>");
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								
								%>
							</select>
							<select name="month">
								<option value="none">��</option>
								<%
								for(int i = 1; i <= 12; i++) {
									// ������� �� ����
									if(i == Integer.parseInt(birthdayCombo[1]))
										out.println("<option value=" + i + " + selected>" + i + "</option>");
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
							<select name="day">
								<option value="none">��</option>
								<%
								for(int i = 1; i <= 31; i++) {
									// ������� �� ����
									if(i == Integer.parseInt(birthdayCombo[2]))
										out.println("<option value=" + i + " + selected>" + i + "</option>");
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							�ּ�: 
						</td>
					 	<td>
							<%
							// �ּ� ���� null�� ���, �� ĭ���� ǥ��
							if(address == null)
								out.println("<input type=\"text\"name=\"address\" value=\"\">");
							else
								out.println("<input type=\"text\"name=\"address\" value=\"" + address +"\">");
							%>
						</td>
					</tr>
					<tr>
						<td>
							ȸ������ ����: 
						</td>
					 	<td>
							<% out.println(regdate); %>
						</td>
					</tr>
					<tr>
						<td>
							�ֱ� �α��� ����: 
						</td>
					 	<td>
							<% out.println(lastlogin); %>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<span id="pwcheck"></span>
							<br/><br/><input type = "submit" id="submit-btn" value = "����" style="width:50pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
					<%
				}// �α��� Ȯ�� ��ȣ �ݱ�.
					%>
				</table>
			 </div>
	   </form>
	</body>
</html>