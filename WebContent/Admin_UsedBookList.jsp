<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-27 23:31)

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
		<title>�߰� ��û ���� ��ȸ</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">������ �޴�</h1><br/>
		
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
		
		<!-- ���� ���� �߰� -->
		<form action = "Admin_UsedBookListProcess.jsp" method ="POST">
			<div id="mainbox2">
				<h2><b>�� ���� ��� > �߰� ��û ���� ��ȸ</b></h2>
				<table border="3" width="1500" >
					<tr bgcolor=#CCCCCC><td><h2>����</h2></td><td><h2>��û��ȣ</h2></td><td><h2>��ǰ��</h2></td>
					<td><h2>��û�ð�</h2></td><td><h2>ī�װ�</h2></td><td><h2>�̹���</h2></td><td><h2>����</h2></td><td><h2>��� ����</h2></td>
					<td><h2>��ϻ���</h2></td><td><h2>�ݷ� ����</h2></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					if(id == null)
						out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					else {
						DB.loadConnect();
						ResultSet rs = DB.selectAllRequest();
						int rowsCount = DB.rowsCount(rs);
						
						String reqno[] = new String[rowsCount], uid[] = new String[rowsCount], category[] = new String[rowsCount], rname[] = new String[rowsCount], 
								author[] = new String[rowsCount], img[] = new String[rowsCount], reldate[] = new String[rowsCount], rtime[] = new String[rowsCount], 
								rstate[] = new String[rowsCount], reason[] = new String[rowsCount];
						int amount[] = new int[rowsCount], price[] = new int[rowsCount];
						int i = 0;	// �ε���
						while(rs.next()) {
							reqno[i] = rs.getString("reqno");
							uid[i] = rs.getString("uid");
							category[i] = rs.getString("category");
							rname[i] = rs.getString("rname");
							author[i] = rs.getString("author");
							img[i] = rs.getString("image");
							reldate[i] = rs.getDate("reldate").toString();
							rtime[i] = rs.getDate("rtime").toString();
							rstate[i] = rs.getString("rstate");
							reason[i] = rs.getString("reason");
							amount[i] = rs.getInt("amount");
							price[i] = rs.getInt("price");
							i++;
						}
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><input type=\"radio\" name=\"select\" value=\"" + reqno[i] + "\" required=\"required\"></td>");
							out.println("<td><h3>" + reqno[i] + "</h3></td>");
							out.println("<td><h3>" + rname[i] + "</h3></td>");
							out.println("<td><h3>" + rtime[i] + "</h3></td>");
							out.println("<td><h3>" + category[i] + "</h3></td>");
							out.println("<td><img width=\"170\" src=\"" + img[i] + "\"></td>");
							out.println("<td><h3>" + price[i] + "</h3></td>");
							out.println("<td><h3>" + amount[i] + "</h3></td>");
							out.println("<td><h3>" + rstate[i] + "</h3></td>");
							out.println("<td><h3>" + reason[i] + "</h3></td></tr>");
						}
						
						%>
					<%} // else�� ��ȣ �ݱ�%>
				</table>
				<br/>
				<div>
				 	<table>
						<tr>
							<td>
								<select name="state">
									<option value="��Ͽ�û">��Ͽ�û</option>
									<option value="�ɻ���">�ɻ���</option>
									<option value="��ϵ�">��ϵ�</option>
									<option value="�ݷ�">�ݷ�</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<textarea name="reason" placeholder="�ݷ��� ��츸 �Է�. (xx������ �ջ�)" required="required" style="width:200px; height:80px"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="right">
								<br/><br/><input type = "submit" id="submit-btn" value = "����" style="width:50pt;height:30pt; font-size: 14pt;" >
							</td>
						</tr>
					</table>
				 </div>
			 </div>
	   </form>
	</body>
</html>