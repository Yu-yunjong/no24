<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-25 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>�ֹ� ������ �Է�</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left"/>
		<h1 id="logotext">�ֹ� ������ �Է�</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<%
		String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�

		
		if(id == null){
			out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���!\"); window.history.go(-1); </script>");
		}
		else {
		%>
		
		<!-- ���� ���� �߰� -->
		<form action = "orderProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>�� �ֹ� ������</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
					<tr>
						<td>
							<%
							// ���޹��� �� �ٽ� �ѱ�� ���� �۾�(hidden)
							// ���޹��� ��
							request.setCharacterEncoding("euc-kr");
							try {
								String bno[] = request.getParameterValues("selectBno");
								for(int i = 0; i < bno.length; i++) {
									out.println("<input type=\"checkbox\" name=\"selectBno\" checked=\"checked\" hidden=\"hidden\" value=\""+ bno[i] +"\">");
								}
							} catch(Exception e) {
								out.println("<script> alert(\"�ֹ��� �׸��� �������ּ���!\"); window.history.go(-1); </script>");
							}
							%>
						
							�������: 
						</td>
					 	<td>
							<input type="radio" name="omethod" value="ī��" checked="checked" required="required">ī��
							<input type="radio" name="omethod" value="�������Ա�" required="required">�������Ա�
						</td>
					</tr>
					<tr>
						<td>
							ī���ȣ or<br/>���¹�ȣ: 
						</td>
					 	<td>
							<input type="text" name="opayment" required="required">
						</td>
					</tr>
					<tr>
						<td>
							�ּ�: 
						</td>
					 	<td>
					 		<%
					 		DB.loadConnect();
					 		ResultSet rs = DB.selectUserInfo(id);
					 		String address = null;
					 		if(rs.next()) {
					 			address = rs.getString("address");
					 		}
					 		out.println("<textarea name=\"address\" required=\"required\" style=\"width:200px; height:80px\">" + address +"</textarea>");
					 		%>
						</td>
					</tr>
					<tr>
						<td>
							��� �޸�: 
						</td>
					 	<td>
							<textarea name="memo" placeholder="���ǿ� �ð��ּ���." style="width:200px; height:80px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<br/><br/><input type = "submit" id="submit-btn" value = "����" style="width:50pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
				</table>
			 </div>
	   </form>
	   
	   <%			
		} 	// �α��� if�� ��ȣ�ݱ�%>
	</body>
</html>