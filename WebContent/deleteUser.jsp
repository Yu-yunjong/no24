<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-21 19:03)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>ȸ�� Ż��</title>
	</head>
		<body bgcolor="E7F5EF">
		
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>
		
		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html" />
		<h1 id="logotext">ȸ�� Ż��</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<h2><b>�� �� ���� > ȸ�� Ż��</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						int group = 0;
						try {
							group = Integer.parseInt(session.getAttribute("group").toString());
						} catch(Exception e) {	// �α������� ������ null���̱� ������, int�� ĳ�������� ���ؼ� ���� �߻�.
							out.println("<h3>�α��� �� �̿����ּ���.</h3>");
						}
						
						if(group == 1) {
							out.println("<h3>������ no24�� Ż���Ͻǰǰ���? �Ф�</h3>");
							out.println("<h3>Ż���ϸ� �׵��� <b><u>�̿볻���� ������ ��� ������ϴ�.</u></b></h3>");
						} else if(group == 10) {
							out.println("<h3>�����ڴ� Ż���� �� �����ϴ�.</h3>");
						}
						%>
					</td>
				</tr>
				<tr>
					<td>
						<%
						if(group == 1) {
							out.println("<h3>ȸ�� Ż�� ���Ͻø� �Ʒ� Ȯ�� ĭ�� [Ż�� ���]�� �Է����ּ���.</h3>");
							
						%>
						<form action="deleteUserProcess.jsp" method ="POST">
							Ȯ��: <input type="text" name="check"> <br/>
							��й�ȣ: <input type="password" name="pw"> <br /><br /><br />
							<input type = "submit" id="submit-btn" value = "Ż��" style="width:50pt;height:30pt; font-size: 14pt;" >
						</form>
						<%
						}
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>