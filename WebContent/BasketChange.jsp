<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-26 13:01)

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
		<form action = "BasketChangeProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>�� ��ٱ��� ��ǰ ����</b></h2>
				<table border=3 cellspacing=2 cellpadding=2 >
					<%
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					if(id == null)
						out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
					else {
						try {
							// ���޹��� �� �ٽ� �ѱ�� ���� �۾�(hidden)
							// ���޹��� ��
							String bno[] = null;
							request.setCharacterEncoding("euc-kr");
							
							bno = request.getParameterValues("selectBno");
							for(int i = 0; i < bno.length; i++) {
								out.println("<input type=\"checkbox\" name=\"selectBno\" checked=\"checked\" hidden=\"hidden\" value=\""+ bno[i] +"\">");
							}
							
							String pno[] = new String[bno.length], pname[] = new String[bno.length], bdate[] = new String[bno.length];
							int bamount[] = new int[bno.length], bprice[] = new int[bno.length], btotal[] = new int[bno.length], nowAmount[] = new int[bno.length];
							ResultSet rs = null;
							DB.loadConnect();
							
							for(int i = 0; i < bno.length; i++) {
								rs = DB.selectBnoBasket(bno[i]);
								if(rs.next()) {
									pno[i] = rs.getString("basket.pno");
									pname[i] = rs.getString("pname");
									bdate[i] = rs.getDate("bdate").toString();
									bamount[i] = rs.getInt("bamount");
									bprice[i] = rs.getInt("bprice");
									btotal[i] = rs.getInt("btotal");
								}
							}
							%>
							<tr align="middle">
								<td>��ٱ��Ϲ�ȣ</td><td>��ǰ��ȣ</td><td>��ǰ��</td><td>����</td><td>�ܰ�</td><td>�հ�</td>
							</tr>
							<%
							for(int j = 0; j < bno.length; j++) {
								out.println("<tr align=\"middle\"><td>" + bno[j] + "</td>");
								out.println("<td>" + pno[j] + "</td>");
								out.println("<td>" + pname[j] + "</td>");
								out.println("<td><input type=\"number\" name=\"bamount\" value=\"" + bamount[j] + "\" /></td>");
								out.println("<td>" + bprice[j] + "</td>");
								out.println("<td>" + btotal[j] + "</td></tr>");
								out.println("<input type=\"number\" name=\"bprice\" value=\"" + bprice[j] + "\" hidden=\"hidden\" />");	// �� �Ѱ��ֱ� ����
							}
							
							// ��ٱ��Ͽ� ���� �׸��� ���ǿ��� pno ����
							session.removeAttribute("pno");
							
						} catch(Exception e) {
							out.println("<script> alert(\"������ �׸��� �������ּ���!\"); window.history.go(-1); </script>");
						}
					}
					%>
					<td colspan=6 align="right">
						<br/><br/><input type = "submit" id="submit-btn" value = "����" style="width:50pt;height:30pt; font-size: 14pt;" >
					</td>
				</table>
		 	</div>
		 </form>
	</body>
</html>