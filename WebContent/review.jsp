<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-27 12:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>���� �ۼ�</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left"/>
		<h1 id="logotext">���� �ۼ�</h1><br/>
		
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
		<form action = "reviewProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>�� ���� �ۼ�</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
					<tr>
						<td>
							<%
							// ���޹��� ��
							request.setCharacterEncoding("euc-kr");
							String ono = (String) request.getParameter("ono");
							
							// DB ��ȸ�ؼ� �α����� ����� ������ ono�� �ֹ��ڰ� ��ġ�ϴ��� Ȯ��(get������� ���޵ǹǷ�, ������ ���� ����)
							DB.loadConnect();
					 		int check = DB.selectUidWithOnoOrders(id, ono);
					 		
					 		if(check != 1){
					 			out.println("<script> alert(\"�α��� ����ڿ� �ֹ� ������ ��ġ���� �ʽ��ϴ�. �ùٸ� ��η� �������ּ���.\"); window.history.go(-1); </script>");
					 		}
					 		
					 		ResultSet rs = DB.selectOnoOrders(ono);
					 		String score = null;
					 		if(rs.next()) {
					 			score = rs.getString("score");
					 		}
					 		
					 		if(score != null) {
					 			out.println("<script> alert(\"�̹� ���䰡 ��ϵ� ��ǰ�Դϴ�.\"); window.history.go(-1); </script>");
					 		}
					 		
					 		// hidden�Ӽ����� �� �ѱ��
					 		out.println("<input type=\"text\" hidden name=\"ono\" value=\"" + ono + "\">");
							%>
							
							����: 
						</td>
					 	<td>
							<input type="radio" name="score" value=5 required="required">�ڡڡڡڡ�<br/>
							<input type="radio" name="score" value=4 required="required">�ڡڡڡ�<br/>
							<input type="radio" name="score" value=3 required="required">�ڡڡ�<br/>
							<input type="radio" name="score" value=2 required="required">�ڡ�<br/>
							<input type="radio" name="score" value=1 required="required">��
						</td>
					</tr>
					<tr>
						<td>
							��: 
						</td>
					 	<td>
							<textarea name="reviewContent" placeholder="���� ���ƿ�!" required="required" style="width:200px; height:80px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<br/><br/><input type = "submit" id="submit-btn" value = "���" style="width:50pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
				</table>
			 </div>
	   </form>
	   
	   <%			
		} 	// if�� ��ȣ�ݱ�%>
	</body>
</html>