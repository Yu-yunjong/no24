<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-27 08:01)

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
							try {
								// ���޹��� ��
								request.setCharacterEncoding("euc-kr");
								String ono = (String) request.getParameter("ono");
								int score = Integer.parseInt(request.getParameter("score"));
								String reviewContent = (String) request.getParameter("reviewContent");
								
								DB.loadConnect();
						 		int check = DB.updateReview(ono, score, reviewContent);
						 		
						 		if(check == 1) {
						 			out.println("<script> alert(\"�ۼ��� ���䰡 ��ϵǾ����ϴ�.\"); location.href='orderList.jsp'; </script>");
						 		}
							} catch(Exception e) {
								out.println("<script> alert(\"�߸��� ���� ���޵Ǿ����ϴ�. ���ڸ� �Է� �����մϴ�.\"); window.history.go(-1); </script>");
							}
							%>
						</td>
				</table>
			 </div>
	   </form>
	   
	   <%			
		} 	// if�� ��ȣ�ݱ�%>
	</body>
</html>